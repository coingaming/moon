defmodule Moon.Design.Search.Button do
  @moduledoc "Icon for the search"

  use Moon.StatelessComponent

  @doc "Id of the component"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "Additional classes for the <select> tag"
  prop(class, :css_class, from_context: :class)
  @doc "Text in the button"
  prop(title, :string, default: "Clear")
  @doc "Value to be set to input when button is clicked"
  prop(value, :string, default: "")
  @doc "Button's on_click event"
  prop(on_click, :event)

  def render(assigns) do
    ~F"""
    <button
      class={merge([
        "cursor-pointer text-trunks text-moon-14 transition absolute ltr:right-4 rtl:left-4 top-1/2 transform -translate-y-1/2 z-[3]",
        @class
      ])}
      {=@value}
      :on-click={@on_click}
    >
      {@title}
    </button>
    """
  end
end
