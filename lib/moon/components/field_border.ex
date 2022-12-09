defmodule Moon.Components.FieldBorder do
  @moduledoc false

  use Moon.StatelessComponent

  prop(testid, :string)
  prop(class, :css_class)
  prop(border_color_class, :string)
  prop(states_class, :string)
  prop(click, :event)
  prop(has_error, :boolean)
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      data-testid={@testid}
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
    "border-beerus"
  end

  def get_default_class() do
    "
    border-0
    w-full max-w-full leading-normal text-bulma box-border
    border border-solid rounded-moon-s-sm transition ease-in
    placeholder-trunks placeholder-opacity no-scrollbar
    "
  end

  def get_default_states_class() do
    "
    rounded-moon-i-sm hover:rounded-moon-i-sm
    focus:ring-0 focus:shadow-input-focus focus:outline-none focus:rounded-moon-i-sm
    invalid:rounded-moon-i-sm
    shadow-input hover:shadow-input-hov
    "
  end

  def get_error_class() do
    "shadow-input-err hover:shadow-input-err focus:shadow-input-err"
  end
end
