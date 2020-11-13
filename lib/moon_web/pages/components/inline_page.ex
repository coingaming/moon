defmodule MoonWeb.Pages.Components.InlinePage do
  use Moon.LiveView
  alias Moon.Components.Inline

  def render(assigns) do
    ~H"""
    <Inline>
      <div>a</div>
      <div>b</div>
    </Inline>
    """
  end
end
