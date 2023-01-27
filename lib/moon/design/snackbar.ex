defmodule Moon.Design.Snackbar do
  @moduledoc false

  use Moon.StatelessComponent

  slot(content, required: true)

  prop(is_open, :boolean, default: false)

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

def render(assigns) do
  ~F"""
  <div class={"z-[9999999] flex fixed w-[calc(100%-32px)] md:w-fit transition",
  "top-4 ltr:left-4 rtl:right-4": @position == "top-left",
  "justify-center top-4 left-4 right-4 md:m-auto": @position == "top-center",
  "justify-end top-4 ltr:right-4 rtl:left-4": @position == "top-right",
  "bottom-4 ltr:left-4 rtl:right-4": @position == "bottom-left",
  "justify-center bottom-4 left-4 right-4 m-auto": @position == "bottom-center",
  "justify-end bottom-4 ltr:right-4 rtl:left-4": @position == "bottom-right",
    hidden: @is_open == false
  }>  <#slot {@content}/>
  </div>
  """
end
end
