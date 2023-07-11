defmodule Moon.Design.Progress do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id of the component"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "Tailwind classes for customization"
  prop(class, :css_class, from_context: :class)
  @doc "Background colour"
  prop(bg_color, :css_class, default: "bg-trunks/[.24]")
  @doc "Progress bar colour"
  prop(progress_color, :css_class, default: "bg-piccolo")
  @doc "Size of Progress"
  prop(size, :string, values: ["6xs", "5xs", "4xs", "3xs", "2xs"], default: "2xs")
  @doc "Value of Progress in %"
  prop(value, :decimal, default: 0)
  @doc "Pin of Progress component, see Progress.Pin"
  slot(pin)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "w-full relative rounded-full",
        @bg_color,
        get_size(@size),
        @class
      ])}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-valuenow={@value}
      role="progressbar"
      data-testid={@testid}
    >
      <div
        style={"width: #{trunc(@value)}%"}
        class={merge([
          "block absolute h-full rounded-full ltr:left-0 rtl:right-0 transition-all",
          @progress_color
        ])}
      >
        <#slot
          {@pin}
          context_put={
            size: @size,
            value: @value
          }
        />
      </div>
    </div>
    """
  end

  def get_size(size) do
    case size do
      "6xs" -> "h-0.5"
      "5xs" -> "h-1"
      "4xs" -> "h-2"
      "3xs" -> "h-3"
      "2xs" -> "h-4"
    end
  end
end
