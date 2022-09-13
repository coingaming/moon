defmodule Moon.Components.Select.Helpers do
  @moduledoc false

  def get_formatted_options(options, current_value \\ "") do
    formatted_options =
      Enum.map(options, fn option ->
        {option.label, option.value}
      end)

    if current_value == "" do
      [{"", ""}] ++ formatted_options
    else
      formatted_options
    end
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

  def get_option(options, v) do
    Enum.find(options, fn option -> "#{option.value}" == "#{v}" end)
  end

  def get_active_border_color(class) do
    Regex.run(~r(\bfocus:border.*\b), class)
    |> List.first()
    |> String.split(" ")
    |> List.first()
    |> String.split(":")
    |> List.last()
  end

  def get_padding(size) do
    case size do
      "md" -> "p-2 h-12 leading-4"
      "lg" -> "p-3 h-14 leading-5"
      "xl" -> "p-4 h-16 leading-6"
      # TODO
      _ -> ""
    end
  end

  def innerlabel_font_class(size) do
    case size do
      "md" -> "text-moon-12"
      "lg" -> "text-moon-14"
      "xl" -> "text-moon-16"
      # TODO
      _ -> ""
    end
  end
end
