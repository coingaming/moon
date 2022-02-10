defmodule MoonWeb.Pages.Iframe.ButtonSizes do
  use MoonWeb, :clean_view

  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Sizes">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Button variant="fill" size="xsmall">XSmall</Button>
          <Button variant="fill" size="small">Small</Button>
          <Button variant="fill" size="medium">Medium</Button>
          <Button variant="fill" size="large">Large</Button>
        </div>
      </:example>
      <:code>
        <#CodePreview>
          # import
          alias Moon.Components.Button

          # render
          <Button variant="fill" size="xsmall">XSmall</Button>
          <Button variant="fill" size="small">Small</Button>
          <Button variant="fill" size="medium">Medium</Button>
          <Button variant="fill" size="large">Large</Button>
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end
end
