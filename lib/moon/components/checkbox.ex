defmodule Moon.Components.Checkbox do
  use Moon.StatelessComponent
  use Moon.Components.Context

  import Moon.Utils.Rem

  prop(href, :string)

  prop(variant, :string,
    default: "default",
    values: ["primary", "secondary", "tertiary", "highlight", "default"]
  )

  prop(on_click, :string)

  prop(size, :string, default: "small", values: ["xsmall", "small", "medium", "large"])
  prop(mock_state, :string, values: ["active", "focus", "hover"])
  prop(full_width, :boolean)
  prop(progress, :boolean)
  prop(oops, :boolean)
  prop(success, :boolean)
  prop(pulse, :boolean)
  prop(disabled, :boolean)

  prop(to, :string)
  prop(as, :string)
  prop(active_class_name, :string)
  prop(active_style, :string)
  prop(exact, :boolean)
  prop(string, :boolean)
  prop(is_active, :boolean)
  prop(location, :string)

  prop(style, :string)

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
