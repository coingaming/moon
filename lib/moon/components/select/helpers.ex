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

  # TODO - remove
  def innerlabel_font_class(size) do
    case size do
      "small" -> "uppercase text-moon-10"
      "medium" -> "text-moon-12"
      "large" -> "text-moon-14"
      "xlarge" -> "text-moon-16"
    end
  end

  def get_padding(size) do
    case size do
      "md" -> "p-2 h-10 leading-4"
      "lg" -> "p-3 h-12 leading-5"
      _ -> "p-4 h-14 leading-6"
    end
  end

  # TODO - remove
  def label_font_class(size) do
    case size do
      "small" -> "text-moon-12"
      "medium" -> "text-moon-14"
      "large" -> "text-moon-16"
      "xlarge" -> "text-moon-18"
    end
  end

  # TODO - remove
  def prompt_font_class(size), do: label_font_class(size)
end
