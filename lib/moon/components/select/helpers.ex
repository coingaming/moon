defmodule Moon.Components.Select.Helpers do
  @moduledoc false

  def get_formatted_options(options) do
    Enum.map(options, fn option ->
      {option.label, option.value}
    end)
  end

  # this is copy-paste and a bit modified from: https://github.com/phoenixframework/phoenix_html/blob/v3.2.0/lib/phoenix_html/form.ex#L1272
  def get_normalized_value(form, field, is_multi, opts) do
    value = get_value(form, field, opts)
    normalize_value(value, is_multi)
  end

  def normalize_value(value, is_multi) do
    if is_multi do
      if value do
        Enum.map(value, fn x -> "#{x}" end)
      else
        []
      end
    else
      "#{value}"
    end
  end

  def get_value(form, field, opts) do
    {value, _opts} = Keyword.pop(opts, :value)

    if value != nil do
      value
    else
      param = "#{field}"

      case form do
        %{params: %{^param => sent}} ->
          sent

        _ ->
          Phoenix.HTML.Form.input_value(form, field)
      end
    end
  end
end
