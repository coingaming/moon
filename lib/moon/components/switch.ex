defmodule Moon.Components.Switch.Caption do
  use Moon.StatelessComponent

  prop label, :string
  prop size, :string, values: ["small", "medium", "large"], default: "medium"
  prop active, :boolean

  def render(assigns) do
    ~F"""
    <span class={
      "leading-none transition-colors duration-200 ease-in-out",
      "text-xxxs": @size == "small",
      "text-xxs": @size == "medium",
      "text-xs": @size == "large",
      "text-bulma-100": @active,
      "text-trunks-100": !@active
    }>
      {@label}
    </span>
    """
  end
end

defmodule Moon.Components.Switch do
  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconMoon
  alias Moon.Assets.Icons.IconSun
  alias Moon.Components.Switch.Caption

  @icons_sizes %{
    "small" => "0.75rem",
    "medium" => "1rem",
    "large" => "1.5rem"
  }

  prop checked, :boolean, default: false
  prop on_change, :event
  prop icons, :boolean, default: false
  prop size, :string, values: ["small", "medium", "large"], default: "medium"
  prop action, :string, default: "Toggle Setting"
  prop caption_unchecked, :string
  prop caption_checked, :string
  prop target, :string

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    <div class={"inline-flex items-center", "space-x-1": @size != "large", "space-x-2": @size == "large"}>
      <Caption
        :if={@caption_unchecked}
        label={@caption_unchecked}
        size={@size}
        active={!@checked}
      />

      <button
        type="button"
        aria-pressed="false"
        class={
          "relative inline-flex flex-shrink-0 transition-colors duration-200 ease-in-out border-transparent rounded-full cursor-pointer outline-none focus:outline-none",
          "bg-piccolo-100": @checked,
          "bg-hit-80": !@checked,
          "border-2 w-7 focus:ring-1 focus:ring-offset-1": @size == "small",
          "border-4 w-10 focus:ring-2 focus:ring-offset-1": @size == "medium",
          "border-4 w-14 focus:ring-2 focus:ring-offset-2": @size == "large"
        }
        :on-click={@on_change}
        phx-target={@target}
      >
        <span class="sr-only">{@action}</span>

        <div :if={@icons} class="absolute flex">
          <IconMoon class="transform scale-90" font_size={icon_size(@size)} />
          <IconSun class="transform scale-90" font_size={icon_size(@size)} />
        </div>

        <span
          aria-hidden="true"
          class={
            "inline-block transition duration-200 ease-in-out transform translate-x-0 bg-goten-100 rounded-full shadow pointer-events-none ring-0",
            "w-3 h-3": @size == "small",
            "w-4 h-4": @size == "medium",
            "w-6 h-6": @size == "large",
            "translate-x-3": @size == "small" and @checked,
            "translate-x-4": @size == "medium" and @checked,
            "translate-x-6": @size == "large" and @checked
          }
        ></span>
      </button>

      <Caption
        :if={@caption_checked}
        label={@caption_checked}
        size={@size}
        active={@checked}
      />
    </div>
    """
  end

  def icon_size(size) do
    @icons_sizes[size]
  end
end
