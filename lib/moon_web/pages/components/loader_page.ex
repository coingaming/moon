defmodule MoonWeb.Pages.Components.LoaderPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Loader
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data breadcrumbs, :any,
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

  data props_info_array, :list,
    default: [
      %{
        :name => 'color',
        :type => 'string',
        :required => 'false',
        :default => 'bulma-100',
        :description => 'Colour of Loader'
      },
      %{
        :name => 'size',
        :type => 'twoxsmall | xsmall | small | medium | large',
        :required => 'false',
        :default => 'medium',
        :description => 'Size of Loader'
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page active_page={@active_page} breadcrumbs={@breadcrumbs}>
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

      <Context put={theme_class: @theme_name}>
        <ExampleAndCode title="Default" id="loader_1">
          <:example>
            <Loader />
          </:example>

          <:code>{loader_1_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Colors" id="loader_2">
          <:example>
            <Loader color="hit-100" />
            <Loader color="trunks-100" />
            <Loader color="krillin-100" />
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
      </Context>

      <PropsTable data={@props_info_array} />
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
      <Loader color="hit-100"/>
      <Loader color="trunks-100"/>
      <Loader color="krillin-100"/>
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
