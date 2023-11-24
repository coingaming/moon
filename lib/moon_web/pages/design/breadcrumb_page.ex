defmodule MoonWeb.Pages.Design.BreadcrumbPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExamplesList

  alias MoonWeb.Examples.Design.BreadcrumbExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/breadcrumb",
        name: "Breadcrumb"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_aria_support
        is_rtl_support
        title="Breadcrumb"
        image="facing/components/breadcrumb.png"
      >
        <p>
          A list of links showing the location of the current page in the navigational hierarchy.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        BreadcrumbExample.FiveAndMoreItems,
        BreadcrumbExample.FourItems,
        BreadcrumbExample.TwoItems,
        BreadcrumbExample.OneItem,
        BreadcrumbExample.IconAsStartingItemAndCustomDivider,
        BreadcrumbExample.ResponsiveItems,
        BreadcrumbExample.HeadlessExtended,
        BreadcrumbExample.HeadlessCollapsed
      ]} />

      <PropsTable module={Moon.Design.Breadcrumb} />
      <PropsTable module={Moon.Design.Breadcrumb.Extended} />
      <PropsTable module={Moon.Design.Breadcrumb.Collapsed} />
      <PropsTable module={Moon.Design.Breadcrumb.Item} />
      <PropsTable module={Moon.Design.Breadcrumb.Dropdown} />
      <PropsTable module={Moon.Design.Breadcrumb.Item.Divider} />
    </Page>
    """
  end
end
