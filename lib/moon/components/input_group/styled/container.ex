defmodule Moon.Components.InputGroup.Container do
  @moduledoc false

  use Moon.StatelessComponent

  prop orientation, :string
  prop background_color, :string, default: "gohan-100", values: Moon.colors()
  prop is_error, :boolean
  slot default

  def render(assigns) do
    ~F"""
    <div class={
      "moon-input-group border-none shadow-input relative rounded-moon-i-md",
      @orientation,
      "rtl-aware",
      get_class_for_orientation(@orientation),
      "after:bg-beerus-100": !@is_error,
      "after:bg-chi-chi-100": @is_error,
      "bg-#{@background_color}": @background_color
    }>
      <#slot />
    </div>
    """
  end

  defp get_class_for_orientation(orientation) do
    if orientation == "horizontal" do
      "
        flex
        after:content-[''] after:z-20 after:absolute after:top-0 after:bottom-0 after:w-px
        after:left-1/2 after:translate-x-[-50%] after:x-[3]
        hover:after:hidden focus-within:after:hidden
        "
    else
      "
        after:content-[''] after:z-20 after:absolute after:top-1/2 after:bottom-0 after:w-full after:h-px
        after:left-0 after:translate-y-[-50%] after:x-[3]
        hover:after:hidden focus-within:after:hidden
        "
    end
  end
end
