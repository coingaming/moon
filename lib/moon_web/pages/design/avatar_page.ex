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
        image="/moon/assets/images/facing/components/avatar.png"
      >
        <p>
          The Avatar component is typically used to display images, icons, or initials representing people or other entities.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        AvatarExample.Default,
        AvatarExample.Variants,
        AvatarExample.Rounded,
        AvatarExample.CustomColours,
        AvatarExample.Sizes,
        AvatarExample.ActiveStatus,
        AvatarExample.StatusOrigin
      ]} />

      <PropsTable
        title="Avatar props"
        data={[
          %{
            :name => 'bg_color',
            :type => 'string',
            :required => 'No',
            :default => 'bg-gohan',
            :description => 'Background color'
          },
          %{
            :name => 'color',
            :type => 'string',
            :required => 'No',
            :default => 'text-bulma',
            :description => 'Text color'
          },
          %{
            :name => 'image_url',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Path to the image'
          },
          %{
            :name => 'is_rounded',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Rounded border radius'
          },
          %{
            :name => 'is_status_active',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Active state for status indication'
          },
          %{
            :name => 'name',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Capital letters of name'
          },
          %{
            :name => 'size',
            :type => 'xs | sm | md | lg | xl | 2xl',
            :required => 'No',
            :default => 'md',
            :description => 'Size of avatar'
          },
          %{
            :name => 'status_origin',
            :type => '%StatusOrigin{ vertical: top | bottom, horizontal: left | right }',
            :required => 'No',
            :default => '%StatusOrigin{vertical: "bottom", horizontal: "right"}',
            :description => 'Position for status indicator'
          },
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
