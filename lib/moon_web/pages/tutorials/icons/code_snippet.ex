defmodule MoonWeb.Pages.IconsPage.CodeSnippet do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default)

  def render(assigns) do
    ~F"""
    <pre class="moon-design-dark w-full bg-goku overflow-scroll p-4 text-moon-14 text-bulma rounded-moon-s-sm h-fit whitespace-pre-line"><slot /></pre>
    """
  end
end
