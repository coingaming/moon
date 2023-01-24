defmodule MoonWeb.Pages.Components.BreadcrumbPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Components.Breadcrumb
  alias Moon.Components.Breadcrumb.Crumb
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.Facing.DeprecationWarning

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/breadcrumb",
        name: "Breadcrumb"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'breadcrumbs',
        :type => 'list of Moon.Components.Breadcrumb.Crumb',
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
        link: "/app/home"
      },
      %Crumb{
        name: "Current Page",
        link: "/app/corporate"
      }
    ]
  )

  data(breadcrumb_items_2, :list,
    default: [
      %Crumb{
        name: "Home",
        link: "/app/home"
      },
      %Crumb{
        name: "Corporate",
        link: "/app/corporate"
      },
      %Crumb{
        name: "About",
        link: "/app/corporate/about"
      },
      %Crumb{
        name: "Jobs",
        link: "/app/corporate/about/jobs"
      },
      %Crumb{
        name: "Current Page",
        link: "/app/corporate/about/jobs/contact"
      }
    ]
  )

  data(breadcrumb_items_3, :list,
    default: [
      %Crumb{
        name: "Home",
        link: "/app/home"
      },
      %Crumb{
        name: "Corporate",
        link: "/app/corporate"
      },
      %Crumb{
        name: "About",
        link: "/app/corporate/about"
      },
      %Crumb{
        name: "Current Page",
        link: "/app/corporate/about/jobs"
      }
    ]
  )

  data(breadcrumb_items_4, :list,
    default: [
      %Crumb{
        name: "Current Page",
        link: "/app/home"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Breadcrumb">
        <DeprecationWarning
          name="Breadcrumb"
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.BreadcrumbPage,
            theme_name: @theme_name,
            direction: @direction
          )}
        />
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
    data breadcrumb_items_1, :list,
      default: [
        %Crumb{
          name: "Home",
          link: "/app/home"
        },
        %Crumb{
          name: "Current Page",
          link: "/app/corporate"
        }
      ]

    <Breadcrumb id="breadcrumb_1" breadcrumbs={@breadcrumb_items_1} />
    """
  end

  def breadcrumb_2_code do
    """
    data breadcrumb_items, :list,
      default: [
        %Crumb{
          name: "Home",
          link: "/app/home"
        },
        %Crumb{
          name: "Corporate",
          link: "/app/corporate"
        },
        %Crumb{
          name: "About",
          link: "/app/corporate/about"
        },
        %Crumb{
          name: "Jobs",
          link: "/app/corporate/about/jobs"
        },
        %Crumb{
          name: "Current Page",
          link: "/app/corporate/about/jobs/contact"
        }
      ]

    <Breadcrumb id="breadcrumb" breadcrumbs={@breadcrumb_items} />
    """
  end

  def breadcrumb_3_code do
    """
    data breadcrumb_items_3, :list,
      default: [
        %Crumb{
          name: "Home",
          link: "/app/home"
        },
        %Crumb{
          name: "Corporate",
          link: "/app/corporate"
        },
        %Crumb{
          name: "About",
          link: "/app/corporate/about"
        },
        %Crumb{
          name: "Current Page",
          link: "/app/corporate/about/jobs"
        }
      ]
    """
  end

  def breadcrumb_4_code do
    """
    data breadcrumb_items_4, :list,
      default: [
        %Crumb{
          name: "Current Page",
          link: "/app/home"
        }
      ]

    <Breadcrumb id="breadcrumb_4" breadcrumbs={@breadcrumb_items_4} />
    """
  end
end
