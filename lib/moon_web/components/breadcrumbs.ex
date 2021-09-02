defmodule MoonWeb.Components.Breadcrumbs do
  use MoonWeb, :stateless_component

  alias Moon.Components.Link
  alias Moon.Assets.Icons.IconChevronRightRounded

  prop breadcrumbs, :any
  prop class, :string, default: nil

  def render(assigns) do
    ~F"""
    <div class={"flex gap-2 text-xs #{@class}"}>
      <Link to="/" class="text-trunks-100">
        Home
      </Link>
      <div :for={breadcrumb <- @breadcrumbs}>
        <div class="flex gap-2 items-center">
          <div><IconChevronRightRounded /></div>
          <Link to={breadcrumb.to}>
            {breadcrumb.name}
          </Link>
        </div>
      </div>
    </div>
    """
  end
end
