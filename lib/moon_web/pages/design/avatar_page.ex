defmodule MoonWeb.Pages.Design.AvatarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Tabs
  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.AvatarExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/avatar",
        name: "Avatar"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        is_rtl_support
        title="Avatar"
        image="facing/components/avatar.png"
      >
        <p>
          The Avatar component is typically used to display images, icons, or initials representing people or other entities.
        </p>
      </ComponentPageDescription>

      <Tabs id="anatomy-tabs" class="justify-between gap-6">
        <h2 class="text-moon-24 font-medium">Anatomy</h2>
        <Tabs.List tab_titles={["Short syntax", "Long syntax"]} class="w-auto" />
        <Tabs.Panels>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:short)}</Anatomy></Tabs.Panel>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:long)}</Anatomy></Tabs.Panel>
        </Tabs.Panels>
      </Tabs>

      <ExamplesList examples={[
        AvatarExample.Default,
        AvatarExample.Variants,
        AvatarExample.Sizes,
        AvatarExample.ActiveStatus,
        AvatarExample.StatusOrigin,
        AvatarExample.Customization
      ]} />

      <PropsTable module={Moon.Design.Avatar} />
      <PropsTable module={Moon.Design.Avatar.Status} />
    </Page>
    """
  end

  def component_anatomy(:long) do
    """
    <Avatar>
      <Icon name="..." />
      <Avatar.Status />
    </Avatar>
    """
  end

  def component_anatomy(:short) do
    """
    <Avatar>
      <Avatar.Status />
    </Avatar>
    """
  end
end
