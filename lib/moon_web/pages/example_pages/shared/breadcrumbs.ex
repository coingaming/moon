defmodule MoonWeb.Pages.ExamplePages.Shared.Breadcrumbs do
  use MoonWeb, :stateless_component

  alias Moon.Components.Link
  alias Moon.Assets.Icons.IconChevronRightRounded

  prop breadcrumbs, :any

  def render(assigns) do
    ~H"""
    <div class="flex gap-2 text-sm">
      <Link to="/">
        Home
      </Link>
      <div :for={{ breadcrumb <- @breadcrumbs }}>
        <div class="flex gap-2 items-center">
          <div><IconChevronRightRounded /></div>
          <Link to={{ breadcrumb.to }}>
            {{ breadcrumb.name }}
          </Link>
          </div>
        </div>
    </div>
    """
  end
end
