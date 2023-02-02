defmodule Moon.Design.Popover.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "default"

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

  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div class={merge([
      [
        "absolute flex w-72 z-[9999999] overflow-y-auto rounded-moon-i-md box-border bg-gohan shadow-moon-lg",
        alignment_class(@position),
        "left-full -translate-y-1/2 mx-2 rtl:flex-row-reverse": @position == "right",
        "right-full -translate-y-1/2 mx-2 ltr:flex-row-reverse": @position == "left",
        "top-full mt-2 flex-col-reverse": String.starts_with?(@position, "bottom"),
        "bottom-full mb-2 flex-col-reverse": String.starts_with?(@position, "top")
      ],
      @class
    ])}>
      <#slot />
    </div>
    """
  end

  defp alignment_class(position \\ "center") do
    align =
      case position do
        "top-" <> a -> a
        "bottom-" <> a -> a
        _ -> "center"
      end

    merge([
      [
        "ltr:left-0 rtl:right-0": align == "start",
        "ltr:right-0 rtl:left-0": align == "end"
      ]
    ])
  end
end
