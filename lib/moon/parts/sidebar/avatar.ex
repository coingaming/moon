defmodule Moon.Parts.Sidebar.Avatar do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Avatar

  @doc "Capital letters of name"
  prop(name, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(status_class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Id of the component"
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <Avatar
      {=@id}
      {=@testid}
      class={merge(["rounded-full rounded-moon-i-xx text-goku bg-cell overflow-visible", @class])}
      size="sm"
      {=@name}
    >
      <Avatar.Status class={merge(["border-goku bg-cell z-10 -bottom-0.5 -end-0.5", @status_class])} />
    </Avatar>
    """
  end
end
