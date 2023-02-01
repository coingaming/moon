defmodule Moon.Design.Snackbar do
  @moduledoc false

  use Moon.StatelessComponent

  prop(position, :string,
    values: [
      "top-left",
      "top-center",
      "top-right",
      "bottom-left",
      "bottom-center",
      "bottom-right"
    ],
    default: "top-right"
  )

  slot(content)
  slot(icon)
  slot(close)

  prop(is_open, :boolean, default: false)

  prop(class, :css_class)

  prop(animation, :string, values: ~w(slideInFromRight))

  def render(assigns) do
    ~F"""
    <div class={
      "z-[9999999] flex fixed w-[calc(100%-32px)] md:w-fit transition",
      "top-4 animate-leftslide ltr:left-4 rtl:right-4": @position == "top-left",
      "justify-center top-4 left-4 right-4 md:m-auto animate-topslide": @position == "top-center",
      "justify-end top-4 animate-rightslide ltr:right-4 rtl:left-4": @position == "top-right",
      "bottom-4 animate-leftslide ltr:left-4 rtl:right-4": @position == "bottom-left",
      "justify-center bottom-4 left-4 right-4 m-auto animate-bottomslide": @position == "bottom-center",
      "justify-end bottom-4 animate-rightslide ltr:right-4 rtl:left-4": @position == "bottom-right",
      hidden: @is_open == false
    }>
      <div class={merge([
        "flex w-fit max-w-xs items-center gap-4 p-4 bg-gohan shadow-moon-lg rounded-moon-s-sm",
        @class
      ])}>
        <#slot {@icon} />
        <#slot {@content} />
        <#slot {@close} />
      </div>
    </div>
    """
  end
end
