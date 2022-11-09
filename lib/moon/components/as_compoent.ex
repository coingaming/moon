defmodule Moon.Components.AsComponent do
  @moduledoc """
  Some kind of "polymorphic" stuff. "as" propertry is responsible for HTNL tag is rendered.
  """

  use Moon.StatelessComponent

  prop(class, :css_class)
  prop(as, :atom, values!: [:a, :button], default: :button)
  prop(href, :string)

  slot(default)

  def render(assigns) do
    ~F"""
    {#if @as == :button}
      <button {=@class}><#slot /></button>
    {#elseif @as == :a}
      <a {=@class} {=@href}><#slot /></a>
    {/if}
    """
  end
end
