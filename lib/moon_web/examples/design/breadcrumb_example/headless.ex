defmodule MoonWeb.Examples.Design.BreadcrumbExample.Headless do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Breadcrumb.Extended
  alias Moon.Design.Breadcrumb
  alias Moon.Design.Breadcrumb.Crumb

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
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Current Page",
        link: "/components/v2/breadcrumb"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <div>
      <Extended id="breadcrumb_headless" breadcrumbs={@breadcrumb_items} responsive_crumbs_on="md">
        <Breadcrumb.Item
          class="text-chichi text-moon-32 hover:text-krillin gap-4 last:text-roshi"
          divider_class="text-moon-24 text-piccolo hover:text-piccolo"
          :let={crumb: crumb}
          divider="controls_chevron_right"
        ><Icon name={crumb.icon} :if={Map.has_key?(crumb, :icon) && crumb.icon != ""} />{crumb.name}</Breadcrumb.Item>
      </Extended>
    </div>
    """
  end

  def code() do
    """

    """
  end
end
