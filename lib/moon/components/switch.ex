defmodule Moon.Components.Switch do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon
  alias Moon.Components.Switch.Caption
  alias Surface.Components.Form.Input.InputContext
  alias Phoenix.LiveView.JS

  @icons_sizes %{
    "small" => "0.75rem",
    "medium" => "1rem",
    "large" => "1.5rem"
  }

  prop id, :string, required: true
  prop checked, :boolean, default: false
  prop icons, :boolean, default: false
  prop size, :string, values: ["small", "medium", "large"], default: "medium"
  prop action, :string, default: "Toggle Setting"
  prop caption_unchecked, :string
  prop caption_checked, :string
  prop icon_name_off, :string, default: "other_moon"
  prop icon_name_on, :string, default: "other_sun"
  prop class, :css_class, default: ""

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={
        "relative inline-flex items-center",
        "space-x-1": @size != "large",
        "space-x-2": @size == "large",
        "#{@class}": @class
      }
    >
      <Caption :if={@caption_unchecked} label={@caption_unchecked} size={@size} active={!@checked} />
      <InputContext assigns={assigns} :let={form: form, field: field}>
        <Surface.Components.Form.RadioButton
          form={form}
          field={field}
          class="hidden"
          value="true"
          opts={
            id: "#{@id}_radio_true",
            checked: is_selected(@checked, form, field)
          }
        />
        <Surface.Components.Form.RadioButton
          form={form}
          field={field}
          class="hidden"
          value="false"
          opts={
            id: "#{@id}_radio_false",
            checked: !is_selected(@checked, form, field)
          }
        />
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
          :on-click={JS.dispatch("moon:update-switch",
            detail: %{
              checked: !is_selected(@checked, form, field),
              switch_id: @id
            },
            to: "##{@id}_radio_true"
          )}
        >
          <span class="sr-only">{@action}</span>

          <div :if={@icons} class="absolute flex">
            <Icon name={@icon_name_off} class="scale-90" font_size={icon_size(@size)} />
            <Icon name={@icon_name_on} class="scale-90" font_size={icon_size(@size)} />
          </div>

          <span
            aria-hidden="true"
            class={
              "inline-block transition duration-200 ease-in-out translate-x-0 bg-goten-100 rounded-full shadow pointer-events-none ring-0",
              "w-3 h-3": @size == "small",
              "w-4 h-4": @size == "medium",
              "w-6 h-6": @size == "large",
              "ltr:translate-x-3 rtl:-translate-x-3": @size == "small" and is_selected(@checked, form, field),
              "ltr:translate-x-4 rtl:-translate-x-4":
                @size == "medium" and is_selected(@checked, form, field),
              "ltr:translate-x-6 rtl:-translate-x-6": @size == "large" and is_selected(@checked, form, field)
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
