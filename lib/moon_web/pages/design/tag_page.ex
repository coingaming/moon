defmodule MoonWeb.Pages.Design.TagPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.TagExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/tag",
        name: "Tag"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_rtl_support
        title="Tag"
        image="/moon/assets/images/facing/components/tag.png"
      >
        <p>Tags represent a set of interactive keywords that help organise and categorise objects.</p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        TagExample.Default,
        TagExample.Sizes,
        TagExample.WithIcons,
        TagExample.LetterCases,
        TagExample.Customization
      ]} />

      <PropsTable
        title="Tag props"
        data={[
          %{
            :name => 'size',
            :type => '2xs | xs',
            :required => 'No',
            :default => 'xs',
            :description => 'Size of tag'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          },
          %{
            :name => 'is_uppercase',
            :type => 'boolean',
            :required => 'No',
            :default => 'true',
            :description => 'Letter case'
          },
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Tag content'
          },
          %{
            :name => 'left_icon',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Left icon'
          },
          %{
            :name => 'right_icon',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Right icon'
          }
        ]}
      />
    </Page>
    """
  end
end
