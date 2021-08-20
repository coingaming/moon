defmodule Moon.Components.Button do
  use Moon.StatelessComponent

  alias Moon.Assets.Icon

  prop href, :string

  prop variant, :string, values: ["fill", "outline", "link"]

  prop size, :string, values: ["xsmall", "small", "medium", "large"]
  prop mock_state, :string, values: ["active", "focus", "hover"]
  prop full_width, :boolean
  prop progress, :boolean
  prop oops, :boolean
  prop success, :boolean
  prop pulse, :boolean
  prop disabled, :boolean
  prop type, :string, default: "button"
  prop rounded, :boolean, default: true

  prop to, :string
  prop as, :string
  prop active_class_name, :string
  prop active_style, :string
  prop exact, :boolean
  prop string, :boolean
  prop is_active, :boolean
  prop location, :string
  prop style, :string
  prop class, :string

  prop on_click, :event
  prop value_name, :string
  prop value, :any

  prop left_icon, :string
  prop right_icon, :string

  slot default

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/components/button")}

    <button
      class={
        "my-2 h-10 justify-center flex flex-row items-center leading-8 static py-2 px-4 left-0 right-0 top-0 bottom-0 rounded-lg flex-none order-none flex-grow-0  #{
          @class
        }",
        rounded: @rounded,
        "border border-solid text-goten-100 border-piccolo-100 bg-piccolo-100 active:bg-piccolo-120 focus-within:bg-piccolo-120 hover:bg-piccolo-80 ":
          @variant == "fill",
        "border border-solid text-piccolo-80 border border-beerus-100 hover:border-piccolo-80 active:border-piccolo-80 focus-within:border-piccolo-80 border-beerus-100 ":
          @variant == "outline",
        "text-trunks-100 hover:bg-hit-120 active:bg-hit-120 focus-within:bg-hit-120 hover:text-piccolo-80 active:text-piccolo-120 focus-within:text-piccolo-120":
          @variant == "link",
        "text-xs h-8": @size == "xsmall",
        "text-sm h-10": @size == "small",
        "w-28": !@size,
        "w-full": @full_width
      }
      disabled={@disabled}
      type={@type}
      data-size={@size}
      :on-click={@on_click}
      {...phx_val_tag(@value_name || (@value && "click_value") || nil, @value)}
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
