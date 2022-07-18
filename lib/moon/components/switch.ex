defmodule Moon.Components.Switch.Caption do
  @moduledoc false

  use Moon.StatelessComponent

  prop label, :string
  prop size, :string, values: ["small", "medium", "large"], default: "medium"
  prop active, :boolean

  def render(assigns) do
    ~F"""
    <span class={
      "transition-colors duration-200 ease-in-out",
      "text-moon-9": @size == "small",
      "text-moon-10": @size == "medium",
      "text-moon-12": @size == "large",
      "text-bulma-100": @active,
      "text-trunks-100": !@active
    }>
      {@label}
    </span>
    """
  end
end

defmodule Moon.Components.Switch do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Assets.Icon
  alias Moon.Components.Switch.Caption
  alias Surface.Components.Form.Input.InputContext

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

  prop field, :atom

  def render(assigns) do
    ~F"""
    <div class={
      "relative inline-flex items-center",
      "space-x-1": @size != "large",
      "space-x-2": @size == "large"
    }>
      <Caption :if={@caption_unchecked} label={@caption_unchecked} size={@size} active={!@checked} />

      <Surface.Components.Form.Checkbox
        field={@field}
        class={
          "z-10 absolute left-0 opacity-0",
          "w-8 h-4": @size == "small",
          "w-10 h-5": @size == "medium",
          "w-14 h-7": @size == "large"
        }
        checked_value="true"
        unchecked_value="false"
        :if={!@on_change}
      />

      <InputContext assigns={assigns} :let={form: form, field: field}>
        <button
          type="button"
          aria-pressed="false"
          class={
            "relative inline-flex shrink-0 transition-colors duration-200 ease-in-out border-transparent rounded-full cursor-pointer outline-none focus:outline-none",
            "bg-piccolo-100": is_selected(@checked, form, field),
            "bg-hit-80": !is_selected(@checked, form, field),
            "border-2 w-7 focus:ring-1 focus:ring-offset-1": @size == "small",
            "border-4 w-10 focus:ring-2 focus:ring-offset-1": @size == "medium",
            "border-4 w-14 focus:ring-2 focus:ring-offset-2": @size == "large"
          }
          :on-click={@on_change}
          phx-target={@target}
        >
          <span class="sr-only">{@action}</span>

          <div :if={@icons} class="absolute flex">
            <Icon name="icon_moon" class="scale-90" font_size={icon_size(@size)} />
            <Icon name="icon_sun" class="scale-90" font_size={icon_size(@size)} />
          </div>

          <span
            aria-hidden="true"
            class={
              "inline-block transition duration-200 ease-in-out translate-x-0 bg-goten-100 rounded-full shadow pointer-events-none ring-0",
              "w-3 h-3": @size == "small",
              "w-4 h-4": @size == "medium",
              "w-6 h-6": @size == "large",
              "translate-x-3": @size == "small" and is_selected(@checked, form, field),
              "translate-x-4": @size == "medium" and is_selected(@checked, form, field),
              "translate-x-6": @size == "large" and is_selected(@checked, form, field)
            }
          />
        </button>

        <Caption
          :if={@caption_checked}
          label={@caption_checked}
          size={@size}
          active={is_selected(@checked, form, field)}
        />
      </InputContext>
    </div>
    """
  end

  def icon_size(size) do
    @icons_sizes[size]
  end

  def is_true(val) do
    Enum.member?([true, "true"], val)
  end

  def is_selected(checked, form, field) do
    is_true(checked) || is_true(Phoenix.HTML.Form.input_value(form, field))
  end
end
