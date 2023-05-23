defmodule Moon.Design.Dropdown.Input do
  @moduledoc "Element that triggers Dropdown component, renders as a button"

  use Moon.StatelessComponent, slot: "trigger"

  # alias Moon.Icon
  # alias Phoenix.LiveView.JS

  alias Moon.Design.Form.Input


  @doc "Data-testid attribute for html tag"
  prop(testid, :string)
  @doc "Id attribute for html tag"
  prop(id, :string)
  @doc "Additional CSS classes for the html tag"
  prop(class, :css_class)

  @doc "Text to be shown when no value given"
  prop(prompt, :string, default: "...")
  @doc "Value to be shown"
  prop(value, :string)
  @doc "Some additional styling will be set to indicate field is iinvalid"
  prop(error, :boolean, from_context: :error)
  @doc "Site of the select"
  prop(size, :string, values!: ~w(sm md lg), from_context: :size)
  @doc "If the item should be marked as disabled"
  prop(disabled, :boolean)
  @doc "Event that fired when trigger is clicked"
  prop(on_trigger, :event, from_context: :on_trigger)
  @doc "Actually - on_keyup event for the input, use it for filter options with new"
  prop(on_keyup, :event, from_context: :on_keyup)

  # TODO: implement functionality for the following attributes

  @doc "Badge to show selected items count or smth else"
  prop(badge, :string)
  @doc "If the open indicator is active or not"
  prop(is_open, :boolean, from_context: :is_open)

  def render(assigns) do
    ~F"""
    <Input
      {=@value}
      {=@size}
      {=@id}
      {=@testid}
      on_keyup={@on_keyup}
      on_focus={@on_trigger}
      on_blur={@on_trigger}
      {=@error}
      {=@disabled}
      autocomplete="off"
    />
    """
  end
end
