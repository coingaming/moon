defmodule MoonWeb.Pages.Iframe.ButtonFullWidth do
  use MoonWeb, :clean_view

  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Full Width">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Button variant="fill" full_width="true">Full Width</Button>
        </div>
      </:example>
      <:code>
        <#CodePreview>
          # import
          alias Moon.Components.Button

          # render
          <Button variant="fill" full_width="true">Full Width</Button>
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end
end
