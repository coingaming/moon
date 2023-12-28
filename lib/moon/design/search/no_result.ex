defmodule Moon.Design.Search.NoResult do
  @moduledoc "No Result Label for Search Component"

  use Moon.StatelessComponent

  alias Moon.Design.Dropdown

  @doc "Label to use in the beginning in case of no result"
  prop(label, :string, required: true)
  @doc "Id of the component"
  prop(id, :string)
  @doc "Input of the search"
  prop(search, :string)
  @doc "Additional classes for the <span> tag"
  prop(class, :css_class, from_context: :class)
  @doc "Common moon size property"
  prop(size, :string, values!: ~w(sm md lg), default: "md")

  def render(assigns) do
    ~F"""
    <Dropdown.Option {=@size} disabled={false} is_selected={false} class="block">
      {!-- Use span instead of div, div is not valid child of button https://www.w3.org/TR/2012/WD-html5-20120329/the-button-element.html --}
      <span class={merge(["max-w-md truncate text-bulma w-full text-center", @class])}>
        {@label |> String.capitalize()}
        &nbsp;"<span class="font-medium">{@search}</span>"
      </span>
    </Dropdown.Option>
    """
  end
end
