defmodule MoonWeb.Examples.Design.BreadcrumbExample.HeadlessCollapsed do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Breadcrumb
  alias Moon.Design.Breadcrumb.Crumb

  prop(breadcrumb_items, :list,
    default: [
      %Crumb{
        link: "/components/v2/breadcrumb",
        icon: "generic_home",
        name: "Home"
      },
      %Crumb{
        name: "Page 1",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Page 2",
        link: "/components/v2/breadcrumb",
        icon: "generic_user"
      },
      %Crumb{
        name: "Page 3",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Page 4",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Current Page",
        link: "/components/v2/breadcrumb",
        icon: "generic_user"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Breadcrumb.Collapsed
      divider="arrows_chevron_right_double"
      divider_class="text-moon-24 text-piccolo hover:text-piccolo"
      id="headless-collapsed"
      breadcrumbs={@breadcrumb_items}
      responsive_crumbs_on="md"
    >
      <Breadcrumb.Item class="text-piccolo font-medium last:text-chichi" :let={crumb: crumb}>
        {crumb.name}
      </Breadcrumb.Item>
    </Breadcrumb.Collapsed>
    """
  end

  def code() do
    """

    """
  end
end
