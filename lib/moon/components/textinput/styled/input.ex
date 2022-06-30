defmodule Moon.Components.TextInput.Input do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.TextInput.Utils

  prop field, :atom
  prop is_error, :boolean, default: false
  prop background_color, :string, values: Moon.colors()
  prop size, :string, values: ["md", "lg", "xl"]

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.TextInput
        class={
          "block w-full max-w-full py-0 px-4 m-0 appearance-none",
          "text-[1rem] text-bulma transition-shadow box-border relative z-[2]",
          "shadow-input hover:shadow-input-hov",
          "focus:shadow-input-focus focus:outline-none",
          "before:box-border after:box-border",
          "placeholder:text-trunks placeholder:opacity-100 placeholder:transition-opacity placeholder:delay-75",
          "read-only:outline-0 read-only:border-none read-only:cursor-not-allowed read-only:hover:shadow-input read-only:focus:shadow-input",
          Utils.get_size_styles(@size),
          "shadow-input-err hover:shadow-input-err focus:shadow-input-err": @is_error,
          "bg-#{@background_color}": @background_color,
          "bg-transparent": !@background_color
        } />

    """
  end
end
