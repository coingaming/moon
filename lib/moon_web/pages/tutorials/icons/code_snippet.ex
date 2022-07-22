defmodule MoonWeb.Pages.IconsPage.CodeSnippet do
  @moduledoc false

  use Moon.StatelessComponent

  slot default

  def render(assigns) do
    ~F"""
    <pre class="moon-design-dark w-full bg-goku-100 overflow-scroll p-4 text-moon-14 text-bulma-100 rounded-moon-s-sm">
      <slot />
    </pre>
    """
  end
end
