defmodule MoonWeb.Pages.Design.Form.GroupPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.Form.GroupExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/v2/form/group",
        name: "Group"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_rtl_support title="Group" image="facing/components/group.png">
        <p>
          Combine different types of inputs into groups to save vertical space on your designs and also simplify form filling.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        GroupExample.Default,
        GroupExample.Horizontal,
        GroupExample.Sizes,
        GroupExample.States,
        GroupExample.Variants
      ]} />

      <PropsTable title="Group props" module={Moon.Design.Form.Group} />
    </Page>
    """
  end

  defp component_anatomy do
    """
    <Group orientation="...">
      <Input />
      <Select />
    </Group>
    """
  end
end
