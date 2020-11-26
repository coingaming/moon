defmodule MoonWeb.Pages.Components.LinkPage do
  use MoonWeb, :live_view
  alias Moon.Components.Link
  alias Moon.Components.CodePreview

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    {:ok, assign(socket, theme_name: theme_name, active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Link to="#">I'm a link</Link>

    <Link to="#" secondary>
      I'm a Secondary link
    </Link>

    <Link to="#" optional>
      I'm an Optional link
    </Link>

    <Link to="#" disabled>
      I'm a disabled link
    </Link>

    <#CodePreview>
      <Link to="#">I'm a link</Link>

      <Link to="#" secondary>
        I'm a Secondary link
      </Link>

      <Link to="#" optional>
        I'm an Optional link
      </Link>

      <Link to="#" disabled>
        I'm a disabled link
      </Link>
    </#CodePreview>
    """
  end
end
