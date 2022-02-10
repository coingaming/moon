defmodule MoonWeb.Pages.Iframe.AvatarImage do
  use MoonWeb, :clean_view

  alias Moon.Components.Avatar
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Image avatars">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="xsmall" />
          <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="small" />
          <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="medium" />
          <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="large" />
        </div>
      </:example>
      <:code>
        <#CodePreview>
          # import
          alias Moon.Components.Avatar

          # render
          <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="xsmall" />
          <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="small" />
          <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="medium" />
          <Avatar class="mx-10" image_url="//www.fillmurray.com/200/200" size="large" />
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end
end
