defmodule Moon.Components.Link do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(to, :any)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/link" }}

    <a class="moon-link" href={{ @to }}><slot /></a>
    """
  end
end

# Routes.live_path(@socket, MyLive, @page + 1)
