defmodule MoonWeb.Pages.Iframe.ButtonVariants do
  use MoonWeb, :clean_view

  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Variants">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Button variant="fill">Fill</Button>
          <Button variant="outline">Outline</Button>
          <Button variant="link">Link</Button>
          <Button variant="primary">Primary</Button>
          <Button variant="secondary">Secondary</Button>
          <Button variant="tertiary">Tertiary</Button>
        </div>
      </:example>
      <:code>
        <#CodePreview>
          <Button variant="fill">Fill</Button>
          <Button variant="outline">Outline</Button>
          <Button variant="link">Link</Button>
          <Button variant="primary">Primary</Button>
          <Button variant="secondary">Secondary</Button>
          <Button variant="tertiary">Tertiary</Button>
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end
end
