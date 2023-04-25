defmodule Moon.Lego.Title do
  @moduledoc false

  use Moon.StatelessComponent

  prop(title, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <span class="block grow text-start text-bulma overflow-hidden">
      <#slot>{@title}</#slot>
    </span>
    """
  end
end
