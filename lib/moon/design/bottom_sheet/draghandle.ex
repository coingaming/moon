defmodule Moon.Design.BottomSheet.Draghandle do
  @moduledoc false

  use Moon.StatelessComponent, slot: "draghandle"

  prop(class, :css_class)
  prop(draghandle_class, :css_class)
  slot(title)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      class="sticky overflow-y-auto inset-x-0 top-0 flex flex-col items-center justify-start pt-2 min-h-[48px] z-10 bg-gohan rounded-t-xl"
      ,
      @class
    >
      <div class="w-10 h-1 rounded bg-beerus" , @draghandle_class />
      {#if slot_assigned?(:title)}
        <div class="w-full">
          <#slot {@title} />
        </div>
      {/if}
    </div>
    """
  end
end
