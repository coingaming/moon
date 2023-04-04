defmodule Moon.Design.BottomSheet.Title do
  @moduledoc false

  use Moon.StatelessComponent, slot: "title"

  prop(class, :css_class)
  slot(default)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div class="p-4 border-b-2 border-beerus">
      <h3 class={merge([
        "text-moon-18 text-bulma font-medium",
        @class
      ])}>
        <#slot />
      </h3>
    </div>
    """
  end
end
