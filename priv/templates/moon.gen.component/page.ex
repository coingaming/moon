defmodule MoonWeb.Pages.Design.<%= name %>Page do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.<%= name %>Example

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/<%= path %>",
        name: "<%= short %>"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        title="<%= short %>"
        image="facing/components/<%= String.downcase(short) %>.png"
      >
        <p></p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        <%= short %>Example.Default,
      ]} />

      <PropsTable title="<%= short %> props" module={Moon.Design.<%= name %>} />
    </Page>
    """
  end

  defp component_anatomy do
    """

    """
  end
end
