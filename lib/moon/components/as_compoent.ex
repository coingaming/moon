defmodule Moon.Components.AsComponent do
  @moduledoc """
  Some kind of "polymorphic" stuff. "as" propertry is responsible for HTNL tag is rendered.
  """
  use Moon.StatelessComponent
  prop(class, :css_class)
  prop(as, :string, values!: ~w(a button div), default: "button")
  # for as="a" type only
  prop(href, :string)
  # for as="a" type only
  prop(target, :string)
  # for as="a" type only
  prop(rel, :string)
  # for as="button" only
  prop(on_click, :event)
  # for everything
  prop(values, :list, default: [])
  prop(role, :string)
  prop(attrs, :map, default: %{})
  prop(is_selected, :boolean, default: false)
  prop(value, :string)
  slot(default)
  prop(testid, :string)
  prop(id, :string)
  prop(aria_label, :string)

  def render(assigns) do
    ~F"""
    {#if @as == "button"}
      <button
        {=@class}
        :on-click={@on_click}
        :values={@values}
        {=@role}
        {=@value}
        {...@attrs}
        {=@id}
        aria-label={@aria_label}
        data-testid={@testid}
      ><#slot /></button>
    {#elseif @as == "a"}
      <a
        {=@class}
        {=@href}
        {=@target}
        {=@rel}
        {...@attrs}
        {=@id}
        {=@value}
        data-testid={@testid}
        :values={@values}
      ><#slot /></a>
    {#elseif @as == "div"}
      <div {=@class} {...@attrs} {=@id} {=@value} data-testid={@testid} :values={@values}><#slot /></div>
    {/if}
    """
  end
end
