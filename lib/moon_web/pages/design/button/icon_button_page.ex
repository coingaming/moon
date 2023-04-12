defmodule MoonWeb.Pages.Design.Button.IconButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.IconButtonExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/v2/icon_button",
        name: "IconButton"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="IconButton" image="facing/components/icon_button.png">
        <p>Buttons allow users to take actions, and make choices, with a single tap.</p>
        <p>
          Buttons communicate actions that users can take. They are typically
          placed throughout your UI, in places like:
        </p>
        <ul class="list-disc ps-5">
          <li>Modal windows</li>
          <li>Forms</li>
          <li>Cards</li>
          <li>Toolbars</li>
        </ul>
      </ComponentPageDescription>

      <ExamplesList examples={[
        IconButtonExample.Default,
        IconButtonExample.ButtonAsLinkHtmlElement,
        IconButtonExample.Variants,
        IconButtonExample.Sizes,
        IconButtonExample.Disabled,
        IconButtonExample.Animation
      ]} />

      <PropsTable
        title="IconButton props"
        data={[
          %{
            :name => 'animation',
            :type => 'progress | success | error | pulse',
            :required => 'No',
            :default => '-',
            :description => 'Animation of button'
          },
          %{
            :name => 'disabled',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Disabled button'
          },
          %{
            :name => 'size',
            :type => 'xs | sm | md | lg | xl',
            :required => 'No',
            :default => 'md',
            :description => 'Size of button'
          },
          %{
            :name => 'variant',
            :type => 'primary | secondary | tertiary | ghost',
            :required => 'No',
            :default => 'primary',
            :description => 'Visual/Logical variant of button'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Additional CSS class(es) for the item'
          }
        ]}
      />
    </Page>
    """
  end
end
