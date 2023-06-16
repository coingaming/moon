defmodule Moon.Design.Dropdown.Input do
  @moduledoc "Element that triggers Dropdown component, renders as a button"

  use Moon.StatelessComponent, slot: "trigger"

  alias Moon.Icon
  alias Moon.Design.Dropdown.Badge

  import Moon.Helpers.Form

  @doc "Data-testid attribute for html tag"
  prop(testid, :string)
  @doc "Id attribute for html tag"
  prop(id, :string)
  @doc "Additional CSS classes for the html tag"
  prop(class, :css_class)

  @doc "Text to be shown when no value given"
  prop(placeholder, :string)
  @doc "Value to be shown"
  prop(value, :string)
  @doc "Some additional styling will be set to indicate field is iinvalid"
  prop(error, :boolean, from_context: :error)
  @doc "Site of the select"
  prop(size, :string, values!: ~w(sm md lg), from_context: :size)
  @doc "If the item should be marked as disabled"
  prop(disabled, :boolean)
  @doc "Dropdown opening action, only from context"
  prop(open_me, :event, from_context: :open_me)
  @doc "Actually - on_keyup event for the input, use it for filter options with new user input"
  prop(on_keyup, :event)
  @doc "Event that fired when trigger is clicked"
  prop(on_trigger, :event, from_context: :on_trigger)

  @doc "Badge to show selected items count or smth else"
  prop(badge, :integer)
  @doc "If the open indicator is active or not"
  prop(is_open, :boolean, from_context: :is_open)

  def render(assigns) do
    ~F"""
    <div class="relative w-full">
      <input
        {=@value}
        {=@id}
        {=@placeholder}
        data-testid={@testid}
        :on-keyup={@on_keyup}
        :on-focus={@open_me}
        {=@error}
        {=@disabled}
        autocomplete="off"
        class={merge(input_classes(assigns) ++ ["moon-comboinput", ["ps-[3rem]": @badge && @badge > 0], @class])}
      />
      <Icon
        name="controls_chevron_down"
        class={
          "transition-200 transition-transform cursor-pointer text-trunks text-moon-16",
          "absolute ltr:right-4 rtl:left-4 top-1/2 translate-y-[-50%] z-[3]",
          "rotate-180": @is_open
        }
        click={@on_trigger}
      />
      <Badge
        :if={@badge && @badge > 0}
        {=@size}
        count={@badge}
        class="absolute rtl:right-3 ltr:left-3 top-1/2 translate-y-[-50%] z-[3]"
      />
    </div>
    """
  end
end
