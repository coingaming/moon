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
    <div class={
      "absolute flex items-center z-[9999999]",
      "left-full -translate-y-1/2 px-2 rtl:flex-row-reverse": @position == "right",
      "right-full -translate-y-1/2 px-2 ltr:flex-row-reverse": @position == "left",
      "top-full left-0 right-0 pt-2 flex-col": String.starts_with?(@position, "bottom"),
      "bottom-full left-0 right-0 pb-2 flex-col-reverse": String.starts_with?(@position, "top")
    }>
      <div class={content_class(@class)}>
        <#slot />
      </div>
    </div>
    """
  end

  defp content_class(class, position \\ "center") do
    align =
      case position do
        "top-" <> a -> a
        "bottom-" <> a -> a
        _ -> "center"
      end

    merge([
      "w-72 z-[9999999] p-1 rounded-moon-i-md box-border bg-gohan shadow-moon-lg",
      [
        "ltr:-translate-x-1/3 rtl:translate-x-1/3": align == "end",
        "ltr:translate-x-1/3 rtl:-translate-x-1/3": align == "start"
      ],
      class
    ])
  end
end
