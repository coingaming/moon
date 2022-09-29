defmodule Moon.Components.FieldBorder do
  @moduledoc false

  use Moon.StatelessComponent

  prop class, :css_class
  prop border_color_class, :string
  prop states_class, :string
  prop click, :event
  prop has_error, :boolean
  slot default

  def render(assigns) do
    ~F"""
    <div
      class={
        get_default_class(),
        @states_class || get_default_states_class(),
        @class,
        "#{get_error_class()}": @has_error
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
    "
    border-0
    w-full max-w-full leading-normal text-bulma-100 box-border
    border border-solid rounded-moon-s-sm transition ease-in
    placeholder-trunks-100 placeholder-opacity-100 no-scrollbar
    "
  end

  def get_default_states_class() do
    "
    rounded-moon-i-md hover:rounded-moon-i-md
    focus:ring-0 focus:shadow-input-focus focus:outline-none focus:rounded-moon-i-md
    invalid:rounded-moon-i-md
    shadow-input hover:shadow-input-hov
    "
  end

  def get_error_class() do
    "shadow-input-err hover:shadow-input-err focus:shadow-input-err"
  end
end
