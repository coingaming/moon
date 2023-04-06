defmodule Moon.Design.BottomSheet.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "panel"

  slot(draghandle)
  slot(default)

  prop(class, :css_class)

  prop(testid, :string)
  prop(id, :string)

  # inner API
  prop(on_close, :event, from_context: :on_close)
  prop(has_shadow, :boolean, from_context: :has_shadow)
  prop(size, :string, from_context: :size)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-animate_enter_class="animate-drawer_enter_bottom"
      data-animate_leave_class="animate-drawer_leave_bottom"
      class={merge([
        [
          "fixed w-full bottom-0 rounded-t-xl bg-gohan",
          "moon-panel",
          "shadow-moon-lg": @has_shadow,
          "h-[32%]": @size == "sm",
          "h-[64%]": @size == "md",
          "h-[88%]": @size == "lg"
        ],
        @class
      ])}
      :on-click-away={@on_close}
      data-testid={@testid}
    >
      <#slot {@draghandle} />
      <#slot />
    </div>
    """
  end
end
