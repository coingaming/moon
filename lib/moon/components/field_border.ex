defmodule Moon.Components.FieldBorder do
  @moduledoc false

  use Moon.StatelessComponent

  prop class, :css_class
  prop click, :event
  slot default

  def render(assigns) do
    ~F"""
    <div class={get_default_class(), @class} :on-click={@click}>
      <#slot />
    </div>
    """
  end

  def get_default_class() do
    "w-full max-w-full hover:bg-goku-120 leading-normal
    text-bulma-100 box-border border border-solid border-beerus-100 rounded transition
    ease-in placeholder-trunks-100 placeholder-opacity-100 disabled:opacity-50
    disabled:cursor-not-allowed focus:border-piccolo-100 focus:outline-none
    no-scrollbar invalid:shadow-none invalid:border-chi-chi-100"
  end
end
