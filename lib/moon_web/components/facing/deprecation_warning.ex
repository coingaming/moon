defmodule MoonWeb.Components.Facing.DeprecationWarning do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Link

  prop(href, :string)
  prop(name, :string)
  prop(page, :module)

  prop(theme_name, :string, from_context: :theme_name)
  prop(direction, :string, from_context: :direction)

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

  defp page_href(%{page: page, theme_name: theme_name, direction: direction}) do
    live_path(MoonWeb.Endpoint, page,
      theme_name: theme_name,
      direction: direction
    )
  end
end
