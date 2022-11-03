defmodule MoonWeb.Pages.Components.BreadcrumbPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Components.Breadcrumb
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column
  alias Moon.Components.Breadcrumb.Crumb

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
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
        :required => 'false',
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
      <TopToDown>
        <Heading size={32}>Breadcrumb</Heading>

        <ExampleAndCode title="Five or more items" id="breadcrumbs_2">
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

        <div>
          <div class="text-bulma-100 items-center text-moon-20 font-normal my-4">Props</div>
          <Table items={item <- @props_info_array}>
            <Column name="name" label="Name" is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type">
              {item.type}
            </Column>
            <Column name="required" label="Required">
              {item.required}
            </Column>
            <Column name="default" label="Default">
              {item.default}
            </Column>
            <Column name="description" label="Description">
              {item.description}
            </Column>
          </Table>
        </div>
      </TopToDown>
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
    data breadcrumb_items_2, :list,
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

    <Breadcrumb id="breadcrumb_3" breadcrumbs={@breadcrumb_items_3} />
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
