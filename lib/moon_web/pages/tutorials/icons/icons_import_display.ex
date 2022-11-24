defmodule MoonWeb.Pages.IconsPage.IconsImportDisplay do
  @moduledoc false

  use Moon.StatelessComponent

  alias MoonWeb.Pages.IconsPage.CodeSnippet

  slot(default)

  def render(assigns) do
    ~F"""
    <div class="overflow-scroll">
      <CodeSnippet>
        <#slot />
      </CodeSnippet>
    </div>
    """
  end
end
