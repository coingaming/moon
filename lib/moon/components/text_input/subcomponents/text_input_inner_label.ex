defmodule Moon.Components.TextInput.TextInputInnerLabel do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.TextInput.Utils
  alias Moon.Components.ErrorTag

  prop class, :css_class
  prop id, :string
  prop field, :atom
  slot default
  slot left_icon_slot
  slot right_icon_slot

  def render(assigns) do
    ~F"""
    <Context
      get={Moon.Components.TextInput, size: size}
      get={Moon.Components.TextInput, disabled: disabled}
      get={Moon.Components.TextInput, background_color: background_color}
      get={Moon.Components.TextInput, is_error: is_error}
      get={Moon.Components.TextInput, label: label}
      get={Moon.Components.TextInput, use_error_tag: use_error_tag}
      get={Moon.Components.TextInput, has_left_icon: has_left_icon}
    >
      <Container disabled={disabled} size={size} {=@class}>
        <div class={
          @class,
          "w-full max-w-full relative",
          Utils.get_border_radius(size),
          "bg-transparent": !background_color,
          "bg-#{background_color}": background_color
        }>
          <Input {=@id} {=@field} />
          <label
            :if={label}
            class={
              "absolute text-[0.75rem] leading-3 text-trunks-100 top-3 z-20 transition-all ease-in-out duration-200",
              "rtl:right-4",
              "ltr:left-4",
              "opacity-30 cursor-not-allowed": disabled,
              "pl-8": has_left_icon
            }
          >
            {label}
          </label>

          <div class={
            "w-full absolute top-0 left-0 z-20 bg-transparent pointer-events-none",
            Utils.get_height_by_size(size)
          }>
            <div class="w-full h-full flex items-center justify-between px-4 bg-transparent pointer-events-none">
              <div class="justify-self-start"><#slot name="left_icon_slot" /></div>
              <div class="justify-self-end"><#slot name="right_icon_slot" /></div>
            </div>
          </div>
        </div>
        <#slot />
        <div class="inline-block mt-2 text-moon-12" :if={use_error_tag && is_error}>
          <ErrorTag />
        </div>
      </Container>
    </Context>
    """
  end
end
