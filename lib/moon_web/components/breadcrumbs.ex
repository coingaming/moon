defmodule MoonWeb.Components.Breadcrumbs do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Assets.Icons.IconChevronRightRounded
  alias Moon.Components.Link

  prop breadcrumbs, :any
  prop theme_name, :string, default: "lab-light"
  prop class, :string, default: nil

  def render(assigns) do
    ~F"""
    <div class={"flex mb-10 gap-2 text-moon-12 #{@class}"}>
      <Link to="/" class="text-trunks-100">
        Home
      </Link>
      <div :for={breadcrumb <- @breadcrumbs}>
        <div class="flex gap-2 items-center">
          <div><IconChevronRightRounded /></div>
          <Link to={"/#{@theme_name}#{breadcrumb.to}"}>
            {breadcrumb.name}
          </Link>
        </div>
      </div>
    </div>
    """
  end
end
