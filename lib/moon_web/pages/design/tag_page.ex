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
        to: "/components",
        name: "Components"
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
      <ComponentPageDescription is_rtl_support title="Tag" image="facing/components/tag.png">
        <p>Tags represent a set of interactive keywords that help organise and categorise objects.</p>
        <p>Tags can be added or removed from an object.</p>
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
            :name => ~c"size",
            :type => ~c"2xs | xs",
            :required => ~c"No",
            :default => ~c"xs",
            :description => ~c"Size of tag"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for customization"
          },
          %{
            :name => ~c"is_uppercase",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"true",
            :description => ~c"Letter case"
          },
          %{
            :name => ~c"default",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tag content"
          },
          %{
            :name => ~c"left_icon",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Left icon"
          },
          %{
            :name => ~c"right_icon",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Right icon"
          }
        ]}
      />
    </Page>
    """
  end
end
