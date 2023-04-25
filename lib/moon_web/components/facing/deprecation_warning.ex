defmodule MoonWeb.Components.Facing.DeprecationWarning do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Link

  prop(href, :string)
  prop(name, :string)
  prop(page, :module)

  def render(assigns) do
    ~F"""
    <p class="text-krillin font-medium">NB! The component will be deprecated soon.</p>
    <p>
      Please check out our new
      <Link phx_link="redirect" to={(@page && page_href(assigns)) || @href} is_underline="underline">
        {@name}
      </Link>
      component.
    </p>
    """
  end

  defp page_href(%{page: page}) do
    live_path(MoonWeb.Endpoint, page)
  end
end
