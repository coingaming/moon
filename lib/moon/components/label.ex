defmodule Moon.Components.Label do
  @moduledoc false

  use Moon.StatelessComponent

  prop color, :string, default: "gohan-100", values: Moon.colors()
  prop background_color, :string, default: "piccolo-100", values: Moon.colors()
  prop size, :string, default: "default", values: ["small", "default"]
  prop class, :string
  prop border_radius_class, :string, default: "rounded-md"
  slot default

  def render(assigns) do
    ~F"""
    <div class={
      "#{@class} pl-2 pr-2 uppercase inline-block",
      @border_radius_class,
      "bg-#{@background_color}",
      "text-#{@color}",
      "text-xxxs": @size == "small",
      "text-xxs": @size == "default"
    }>
      <#slot />
    </div>
    """
  end
end
