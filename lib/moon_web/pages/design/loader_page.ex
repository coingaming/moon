defmodule MoonWeb.Pages.Design.LoaderPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Loader
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/loader",
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
        :description => 'Colour of loader'
      },
      %{
        :name => 'size',
        :type => '2xs | xs | sm | md | lg',
        :required => 'No',
        :default => 'md',
        :description => 'Size of loader'
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Loader">
        <p>
          Loaders provide a visual cue that an action is processing awaiting a course of change or a result.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="loader_1">
        <:example>
          <Loader />
        </:example>

        <:code>{loader_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="loader_2">
        <:example>
          <Loader size="2xs" />
          <Loader size="xs" />
          <Loader size="sm" />
          <Loader />
          <Loader size="lg" />
        </:example>

        <:code>{loader_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Colours" id="loader_3">
        <:example>
          <Loader color="dodoria" />
          <Loader color="trunks" />
          <Loader color="raditz" />
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
      <Loader size="2xs" />
      <Loader size="xs" />
      <Loader size="sm" />
      <Loader />
      <Loader size="lg" />
    """
  end

  def loader_3_code do
    """
      <Loader color="dodoria"/>
      <Loader color="trunks" />
      <Loader color="raditz" />
    """
  end
end
