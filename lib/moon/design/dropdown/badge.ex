defmodule Moon.Design.Dropdown.Badge do
  @moduledoc "Displaying number of tems selected with close [x] button"

  use Moon.StatelessComponent

  alias Moon.Icon
  alias Phoenix.LiveView.JS

  @doc "Data-testid attribute for html tag"
  prop(testid, :string)
  @doc "Id attribute for html tag"
  prop(id, :string)
  @doc "Additional CSS classes for the html tag"
  prop(class, :css_class)
  @doc "Number to be shown on badge"
  prop(count, :integer)
  @doc "Common moon size"
  prop(size, :string, values!: ~w(sm md lg), from_context: :size)

  def render(assigns) do
    ~F"""
    <span
      {=@id}
      data-testid={@testid}
      class={merge([
        "flex-shrink-0 chip bg-bulma text-gohan flex items-center justify-center rounded-moon-s-xs cursor-pointer text-moon-12",
        ["h-4 px-0.5": @size == "sm", "h-6 px-1": @size != "sm"],
        @class
      ])}
      :on-click={JS.dispatch("moon2:clean-checkboxes")}
    >
      <span class={"px-0.5": @size == "sm", "px-1": @size != "sm"}>{@count}</span>
      <Icon name="controls_close" class="text-gohan text-moon-12" />
    </span>
    """
  end
end
