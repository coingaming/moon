defmodule MoonWeb.Examples.Design.BreadcrumbExample.ResponsiveItems do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Breadcrumb
  alias Moon.Design.Breadcrumb.Crumb

  data(breadcrumb_items, :list,
    default: [
      %Crumb{
        name: "Home Page",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "User Profile",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Account Settings",
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
      <Breadcrumb id="responsive_items" breadcrumbs={@breadcrumb_items} responsive_crumbs_on="sm" />
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Breadcrumb
    alias Moon.Design.Breadcrumb.Crumb

    data(breadcrumb_items, :list,
      default: [
        %Crumb{
          name: "Home Page",
          link: "/components/v2/breadcrumb"
        },
        %Crumb{
          name: "User Profile",
          link: "/components/v2/breadcrumb"
        },
        %Crumb{
          name: "Account Settings",
          link: "/components/v2/breadcrumb"
        },
        %Crumb{
          name: "Current Page",
          link: "/components/v2/breadcrumb"
        }
      ]
    )

    def render(assigns) do
      ~F\"""
      <div>
        <Breadcrumb id="responsive_items" breadcrumbs={@breadcrumb_items} responsive_crumbs_on="sm" />
      </div>
      \"""
    end
    """
  end
end
