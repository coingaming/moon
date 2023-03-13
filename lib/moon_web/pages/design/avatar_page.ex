defmodule MoonWeb.Pages.Design.AvatarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.AvatarExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/chip",
        name: "Avatar"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress is_rtl_support title="Avatar">
        <p>
          The Avatar component is typically used to display images, icons, or initials representing people or other entities.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        AvatarExample.Default
      ]} />

      <PropsTable
        title="Avatar props"
        data={[
          %{
            :name => 'class',
            :type => 'css_classs',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          }
        ]}
      />
    </Page>
    """
  end
end
