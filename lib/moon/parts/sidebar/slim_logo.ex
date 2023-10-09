defmodule Moon.Parts.Sidebar.SlimLogo do
  @moduledoc false

  use Moon.StatelessComponent, slot: "logo"

  alias Moon.Parts.Sidebar.Logo

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(svg_class, :css_class)
  @doc "On click event"
  prop(on_click, :event)
  @doc "Source of the svg"
  prop(src, :string, required: true)

  def render(assigns) do
    ~F"""
    <Logo
      {=@id}
      {=@testid}
      class={"self-center", @class}
      svg_class={"w-10", @svg_class}
      {=@on_click}
      {=@src}
    />
    """
  end
end
