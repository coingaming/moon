defmodule Moon.Parts.Wizard.Panels do
  @moduledoc "Almost copy of Moon.Design.Tabs.Panels except few classes"

  use Moon.StatelessComponent, slot: "content"

  import Moon.Helpers.MakeList

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Additional Tailwind classes for container"
  prop(class, :css_class)
  @doc "HTML data-testid attribute for container"
  prop(testid, :string)
  @doc "Will be got from Tabs in most cases"
  prop(selected, :integer, from_context: :selected)
  @doc "Panels slot"
  slot(panels, required: true)

  @doc "Additional buttons etc."
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      role="tabpanel"
      tabindex={@selected}
      class={merge(["p-6 pb-28 w-2/3 bg-goku rounded-moon-s-lg", @class])}
      {=@id}
      data-testid={@testid}
    >
      <#slot {Enum.at(make_list(@panels), @selected)} />
    </div>
    """
  end
end
