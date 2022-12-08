defmodule Moon.Components.Link do
  @moduledoc false

  use Moon.StatelessComponent

  prop(id, :string, default: nil)
  prop(to, :any)
  prop(secondary, :boolean)
  prop(disabled, :boolean)
  prop(optional, :boolean)
  prop(active, :boolean)
  prop(class, :css_class)
  prop(target, :string)
  prop(rel, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <a
      id={@id}
      class={
        "inline-block p-0 border-none no-underline",
        @class,
        "hover:text-piccolo-80 focus:text-piccolo-80 active:text-piccolo-80":
          !@disabled and !@optional and !@secondary,
        "cursor-pointer": !@disabled,
        "cursor-not-allowed opacity-25": @disabled,
        "text-bulma hover:underline focus:underline active:underline": !@secondary && !@optional,
        "text-trunks": @secondary,
        "text-trunks hover:text-piccolo-80 focus:text-bulma active:text-bulma": @optional
      }
      data-phx-link="patch"
      data-phx-link-state="push"
      data-moon-active={@active}
      href={@to}
      target={@target}
      rel={@rel}
    ><#slot /></a>
    """
  end
end
