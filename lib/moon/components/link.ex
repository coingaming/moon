defmodule Moon.Components.Link do
  @moduledoc false

  use Moon.StatelessComponent

  prop to, :any
  prop secondary, :boolean
  prop disabled, :boolean
  prop optional, :boolean
  prop class, :css_class
  slot default

  def render(assigns) do
    ~F"""
    <a
      class={
        "inline-block p-0 border-none no-underline",
        @class,
        "text-piccolo-100 hover:text-piccolo-80 focus:text-piccolo-80 active:text-piccolo-80":
          !@disabled and !@optional and !@secondary,
        "cursor-pointer": !@disabled,
        "cursor-not-allowed opacity-25": @disabled,
        "text-trunks-100": @secondary,
        "text-trunks-100 hover:text-piccolo-80 focus:text-bulma-100 active:text-bulma-100": @optional
      }
      data-phx-link="patch"
      data-phx-link-state="push"
      href={@to}
    ><#slot /></a>
    """
  end
end
