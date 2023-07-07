defmodule Moon.Components.TextInput.TextInputInnerLabel do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.TextInput.Utils
  alias Moon.Components.ErrorTag

  prop(class, :css_class)
  prop(id, :string)
  prop(field, :atom)
  slot(default)
  slot(left_icon_slot)
  slot(right_icon_slot)

  data(disabled, :boolean, from_context: {Moon.Components.TextInput, :disabled})
  data(size, :string, from_context: {Moon.Components.TextInput, :size})
  data(background_color, :string, from_context: {Moon.Components.TextInput, :background_color})
  data(is_error, :boolean, from_context: {Moon.Components.TextInput, :is_error})
  data(label, :string, from_context: {Moon.Components.TextInput, :label})
  data(use_error_tag, :boolean, from_context: {Moon.Components.TextInput, :use_error_tag})
  data(has_left_icon, :boolean, from_context: {Moon.Components.TextInput, :has_left_icon})

  def render(assigns) do
    ~F"""
    <Container {=@disabled} {=@size} {=@class}>
      <div class={
        @class,
        "w-full max-w-full relative",
        Utils.get_border_radius(@size),
        "bg-transparent": !@background_color,
        "bg-#{@background_color}": @background_color
      }>
        <Input {=@id} {=@field} />
        <label
          :if={@label}
          class={
            "absolute text-moon-12 leading-3 text-trunks top-3 z-20 transition-all ease-in-out duration-200 pointer-events-none",
            "rtl:right-4",
            "ltr:left-4",
            "opacity-60 cursor-not-allowed": @disabled,
            "pl-8": @has_left_icon
          }
        >
          {@label}
        </label>

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
      <div class="inline-block mt-2 text-moon-12" :if={@use_error_tag && @is_error}>
        <ErrorTag {=@field} />
      </div>
    </Container>
    """
  end
end
