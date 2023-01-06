defmodule MoonWeb.Pages.Design.BreadcrumbPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Design.Breadcrumb
  alias Moon.Design.Breadcrumb.Crumb
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/breadcrumb",
        name: "Breadcrumb"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'breadcrumbs',
        :type => 'list of Moon.Design.Breadcrumb.Crumb',
        :required => 'No',
        :default => '[]',
        :description => 'Crumbs to display'
      }
    ]
  )

  data(breadcrumb_items_1, :list,
    default: [
      %Crumb{
        name: "Home",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Current Page",
        link: "/components/v2/breadcrumb"
      }
    ]
  )

  data(breadcrumb_items_2, :list,
    default: [
      %Crumb{
        name: "Home",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Page 2",
        link: "/components/v2/breadcrumb"
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
        link: "/components/v2/breadcrumb"
      }
    ]
  )

  data(breadcrumb_items_3, :list,
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

  data(breadcrumb_items_4, :list,
    default: [
      %Crumb{
        name: "Current Page",
        link: "/components/v2/breadcrumb"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress is_rtl_support title="Breadcrumb">
        <p>
          A list of links showing the location of the current page in the navigational hierarchy.
        </p>
      </ComponentPageDescription>
      <ExampleAndCode title="Five and more items" id="breadcrumbs_2">
        <:example>
          <div class="flex justify-center items-center">
            <Breadcrumb id="breadcrumb_2" breadcrumbs={@breadcrumb_items_2} />
          </div>
        </:example>

        <:code>{breadcrumb_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Four items" id="breadcrumbs_3">
        <:example>
          <div class="flex justify-center items-center py-1">
            <Breadcrumb id="breadcrumb_3" breadcrumbs={@breadcrumb_items_3} />
          </div>
        </:example>

        <:code>{breadcrumb_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Two items" id="breadcrumbs_1">
        <:example>
          <div class="flex justify-center items-center py-1">
            <Breadcrumb id="breadcrumb_1" breadcrumbs={@breadcrumb_items_1} />
          </div>
        </:example>

        <:code>{breadcrumb_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="One item" id="breadcrumbs_4">
        <:example>
          <div class="flex justify-center items-center py-1">
            <Breadcrumb id="breadcrumb_4" breadcrumbs={@breadcrumb_items_4} />
          </div>
        </:example>

        <:code>{breadcrumb_4_code()}</:code>
      </ExampleAndCode>
      <PropsTable title="Breadcrumb props" data={@props_info_array} />
    </Page>
    """
  end

  def breadcrumb_1_code do
    """
    data(breadcrumb_items_1, :list,
      default: [
        %Crumb{
          name: "Home",
          link: "/components/v2/breadcrumb"
        },
        %Crumb{
          name: "Current Page",
          link: "/components/v2/breadcrumb"
        }
      ]
    )

    <Breadcrumb id="breadcrumb_1" breadcrumbs={@breadcrumb_items_1} />
    """
  end

  def breadcrumb_2_code do
    """
    data(breadcrumb_items_2, :list,
      default: [
        %Crumb{
          name: "Home",
          link: "/components/v2/breadcrumb"
        },
        %Crumb{
          name: "Page 2",
          link: "/components/v2/breadcrumb"
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
          link: "/components/v2/breadcrumb"
        }
      ]
    )

    <Breadcrumb id="breadcrumb_2" breadcrumbs={@breadcrumb_items_2} />
    """
  end

  def breadcrumb_3_code do
    """
      data(breadcrumb_items_3, :list,
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

    <Breadcrumb id="breadcrumb_3" breadcrumbs={@breadcrumb_items_3} />
    """
  end

  def breadcrumb_4_code do
    """
    data(breadcrumb_items_4, :list,
      default: [
        %Crumb{
          name: "Current Page",
          link: "/components/v2/breadcrumb"
        }
      ]
    )

    <Breadcrumb id="breadcrumb_4" breadcrumbs={@breadcrumb_items_4} />
    """
  end
end
