defmodule Moon.Components.FieldBorder do
  @moduledoc false

  use Moon.StatelessComponent

  prop class, :css_class
  prop border_color_class, :string
  prop states_class, :string
  prop click, :event
  slot default

  def render(assigns) do
    ~F"""
    <div
      class={
        get_default_class(),
        @border_color_class || get_default_border_color_class(),
        @states_class || get_default_states_class(),
        @class
      }
      :on-click={@click}
    >
      <#slot />
    </div>
    """
  end

  def get_default_border_color_class() do
    "border-beerus-100"
  end

  def get_default_class() do
    "w-full max-w-full leading-normal text-bulma-100 box-border
    border border-solid rounded transition ease-in
    placeholder-trunks-100 placeholder-opacity-100 no-scrollbar"
  end

  def get_default_states_class() do
    "hover:ring-piccolo-100 hover:border-piccolo-100
    focus:outline-none focus:border-piccolo-100 focus:ring-piccolo-100 focus:ring-1
    focus:invalid:border-piccolo-100 focus:invalid:ring-piccolo-100"
  end
end
