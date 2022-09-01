defmodule Moon.Components.TextInput.TextInputInnerLabel do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.TextInput.Utils
  alias Moon.Components.ErrorTag

  prop class, :string, default: ""
  prop id, :string
  prop field, :atom
  slot default

  def render(assigns) do
    ~F"""
    <Context
      get={Moon.Components.TextInput, size: size}
      get={Moon.Components.TextInput, disabled: disabled}
      get={Moon.Components.TextInput, background_color: background_color}
      get={Moon.Components.TextInput, is_error: is_error}
      get={Moon.Components.TextInput, label: label}
      get={Moon.Components.TextInput, use_error_tag: use_error_tag}
    >
      <Container disabled={disabled} size={size} {=@class}>
        <div class={
          "w-full max-w-full relative",
          Utils.get_border_radius(size),
          "bg-transparent": !background_color,
          "bg-#{background_color}": background_color
        }>
          <Input {=@id} {=@field} />
          <label
            :if={label}
            class={
              "absolute text-[0.75rem] leading-3 text-trunks-100 top-3 z-[1] transition-all ease-in-out duration-200",
              "rtl:right-4",
              "ltr:left-4",
              "opacity-30 cursor-not-allowed": disabled,

            }
          >
            {label}
          </label>
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
