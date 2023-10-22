defmodule Moon.Design.Tabs.Panels do
  @moduledoc false

  use Moon.StatelessComponent, slot: "content"

  import Moon.Helpers.MakeList

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Will be got from Tabs in most cases"
  prop(selected, :integer, from_context: :selected)
  @doc "Panels slot"
  slot(panels, required: true)

  def render(assigns) do
    ~F"""
    <div
      role="tabpanel"
      tabindex={@selected}
      class={merge(["w-full", @class])}
      {=@id}
      data-testid={@testid}
    >
      <#slot {Enum.at(make_list(@panels), @selected)} />
    </div>
    """
  end
end
