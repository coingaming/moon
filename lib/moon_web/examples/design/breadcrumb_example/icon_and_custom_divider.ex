defmodule MoonWeb.Examples.Design.BreadcrumbExample.IconAsStartingItemAndCustomDivider do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Breadcrumb
  alias Moon.Design.Breadcrumb.Crumb

  data(breadcrumb_items, :list,
    default: [
      %Crumb{
        link: "/components/v2/breadcrumb",
        icon: "generic_home"
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
      <Breadcrumb
        id="breadcrumb_custom"
        breadcrumbs={@breadcrumb_items}
        divider="controls_chevron_right"
      />
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
          link: "/components/v2/breadcrumb",
          icon: "generic_home"
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
      ~F\"""
      <div>
        <Breadcrumb
          id="breadcrumb_custom"
          breadcrumbs={@breadcrumb_items}
          divider="controls_chevron_right"
        />
      </div>
      \"""
    end
    """
  end
end
