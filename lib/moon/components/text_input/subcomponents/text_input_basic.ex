defmodule Moon.Components.TextInput.TextInputBasic do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.ErrorTag

  prop id, :string
  prop field, :atom
  prop class, :css_class
  slot default
  slot left_icon_slot
  slot right_icon_slot

  def render(assigns) do
    ~F"""
    <Context
      get={Moon.Components.TextInput, disabled: disabled}
      get={Moon.Components.TextInput, size: size}
      get={Moon.Components.TextInput, label: label}
      get={Moon.Components.TextInput, is_error: is_error}
      get={Moon.Components.TextInput, use_error_tag: use_error_tag}
    >
      <Container {=disabled} {=size} {=@class}>
        <label
          :if={label}
          class={"block text-moon-16 text-bulma pb-2", "opacity-30 cursor-not-allowed": disabled}
        >
          {label}
        </label>
        <Input {=@id} {=@field} />
        <#slot />
      </Container>
      <div class="inline-block mt-2 text-moon-12" :if={use_error_tag && is_error}>
        <ErrorTag />
      </div>
    </Context>
    """
  end
end
