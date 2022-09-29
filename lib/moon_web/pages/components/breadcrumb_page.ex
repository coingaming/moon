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

  data breadcrumbs, :any,
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

  data props_info_array, :list,
    default: [
      %{
        :name => 'breadcrumbs',
        :type => 'list of Moon.Components.Breadcrumb.Crumb',
        :required => 'false',
        :default => '[]',
        :description => 'Crumbs to display'
      }
    ]

  data breadcrumb_items_1, :list,
    default: [
      %Crumb{
        name: "Home",
        link: "/app/home"
      },
      %Crumb{
        name: "Corporate",
        link: "/app/corporate"
      }
    ]

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
        name: "Contact",
        link: "/app/corporate/about/jobs/contact"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={32}>Breadcrumb</Heading>

        <ExampleAndCode title="Extended" id="breadcrumb_1">
          <:example>
            <div class="flex justify-center items-center py-1">
              <Breadcrumb id="breadcrumb_1" breadcrumbs={@breadcrumb_items_1} />
            </div>
          </:example>

          <:code>{breadcrumb_1_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Collapsed" id="breadcrumb_2">
          <:example>
            <div class="flex justify-center items-center">
              <Breadcrumb id="breadcrumb_2" breadcrumbs={@breadcrumb_items_2} />
            </div>
          </:example>

          <:code>{breadcrumb_2_code()}</:code>
        </ExampleAndCode>

        <div>
          <div class="text-bulma-100 items-center text-moon-20 font-normal my-4">Props</div>
          <Table items={@props_info_array}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type" :let={item: item}>
              {item.type}
            </Column>
            <Column name="required" label="Required" :let={item: item}>
              {item.required}
            </Column>
            <Column name="default" label="Default" :let={item: item}>
              {item.default}
            </Column>
            <Column name="description" label="Description" :let={item: item}>
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
          name: "Corporate",
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
          name: "Contact",
          link: "/app/corporate/about/jobs/contact"
        }
      ]

    <Breadcrumb id="breadcrumb_2" breadcrumbs={@breadcrumb_items_2} />
    """
  end
end
