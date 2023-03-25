defmodule Moon.Design.Tabs.Panels do
  @moduledoc false

  use Moon.StatelessComponent, slot: "content"

  import Moon.Helpers.MakeList

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  prop(selected, :integer, from_context: :selected)

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
