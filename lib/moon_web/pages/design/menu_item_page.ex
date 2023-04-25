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
        to: "#",
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
        MenuItemExample.WithIcon,
        MenuItemExample.WithMeta,
        MenuItemExample.Checkbox,
        MenuItemExample.Radio,
        MenuItemExample.MultiTitle,
        MenuItemExample.MultiLineItems,
        MenuItemExample.ExpandCollapse
      ]} />

      <PropsTable
        title="MenuItem props"
        data={[
          %{
            :name => 'title',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Title of item, only if no slot is given'
          },
          %{
            :name => 'text',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Some hint to be shown under the title'
          },
          %{
            :name => 'is_active',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'To mark menu item as an active (bg only)'
          },
          %{
            :name => 'is_selected',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Selected/checked/expanded if role is given'
          },
          %{
            :name => 'role',
            :type => 'checkbox | switch | radio',
            :required => 'No',
            :default => '-',
            :description => 'Role to MenuItem acts as'
          },
          %{
            :name => 'on_click',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Role-depending event handler'
          },
          %{
            :name => 'width',
            :type => 'css_class',
            :required => 'No',
            :default => 'w-full',
            :description => 'Width of the item'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Additional CSS class(es) for the item'
          },
          %{
            :name => 'as',
            :type => 'a | button',
            :required => 'No',
            :default => 'button',
            :description => 'HTML tag to be used to render item'
          },
          %{
            :name => 'attrs',
            :type => 'Map | List',
            :required => 'No',
            :default => '%{}',
            :description => 'HTML attributes to be set for tag given by as'
          }
        ]}
      />
    </Page>
    """
  end

  def component_anatomy do
    """
    <MenuItem>...</MenuItem>
    """
  end
end
