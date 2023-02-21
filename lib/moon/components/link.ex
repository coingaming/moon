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
  prop(is_underline, :css_class, default: "no-underline")
  prop(replace, :boolean, default: false)
  prop(phx_link, :string, values!: ~w(redirect patch), default: "redirect")
  slot(default)

  def render(assigns) do
    ~F"""
    <a
      id={@id}
      class={
        "inline-block p-0 border-none",
        @class,
        @is_underline,
        "hover:text-piccolo focus:text-piccolo active:text-piccolo":
          !@disabled and !@optional and !@secondary,
        "cursor-pointer": !@disabled,
        "cursor-not-allowed opacity-25": @disabled,
        "text-bulma hover:underline focus:underline active:underline": !@secondary && !@optional,
        "text-trunks": @secondary,
        "text-trunks hover:text-piccolo focus:text-bulma active:text-bulma": @optional
      }
      data-phx-link={@phx_link}
      data-phx-link-state={if @replace, do: "replace", else: "push"}
      data-moon-active={@active}
      href={@to}
      target={@target}
      rel={@rel}
    ><#slot /></a>
    """
  end
end
