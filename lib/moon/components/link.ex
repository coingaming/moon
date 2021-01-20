defmodule Moon.Components.Link do
  use Moon.StatelessComponent

  prop(to, :any)
  prop(secondary, :boolean)
  prop(disabled, :boolean)
  prop(optional, :boolean)
  prop(class, :string)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/link" }}

    <a class={{ "moon-link #{@class}" }} href={{ @to }} data-secondary={{ @secondary && "true" }} data-optional={{ @optional && "true" }} data-disabled={{ @disabled && "true" }}><slot /></a>
    """
  end
end

# Routes.live_path(@socket, MyLive, @page + 1)
