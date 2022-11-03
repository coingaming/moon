defmodule Moon.Components.Caption do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default)
  prop(text_align_class, :string, default: "text-left")
  prop(color_class, :string, default: "text-bulma-100")

  def render(assigns) do
    ~F"""
    <span class={
      "text-moon-10-caption font-semibold uppercase",
      @color_class,
      @text_align_class
    }>
      <#slot />
    </span>
    """
  end
end
