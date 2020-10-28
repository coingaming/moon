defmodule Moon.Components.Checkbox do
  use Moon.StatelessComponent
  use Moon.Components.Context

  import Moon.Utils.Rem

  property(href, :string)

  property(variant, :string,
    default: "default",
    values: ["primary", "secondary", "tertiary", "highlight", "default"]
  )

  property(on_click, :string)

  property(size, :string, default: "small", values: ["xsmall", "small", "medium", "large"])
  property(mock_state, :string, values: ["active", "focus", "hover"])
  property(full_width, :boolean)
  property(progress, :boolean)
  property(oops, :boolean)
  property(success, :boolean)
  property(pulse, :boolean)
  property(disabled, :boolean)

  property(to, :string)
  property(as, :string)
  property(active_class_name, :string)
  property(active_style, :string)
  property(exact, :boolean)
  property(string, :boolean)
  property(is_active, :boolean)
  property(location, :string)

  property(style, :string)

  def style(assigns, %Moon.Theme{} = theme) do
    ~H"""
    <style>
      .moon-checkbox {
        background-color: {{ theme.colors.gohan_100 }};
      }
    </style>
    """
  end

  def render(assigns) do
    ~H"""
    <div class="moon-checkbox">
      b
      <slot />
    </div>
    """
  end
end
