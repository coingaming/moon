defmodule Moon.Helpers.Form do
  @moduledoc false

  import Phoenix.HTML.Form, only: [input_value: 2]

  @doc "Function for transformin struct|changeset|apply-result => changeset if possible"
  def transfor({:ok, data}), do: transfor(data)
  def transfor({:error, changeset}), do: transfor(changeset)
  def transfor(changeset = %{action: _, changes: _, errors: _, data: _, valid?: _}), do: changeset

  def transfor(struct = %{__struct__: module}) do
    if function_exported?(module, :changeset, 1) do
      module.changeset(struct)
    else
      # sorry, try it by yourself
      struct
    end
  end

  @doc "Function for getting value from assigns or form"
  def get_value(%{value: nil, form: form, field: field}),
    do: Phoenix.HTML.Form.input_value(form, field)

  def get_value(%{value: value}), do: value

  def value_is_true(form, field), do: "#{input_value(form, field)}" == "true"

  def has_error(_form = %{errors: errors}, field) do
    Enum.count(Keyword.get_values(errors || [], field)) > 0
  end

  def has_error(_, _), do: false

  def input_classes(%{size: size, disabled: disabled}) do
    [
      "focus:ring-0 border-0 py-0 px-4 m-0",
      "block w-full max-w-full appearance-none text-[1rem] text-bulma transition-shadow box-border before:box-border after:box-border",
      "relative z-[2] shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none bg-gohan",
      "placeholder:text-trunks placeholder:opacity-100 placeholder:transition-opacity placeholder:delay-75",
      "read-only:outline-0 read-only:border-none read-only:cursor-not-allowed read-only:hover:shadow-input read-only:focus:shadow-input",
      "moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
      "invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
      "leading-8 rounded-moon-i-xs": size == "sm",
      "leading-10 rounded-moon-i-sm": size == "md",
      "leading-[3rem] rounded-moon-i-sm": size == "lg",
      "opacity-30": disabled
    ]
  end
end
