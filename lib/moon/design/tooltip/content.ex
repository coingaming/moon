defmodule Moon.Design.Tooltip.Content do
  @moduledoc false

  use Surface.Component, slot: "default"

  import Moon.Helpers.MergeClass

  prop(class, :css_class)

  prop(position, :string,
    values!: [
      "top-start",
      "top-center",
      "top-end",
      "bottom-start",
      "bottom-center",
      "bottom-end",
      "right",
      "left"
    ],
    default: "top-center"
  )

  prop(has_no_shadow, :boolean)

  slot(default, required: true)
  slot(arrow)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={
        "absolute flex items-center z-30",
        "drop-shadow-[0_0_1px_rgba(0,0,0,0.4)]": !@has_no_shadow,
        "left-full rtl:flex-row-reverse": @position == "right",
        "right-full ltr:flex-row-reverse": @position == "left",
        "top-full left-0 right-0 flex-col": String.starts_with?(@position, "bottom"),
        "bottom-full left-0 right-0 flex-col-reverse": String.starts_with?(@position, "top")
      }
      data-testid={@testid}
    >
      <div class={"overflow-hidden", (@position in ~w(right left) && "py-1") || "px-1"}>
        <#slot
          {@arrow}
          context_put={
            parent_class: [
              @class,
              "translate-x-1/2": @position == "right",
              "-translate-x-1/2": @position == "left",
              "translate-y-1/2": String.starts_with?(@position, "bottom"),
              "-translate-y-1/2": String.starts_with?(@position, "top")
            ],
            has_no_shadow: @has_no_shadow
          }
        >
          <div class="w-3 h-3 bg-transparent" />
        </#slot>
      </div>
      <div class={content_class(@class, @has_no_shadow, @position)}>
        <#slot />
      </div>
    </div>
    """
  end

  defp content_class(class, has_no_shadow, position) do
    align =
      case position do
        "top-" <> a -> a
        "bottom-" <> a -> a
        _ -> "center"
      end

    merge([
      "p-3 rounded-moon-s-xs text-moon-12 text-bulma bg-goku whitespace-nowrap",
      [
        "shadow-[0_6px_6px_-6px_rgba(0,0,0,0.16)]": !has_no_shadow,
        "ltr:-translate-x-1/3 rtl:translate-x-1/3": align == "end",
        "ltr:translate-x-1/3 rtl:-translate-x-1/3": align == "start"
      ],
      class
    ])
  end
end
