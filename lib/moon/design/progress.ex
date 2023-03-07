defmodule Moon.Design.Progress do
  @moduledoc false

  use Moon.StatelessComponent

  prop(bg_color, :css_class, default: "bg-trunks/[.24]")
  prop(progress_color, :css_class, default: "bg-piccolo")
  prop(size, :string, values: ["6xs", "5xs", "4xs", "3xs", "2xs"], default: "2xs")
  prop(value, :decimal, default: 0)
  prop(class, :css_class)
  prop(test_id, :string)

  def render(assigns) do
    ~F"""
    <div
      class={merge([
        "w-full relative rounded-full overflow-hidden",
        @bg_color,
        get_size(@size),
        @class
      ])}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-valuenow={@value}
      role="progressbar"
      data-testid={@test_id}
    >
      <span
        style={"width: #{trunc(@value)}%"}
        class={merge([
          "block absolute h-full rounded-full ltr:left-0 rtl:right-0 transition-all",
          @progress_color
        ])}
      />
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
