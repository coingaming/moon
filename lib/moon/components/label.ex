defmodule Moon.Components.Label do
  @moduledoc false

  use Moon.StatelessComponent

  prop color, :string, default: "gohan-100", values: Moon.colors()
  prop background_color, :string, default: "piccolo-100", values: Moon.colors()
  prop size, :string, default: "default", values: ["small", "default"]
  prop class, :string, default: "rounded-sm"
  prop block_style_class, :string, default: "rounded-sm"
  slot default

  def render(assigns) do
    ~F"""
    <div class={
      @class,
      "bg-#{@background_color} text-#{@color} pl-2 pr-2 #{(@size == "small" && "text-xxxs") || "text-xxs"} uppercase inline-block"
    }>
      <#slot />
    </div>
    """
  end
end
