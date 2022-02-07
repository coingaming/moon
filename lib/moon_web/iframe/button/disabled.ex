defmodule MoonWeb.Pages.Iframe.ButtonDisabled do
  use MoonWeb, :clean_view

  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Icons">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Button variant="fill" disabled="true">Disabled</Button>
        </div>
      </:example>
      <:code>
        <#CodePreview>
          <Button variant="fill" disabled="true">Disabled</Button>
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end
end
