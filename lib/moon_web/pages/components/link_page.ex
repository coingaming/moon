defmodule MoonWeb.Pages.Components.LinkPage do
  use Moon.LiveView
  alias Moon.Components.Link
  alias Moon.Components.CodePreview

  def render(assigns) do
    ~H"""
    <Link to="#">I'm a link</Link>

    <Link to="#" secondary>
      I'm a Secondary link
    </Link>

    <Link to="#" optional>
      I'm an Optional link
    </Link>

    <Link to="#" as="button">I look like a link, but really I'm a button</Link>

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

      <Link to="#" as="button">I look like a link, but really I'm a button</Link>

      <Link to="#" disabled>
        I'm a disabled link
      </Link>
    </#CodePreview>
    """
  end
end
