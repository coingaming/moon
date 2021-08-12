defmodule Moon.Components.Button do
  use Moon.StatelessComponent

  alias Moon.Assets.Icon

  prop(href, :string)

  prop(variant, :string,
    values: ["primary", "secondary", "tertiary", "highlight", "default", "outline"]
  )

  prop(size, :string, values: ["xsmall", "small", "medium", "large"])
  prop(mock_state, :string, values: ["active", "focus", "hover"])
  prop(full_width, :boolean)
  prop(progress, :boolean)
  prop(oops, :boolean)
  prop(success, :boolean)
  prop(pulse, :boolean)
  prop(disabled, :boolean)
  prop(type, :string, default: "button")
  prop(rounded, :boolean, default: true)

  prop(to, :string)
  prop(as, :string)
  prop(active_class_name, :string)
  prop(active_style, :string)
  prop(exact, :boolean)
  prop(string, :boolean)
  prop(is_active, :boolean)
  prop(location, :string)
  prop(style, :string)
  prop(class, :string)

  prop(on_click, :event)
  prop(value_name, :string)
  prop(value, :any)

  prop(left_icon, :string)
  prop(right_icon, :string)

  slot(default)

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/components/button"}

    <button
      class={
        "moon-button relative #{@class}",
        rounded: @rounded,
        "py-2 px-3 border-beerus-100 hover:border-piccolo-80": @variant == "outline"
      }
      disabled={@disabled}
      type={@type}
      data-mock-state={@mock_state}
      data-variant={@variant}
      data-size={@size}
      :on-click={@on_click}
      :attrs={phx_val_tag(@value_name || (@value && "click_value") || nil, @value)}
    >
      <div class="flex gap-2 items-center">
        <Icon name={@left_icon} :if={@left_icon} />
        <#slot />
        <Icon name={@right_icon} :if={@right_icon} />
      </div>
    </button>
    """
  end

  def phx_val_tag(nil, _), do: []

  def phx_val_tag(name, value), do: [{:"phx-value-#{name}", value}]
end
