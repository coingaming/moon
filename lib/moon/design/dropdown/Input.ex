defmodule Moon.Design.Dropdown.Input do
  @moduledoc "Element that triggers Dropdown component, renders as a button"

  use Moon.StatelessComponent, slot: "trigger"

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
  @doc "Dropdown closing action, only from context"
  prop(close_me, :event, from_context: :close_me)
  @doc "Dropdown opening action, only from context"
  prop(open_me, :event, from_context: :open_me)
  @doc "Actually - on_keyup event for the input, use it for filter options with new user input"
  prop(on_keyup, :event)

  # TODO: implement functionality for the following attributes

  @doc "Badge to show selected items count or smth else"
  prop(badge, :string)
  @doc "If the open indicator is active or not"
  prop(is_open, :boolean, from_context: :is_open)

  def render(assigns) do
    ~F"""
    <Input
      {=@value}
      {=@id}
      {=@testid}
      {=@size}
      on_keyup={@on_keyup}
      on_focus={@open_me}
      {=@error}
      {=@disabled}
      autocomplete="off"
      class="moon-comboinput"
    />
    """
  end
end
