defmodule Moon.Lego.MultiTitle do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes for title"
  prop(title_class, :css_class)
  @doc "Additional Tailwind classes for text"
  prop(text_class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Id attribute for the DOM element"
  prop(id, :string)
  @doc "Title of the menu item"
  prop(title, :string)
  @doc "Text of the menu item"
  prop(text, :string)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <span
      {=@id}
      data-testid={@testid}
      class={merge(["block grow text-start text-bulma overflow-hidden", @class])}
    >
      <span :if={@title} class={merge(["block text-bulma text-moon-14", @title_class])}>{@title}</span>
      <span
        :if={@text || slot_assigned?(:default)}
        class={merge(["flex text-trunks text-moon-12", @text_class])}
      >
        <span class="flex-1 truncate"><#slot>{@text}</#slot></span>
      </span>
    </span>
    """
  end
end
