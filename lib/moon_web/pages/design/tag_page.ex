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

      <PropsTable module={Moon.Design.Tag} />
    </Page>
    """
  end
end
