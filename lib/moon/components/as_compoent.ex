defmodule Moon.Components.AsComponent do
  @moduledoc """
  Some kind of "polymorphic" stuff. "as" propertry is responsible for HTNL tag is rendered.
  """
  use Moon.StatelessComponent
  prop(class, :css_class)
  prop(as, :string, values!: ~w(a button), default: "button")
  # for as="a" type only
  prop(href, :string)
  # for as="button" only
  prop(on_click, :event)
  # for everything
  prop(values, :list, default: [])
  prop(role, :string)
  prop(attrs, :map, default: %{})
  prop(is_selected, :boolean, default: false)
  slot(default)
  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    {#if @as == "button"}
      <button
        {=@class}
        :on-click={@on_click}
        :values={@values}
        {=@role}
        {...@attrs}
        {=@id}
        data-testid={@testid}
      ><#slot /></button>
    {#elseif @as == "a"}
      <a {=@class} {=@href} {...@attrs} {=@id} data-testid={@testid}><#slot /></a>
    {/if}
    """
  end
end
