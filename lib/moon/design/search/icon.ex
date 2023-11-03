defmodule Moon.Design.Search.Icon do
  @moduledoc "Icon for the search"

  use Moon.StatelessComponent

  alias Moon.Icon

  @doc "Id HTML attribute"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "Additional classes for the <select> tag"
  prop(class, :css_class, from_context: :class)
  @doc "Icon name to be shown"
  prop(name, :string, default: "generic_search")

  def render(assigns) do
    ~F"""
    <Icon
      {=@name}
      {=@id}
      {=@testid}
      class={merge([
        "w-6 h-6",
        "transition-200 transition-transform cursor-pointer text-trunks text-moon-16",
        "absolute start-3 top-1/2 -translate-y-1/2 z-[3]",
        @class
      ])}
    />
    """
  end
end
