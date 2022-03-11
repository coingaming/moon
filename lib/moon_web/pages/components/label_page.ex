defmodule MoonWeb.Pages.Components.LabelPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Label
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/badge",
        name: "Label"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown gap={4}>
        <Heading size={56} class="mb-4">Label</Heading>
        <p>
          Small count and labeling component.
        </p>

        <p>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/badge.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/badge">React implementation</Link>
        </p>

        <ExampleAndCode title="Label" id="badge1">
          <:example>
            <LeftToRight>
              <Label>
                Active
              </Label>
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
      <Label>
        Active
      </Label>
    </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Customize colours" id="badge2">
          <:note>
            You coud simstly use color and background_color props
          </:note>
          <:example>
            <LeftToRight>
              <Label color="gohan-100" background_color="piccolo-100">
                Active
              </Label>
              <Label color="krillin-100" background_color="trunks-100">
                Active
              </Label>
              <Label color="bulma-100" background_color="dodoria-100">
                Active
              </Label>
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
        <Label color="gohan-100" background_color="piccolo-100">
          Active
        </Label>
        <Label color="krillin-100" background_color="trunks-100">
          Active
        </Label>
        <Label color="bulma-100" background_color="dodoria-100">
          Active
        </Label>
    </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Customize size" id="badge3">
          <:note>
            You coud simply use size prop. By default size is xSmall. You can change it to Small.
          </:note>
          <:example>
            <LeftToRight>
              <Label>Default</Label>
              <Label size="small">
                small size
              </Label>
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
        <Label>Default</Label>
        <Label size="small">
          small size
        </Label>
      </LeftToRight>
    </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
