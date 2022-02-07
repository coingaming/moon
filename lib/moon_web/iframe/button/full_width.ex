defmodule MoonWeb.Pages.Iframe.ButtonFullWidth do
  use MoonWeb, :clean_view

  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Icons">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Button variant="fill" full_width="true">Full Width</Button>
        </div>
      </:example>
      <:code>
        <#CodePreview>
          <Button variant="fill" full_width="true">Full Width</Button>
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end
end
