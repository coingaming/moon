defmodule Moon.Parts.Avatar.Status do
  @moduledoc false

  use Moon.StatelessComponent, slot: "status"

  alias Moon.Design.Avatar.Status

  @doc "Tailwind classes for customization"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Id of the component"
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <Status
      {=@id}
      {=@testid}
      size="sm"
      class={merge(["border-goku bg-cell z-10 -bottom-[0.125rem] -end-[0.125rem]", @class])}
    />
    """
  end
end
