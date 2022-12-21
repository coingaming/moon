defmodule MoonWeb.Components.Facing.DeprecationWarning do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Link

  prop(href, :string)
  prop(name, :string)

  def render(assigns) do
    ~F"""
    <p class="text-krillin font-medium">NB! The component will be deprecated soon.</p>
    <p>Please check out our new <Link to={@href} target="_blank" rel="noreferrer" is_underline="underline">{@name}</Link>component.</p>
    """
  end
end
