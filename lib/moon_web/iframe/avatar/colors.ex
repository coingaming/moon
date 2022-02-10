defmodule MoonWeb.Pages.Iframe.AvatarColors do
  use MoonWeb, :clean_view

  alias Moon.Components.Avatar
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Different Colors">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Avatar class="mx-10" color="chi-chi-100" background_color="frieza-100" size="medium" />
          <Avatar class="mx-10" color="frieza-100" background_color="chi-chi-100" size="medium" />
          <Avatar class="mx-10" color="piccolo-100" background_color="gohan-100" size="medium" />
        </div>
      </:example>
      <:code>
        <#CodePreview>
          # import
          alias Moon.Components.Avatar

          # render
          <Avatar class="mx-10" color="chi-chi-100" background_color="frieza-100" size="medium" />
          <Avatar class="mx-10" color="frieza-100" background_color="chi-chi-100" size="medium" />
          <Avatar class="mx-10" color="piccolo-100" background_color="gohan-100" size="medium" />
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end
end
