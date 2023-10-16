defmodule MoonWeb.Examples.Design.BreadcrumbExample.HeadlessCollapsed do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Breadcrumb.Collapsed
  alias Moon.Design.Breadcrumb
  alias Moon.Design.Breadcrumb.Crumb

  alias Moon.Icon
  alias Moon.Design.Button.IconButton

  alias Moon.Icon

  data(breadcrumb_items, :list,
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
    <div>
      <Collapsed id="headless-collapsed" breadcrumbs={@breadcrumb_items} responsive_crumbs_on="md">
        <Breadcrumb.FirstItem class="text-piccolo font-medium last:text-chichi">
          <Icon name="arrows_chevron_right_double" class="rtl:rotate-180 mx-2 text-moon-24 text-piccolo" />
        </Breadcrumb.FirstItem>
        <Breadcrumb.ShownItems
          class="text-piccolo font-medium last:text-chichi"
          divider_class="text-moon-24 text-piccolo hover:text-piccolo"
          :let={crumb: crumb}
          divider="arrows_chevron_right_double"
        >
          <Icon name={crumb.icon} :if={Map.has_key?(crumb, :icon) && crumb.icon != ""} />
          {crumb.name}
        </Breadcrumb.ShownItems>
      </Collapsed>
    </div>
    """
  end

  def code() do
    """

    """
  end
end
