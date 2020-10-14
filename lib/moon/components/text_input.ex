defmodule Moon.Components.TextInput do
  use Moon.StatelessComponent

  alias Surface.Components.Form.TextInput

  prop(name, :string)
  prop(label, :string)

  prop(type, :string,
    default: "text",
    values: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "url",
      "time",
      "url"
    ]
  )

  prop(value, :string)
  prop(placeholder, :string)
  prop(error, :string)
  prop(rounded, :boolean)
  prop(disabled, :boolean)
  prop(required, :boolean)
  prop(icon, :any)

  def style(%{icon: icon, error: error}, theme) do
    [
      %{
        :width => "100%",
        :max_width => "100%",
        :padding => "#{get_rem(theme.space.small)} #{get_rem(theme.space.default)}",
        :appearance => "none",
        :font => "inherit",
        :font_size => get_rem(16),
        :line_height => 1.5,
        :color => theme.color.bulma_100,
        :background_color => theme.color.gohan_100,
        :border => "#{theme.border_width}px solid #{theme.color.beerus_100}",
        :border_radius => get_rem(12),
        :transition => "border-color #{theme.transition_duration.default}s ease",
        "&::placeholder" => %{
          color: theme.color.trunks_100,
          opacity: 1
        },
        "&:hover:not(:focus):not([disabled])" => %{
          border_color: theme.color.goku_40
        },
        "&:not(:placeholder-shown):not([type=\"date\"]):invalid" => %{
          border_color: theme.color.chi_chi_100
        },
        "&:invalid, :-moz-ui-invalid" => %{
          box_shadow: "none"
        },
        "&:disabled" => %{
          opacity: 0.5,
          cursor: "not-allowed"
        }
      },
      icon &&
        %{
          padding_right: get_rem(theme.space.large),
          background_image: "...",
          background_position: "right #{get_rem(theme.space.default)} center",
          background_repeat: "no-repeat",
          background_size: get_rem(20)
        },
      error &&
        %{
          border_color: theme.color.chi_chi_100
        }
    ]
  end

  def render(assigns) do
    class_name = get_class_name("text-input-#{assigns.icon}-#{assigns.error}")

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        {{ style(assigns, theme) |> get_css_for_maps(".#{class_name}") }}
      </style>

      <TextInput class={{ class_name }} field={{ @name }} opts={{ [placeholder: @placeholder]}} value={{ @value }} />
    </Context>
    """
  end
end
