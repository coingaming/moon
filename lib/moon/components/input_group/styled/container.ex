defmodule Moon.Components.InputGroup.Container do
  @moduledoc false

  use Moon.StatelessComponent

  slot default

  def render(assigns) do
    ~F"""
    <Context
      get={Moon.Components.InputGroup, orientation: orientation}
      get={Moon.Components.InputGroup, dir: dir}
      get={Moon.Components.InputGroup, background_color: background_color}
      get={Moon.Components.InputGroup, is_error: is_error}
    >
      <div
        {=dir}
        class={
          "flex border-none shadow-input relative rounded-moon-i-md",
          get_display_for_orientation(orientation),
          get_class_for_orientation(orientation, is_error),
          "bg-#{background_color}": background_color
        }
      >
        <Context
          put={Moon.Components.InputGroup, is_in_input_group: true}
          put={Moon.Components.InputGroup, group_class_plain: get_class_input_group_no_fields(orientation, dir)}
        >
          <#slot />
        </Context>
      </div>
    </Context>
    """
  end

  defp get_class_input_group_no_fields(orientation, dir) do
    cond do
      orientation == "horizontal" && dir == "ltr" ->
        "
        [&:first-child>div>input]:rounded-tr-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:rounded-br-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:input-rsb-hidden
        [&:last-child>div>input]:rounded-tl-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:rounded-bl-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:input-lsb-hidden
        "

      orientation == "horizontal" && dir == "rtl" ->
        "
        [&:first-child>div>input]:rounded-tl-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:rounded-bl-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:input-lsb-hidden
        [&:last-child>div>input]:rounded-tr-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:rounded-br-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:input-rsb-hidden"

      orientation == "vertical" ->
        "
        [&:first-child>div>input]:rounded-bl-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:rounded-br-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:input-bbb-hidden
        [&:last-child>div>input]:rounded-tl-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:rounded-tr-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:input-tbb-hidden"

      true ->
        ""
    end
  end

  defp get_display_for_orientation(orientation) do
    if orientation == "horizontal" do
      "flex-row"
    else
      "flex-col"
    end
  end

  defp get_class_for_orientation(orientation, is_error) do
    cond do
      orientation == "horizontal" && !is_error ->
        "after:content-[''] after:z-20 after:absolute after:top-0 after:bottom-0 after:w-px after:left-1/2 after:translate-x-[-50%] after:bg-beerus-100 after:x-[3] hover:after:hidden focus-within:after:hidden"

      !is_error ->
        "after:content-[''] after:z-20 after:absolute after:top-1/2 after:bottom-0 after:w-full after:h-px after:left-0 after:translate-y-[-50%] after:bg-beerus-100 after:x-[3] hover:after:hidden focus-within:after:hidden"

      true ->
        ""
    end
  end
end
