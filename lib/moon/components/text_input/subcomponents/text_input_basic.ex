defmodule Moon.Components.TextInput.TextInputBasic do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.ErrorTag
  alias Moon.Components.TextInput.Utils

  prop(id, :string)
  prop(field, :atom)
  prop(class, :css_class)
  slot(default)
  slot(left_icon_slot)
  slot(right_icon_slot)

  data(disabled, :boolean, from_context: {Moon.Components.TextInput, :disabled})
  data(size, :string, from_context: {Moon.Components.TextInput, :size})
  data(label, :string, from_context: {Moon.Components.TextInput, :label})
  data(is_error, :boolean, from_context: {Moon.Components.TextInput, :is_error})
  data(use_error_tag, :boolean, from_context: {Moon.Components.TextInput, :use_error_tag})

  def render(assigns) do
    ~F"""
    <Container {=@disabled} {=@size} {=@class}>
      <label
        :if={@label}
        class={"block text-moon-16 text-bulma pb-2 pointer-events-none", "opacity-30 cursor-not-allowed": @disabled}
      >
        {@label}
      </label>

      <div class={
        "w-full relative",
        Utils.get_height_by_size(@size)
      }>
        <div class="w-full absolute top-0 left-0 bg-transparent">
          <Input {=@id} {=@field} />
        </div>
        <div class={
          "w-full absolute top-0 left-0 z-20 bg-transparent pointer-events-none",
          Utils.get_height_by_size(@size)
        }>
          <div class="w-full h-full flex items-center justify-between px-4 bg-transparent">
            <div class="justify-self-start pointer-events-auto"><#slot {@left_icon_slot} /></div>
            <div class="justify-self-end pointer-events-auto"><#slot {@right_icon_slot} /></div>
          </div>
        </div>
      </div>
      <#slot />
    </Container>

    <div class="inline-block mt-2 text-moon-12" :if={@use_error_tag && @is_error}>
      <ErrorTag />
    </div>
    """
  end
end
