defmodule MoonWeb.Components.ComponentAnatomy do
  @moduledoc false

  use MoonWeb, :stateless_component

  slot(default)

  def render(assigns) do
    ~F"""
    <pre class="flex w-full p-4 bg-goku rounded-moon-s-sm overflow-scroll text-moon-14 text-bulma whitespace-pre-line"><code><#slot /></code></pre>
    """
  end
end
