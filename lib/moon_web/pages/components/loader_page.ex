defmodule MoonWeb.Pages.Components.LoaderPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Loader
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/loader",
        name: "Loader"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'color',
        :type => 'string',
        :required => 'No',
        :default => 'hit',
        :description => 'Colour of Loader'
      },
      %{
        :name => 'size',
        :type => '2xs | xs | sm | md | lg',
        :required => 'No',
        :default => 'md',
        :description => 'Size of Loader'
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Loader">
        <p>
          Fondly nicknamed “the launcher”, the Loader ensures users that progress is happening so they don't give up and leave the rocket page.
        </p>
        <p>
          The Loader, along with a succinct message, is especially important after a user initiates an action that requires them to wait. This is so that they know there's no need to repeat what they've done.
        </p>
        <p>
          Default colour: Hit
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="loader_1">
        <:example>
          <Loader />
        </:example>

        <:code>{loader_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Colors" id="loader_2">
        <:example>
          <Loader />
          <Loader color="trunks" />
          <Loader color="krillin" />
        </:example>

        <:code>{loader_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="loader_3">
        <:example>
          <Loader size="twoxsmall" />
          <Loader size="xsmall" />
          <Loader size="small" />
          <Loader />
          <Loader size="large" />
        </:example>

        <:code>{loader_3_code()}</:code>
      </ExampleAndCode>

      <PropsTable title="Loader props" data={@props_info_array} />
    </Page>
    """
  end

  def loader_1_code do
    """
      <Loader/>
    """
  end

  def loader_2_code do
    """
      <Loader color="hit"/>
      <Loader color="trunks"/>
      <Loader color="krillin"/>
    """
  end

  def loader_3_code do
    """
      <Loader size="twoxsmall"/>
      <Loader size="xsmall"/>
      <Loader size="small"/>
      <Loader />
      <Loader size="large"/>
    """
  end
end
