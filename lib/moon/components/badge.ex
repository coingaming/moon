defmodule Moon.Components.Badge do
  @moduledoc false

  use Moon.StatelessComponent

  prop color, :string, default: "gohan-100", values: Moon.colors()
  prop background_color, :string, default: "piccolo-100", values: Moon.colors()
  prop size, :string, default: "default", values: ["small", "default"]
  prop class, :string
  slot default

  def render(assigns) do
    ~F"""
    <span class={"#{@class} mx-2  bg-#{@background_color} text-#{@color} pl-2 pr-2 rounded-sm #{(@size == "small" && "text-xxxs") || "text-xxs"} uppercase"}>
      <#slot />
    </span>
    """
  end
end
