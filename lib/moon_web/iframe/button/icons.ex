defmodule MoonWeb.Pages.Iframe.ButtonIcons do
  use MoonWeb, :clean_view

  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Icons">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Button left_icon="chart_round" variant="fill">Icon Left</Button>
          <Button right_icon="chart_round" variant="fill">Icon Right</Button>
          <Button left_icon="chart_round" right_icon="chart_round" variant="fill">Icon Both</Button>
          <Button right_icon="chart_round" variant="fill"></Button>
        </div>
      </:example>
      <:code>
        <#CodePreview>
          <Button left_icon="chart_round" variant="fill">Icon Left</Button>
          <Button right_icon="chart_round" variant="fill">Icon Right</Button>
          <Button left_icon="chart_round" right_icon="chart_round" variant="fill">Icon Both</Button>
          <Button right_icon="chart_round" variant="fill"></Button>
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end
end
