defmodule MoonWeb.Components.IndentedCodeSnippet do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default)

  def render(assigns) do
    ~F"""
    <pre class="theme-moon-dark w-full bg-gohan overflow-scroll overflow-x-auto p-4 text-moon-14 text-bulma rounded-moon-s-sm"><#slot /></pre>
    """
  end
end
