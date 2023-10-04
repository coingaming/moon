defmodule MoonWeb.Examples.Design.BreadcrumbExample.FourItems do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Breadcrumb
  alias Moon.Design.Breadcrumb.Crumb

  data(breadcrumb_items, :list,
    default: [
      %Crumb{
        name: "Home",
        link: "/components/v2/breadcrumb"
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
        id="breadcrumb_4"
        breadcrumbs={@breadcrumb_items}
        divider_class="text-chichi mx-4 text-moon-24"
        list_item_class="text-krillin last:text-chichi"
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
          name: "Home",
          link: "/components/v2/breadcrumb"
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
        <Breadcrumb id="breadcrumb_4" breadcrumbs={@breadcrumb_items} />
      </div>
      \"""
    end
    """
  end
end
