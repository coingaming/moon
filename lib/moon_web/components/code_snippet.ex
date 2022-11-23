defmodule MoonWeb.Components.CodeSnippet do
  @moduledoc false

  use MoonWeb, :stateless_component

  slot(default)

  def render(assigns) do
    ~F"""
    <pre class="moon-design-dark w-full bg-goku overflow-scroll p-4 text-moon-14 text-bulma rounded-moon-s-sm"><code><#slot /></code></pre>
    """
  end
end
