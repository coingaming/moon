defmodule MoonWeb.Pages.Page404 do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page

  alias Moon.Design.Button

  data(breadcrumbs, :any,
  default: [
    %{
      to: "/404",
      name: "404"
    }
  ]
)

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <div class="flex flex-col items-center min-h-full justify-center">
        <img src="/moon/assets/images/facing/404.png" alt="Lost in space" width={1280}>
        <div class="flex flex-col items-center gap-6">
          <h1 class="text-moon-48 font-medium text-center">Lost in space</h1>
          <p class="text-moon-24 text-center">
            Huston, we have a problem. Moon not found.
          </p>
          <Button as="a" href="/" class="text-piccolo bg-transparent ring-1 ring-piccolo">
            Go back to home
          </Button>
        </div>
      </div>
    </Page>
    """
  end
end
