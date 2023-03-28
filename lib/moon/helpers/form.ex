defmodule Moon.Helpers.Form do
  @moduledoc false

  @doc "function for transformin struct|changeset|apply-result => changeset if possible"
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

  @doc "function for getting value from assigns or form"
  def get_value(%{value: nil, form: form, field: field}),
    do: Phoenix.HTML.Form.input_value(form, field)

  def get_value(%{value: value}), do: value
end
