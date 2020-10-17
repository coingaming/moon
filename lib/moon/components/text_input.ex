defmodule Moon.Components.TextInput do
  use Moon.StatelessComponent

  import Moon.Utils.Rem

  alias Surface.Components.Form.TextInput
  alias Moon.Components.Label

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

  def style(%{icon: icon, error: error, rounded: rounded}, %Moon.Theme{} = theme) do
    [
      %{
        width: "100%",
        max_width: "100%",
        padding: "#{rem(theme.space.small)} #{rem(theme.space.default)}",
        appearance: "none",
        "-moz-appearance": "none",
        "-webkit-appearance": "none",
        font: "inherit",
        font_size: rem(16),
        line_height: 1.5,
        color: theme.color.bulma_100,
        background_color: theme.color.gohan_100,
        border: "#{theme.border_width}px solid #{theme.color.beerus_100}",
        border_radius: rem(12),
        transition: "border-color #{theme.transition_duration.default}s ease",
        "&::placeholder": %{
          color: theme.color.trunks_100,
          opacity: 1
        },
        "&:hover:not(:focus):not([disabled])": %{
          border_color: theme.color.goku_40
        },
        "&:not(:placeholder-shown):not([type='date']):invalid": %{
          border_color: theme.color.chi_chi_100
        },
        "&:invalid, :-moz-ui-invalid": %{
          box_shadow: "none"
        },
        "&:disabled": %{
          opacity: 0.5,
          cursor: "not-allowed"
        },
        "&:focus": %{
          border_color: (!error && theme.color.piccolo_100) || theme.color.chi_chi_100,
          outline: "none"
        }
      },
      icon &&
        %{
          padding_right: rem(theme.space.large),
          background_image: "...",
          background_position: "right #{rem(theme.space.default)} center",
          background_repeat: "no-repeat",
          background_size: rem(20)
        },
      error &&
        %{
          border_color: theme.color.chi_chi_100
        },
      rounded &&
        %{
          border_radius: theme.radius.largest
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

      <TextInput class={{ class_name }} field={{ @name }} opts={{ [placeholder: @placeholder]}} value={{ @value }} :if={{ !@label }} />

      <Label text={{ @label }} :if={{ @label }}>
        <TextInput class={{ class_name }} field={{ @name }} opts={{ [placeholder: @placeholder]}} value={{ @value }} />
      </Label>
    </Context>
    """
  end
end
