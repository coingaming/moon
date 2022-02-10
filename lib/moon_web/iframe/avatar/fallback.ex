defmodule MoonWeb.Pages.Iframe.AvatarFallback do
  use MoonWeb, :clean_view

  alias Moon.Components.Avatar
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Fallback image">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="xsmall" />
          <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="small" />
          <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="medium" />
          <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="large" />
        </div>
      </:example>
      <:code>
        <#CodePreview>
          # import
          alias Moon.Components.Avatar

          # render
          <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="xsmall" />
          <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="small" />
          <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="medium" />
          <Avatar class="mx-10" color="gohan-100" background_color="piccolo-100" size="large" />
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end
end
