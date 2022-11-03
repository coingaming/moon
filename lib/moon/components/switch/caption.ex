defmodule Moon.Components.Switch.Caption do
  @moduledoc false

  use Moon.StatelessComponent

  prop(label, :string)
  prop(size, :string, values: ["small", "medium", "large"], default: "medium")
  prop(active, :boolean)

  def render(assigns) do
    ~F"""
    <span class={
      "transition-colors duration-200 ease-in-out",
      "text-moon-9": @size == "small",
      "text-moon-10": @size == "medium",
      "text-moon-12": @size == "large",
      "text-bulma-100": @active,
      "text-trunks-100": !@active
    }>
      {@label}
    </span>
    """
  end
end
