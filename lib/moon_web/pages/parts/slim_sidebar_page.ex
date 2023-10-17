defmodule MoonWeb.Pages.Parts.SlimSidebarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Examples.Parts.SidebarExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/#",
        name: "Templates"
      },
      %{
        to: "/#",
        name: "Sidebar examples"
      },
      %{
        to: "/sidebar-examples/Slim",
        name: "Slim"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction} hide_left_menu>
      <ComponentPageDescription title="Sidebar examples" />

      <ExamplesList examples={[
        SidebarExample.Slim
      ]} />

      <Moon.Parts.Button>Button</Moon.Parts.Button>
      <Moon.Parts.Button.Gray>Button</Moon.Parts.Button.Gray>
      <Moon.Parts.Button.White>Button</Moon.Parts.Button.White>
      <Moon.Parts.Button.Success>Button</Moon.Parts.Button.Success>
      <Moon.Parts.Button.Warning>Button</Moon.Parts.Button.Warning>
      <Moon.Parts.Button.Error>Button</Moon.Parts.Button.Error>

      <Moon.Parts.IconButton icon="generic_settings" />
      <Moon.Parts.IconButton.Gray icon="generic_settings" />
      <Moon.Parts.IconButton.White icon="generic_settings" />
      <Moon.Parts.IconButton.Success icon="generic_settings" />
      <Moon.Parts.IconButton.Warning icon="generic_settings" />
      <Moon.Parts.IconButton.Error icon="generic_settings" />
    </Page>
    """
  end

  def component_anatomy() do
    """
    <Sidebar.Slim>
      <Sidebar.SlimLogo />
      <Sidebar.SlimMenuLink>...</Sidebar.SlimMenuLink>
      <:bottom>
        <Sidebar.SlimMenuLink>...</Sidebar.SlimMenuLink>
      </:bottom>
    </Sidebar.Slim>
    """
  end
end
