defmodule MoonWeb.Pages.Design.LoaderPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.LoaderExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/loader",
        name: "Loader"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Loader" image="facing/components/loader.png">
        <p>
          Loaders provide a visual cue that an action is processing awaiting a course of change or a result.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        LoaderExample.Default,
        LoaderExample.Sizes,
        LoaderExample.Colours
      ]} />

      <PropsTable
        title="Loader props"
        data={[
          %{
            :name => 'color',
            :type => 'string',
            :required => 'No',
            :default => 'hit',
            :description => 'Colour of loader'
          },
          %{
            :name => 'size',
            :type => '2xs | xs | sm | md | lg',
            :required => 'No',
            :default => 'md',
            :description => 'Size of loader'
          }
        ]}
      />
    </Page>
    """
  end
end
