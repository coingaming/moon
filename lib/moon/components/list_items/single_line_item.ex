defmodule Moon.Components.ListItems.SingleLineItem do
  use Moon.StatelessComponent

  slot default
  slot left_icon
  slot right_icon

  prop size, :string, values: ["medium", "large"], default: "medium"
  prop background_color, :string, values: Moon.colors(), default: "gohan-100"
  prop active, :boolean, default: false

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}

    <div class={
      "rounded bg-#{@background_color} px-3 text-sm text-bulma-100 leading-6 cursor-pointer hover:bg-goku-120",
      "py-2": @size == "medium",
      "py-3": @size == "large",
      "bg-goku-120": @active
    }>
      <#slot />
    </div>
    """
  end
end
