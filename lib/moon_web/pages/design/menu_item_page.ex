defmodule MoonWeb.Pages.Design.MenuItemPage do
  @moduledoc false
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.MenuItemExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/menu_item",
        name: "MenuItem"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_aria_support
        title="MenuItem"
        image="facing/components/menu_item.png"
      >
        <p>Menu items are used in such vertical menues and containers as Popovers, Sidebars, Drawers, Dialogs etc.</p>
        <p>
          Menu item row heights can vary based on the amount of content in each
          row. The content in each row is flexible. By default, each menu item
          row height is Medium(md) 40px for one line of content.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        MenuItemExample.Default,
        MenuItemExample.AsLink,
        MenuItemExample.Sizes,
        MenuItemExample.WithIcon,
        MenuItemExample.WithMeta,
        MenuItemExample.Checkbox,
        MenuItemExample.Radio,
        MenuItemExample.MultiTitle,
        MenuItemExample.MultiLineItems,
        MenuItemExample.ExpandCollapse
      ]} />

      <PropsTable module={Moon.Design.MenuItem} />
    </Page>
    """
  end

  def component_anatomy do
    """
    <MenuItem>...</MenuItem>
    """
  end
end
