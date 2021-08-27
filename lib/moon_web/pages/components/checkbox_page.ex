defmodule MoonWeb.Pages.Components.CheckboxPage do
  use MoonWeb, :live_view
  alias Moon.Components.Checkbox
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Breadcrumbs

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/checkbox",
        name: "Checkbox"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={32}>Checkbox</Heading>
      <p>
        <Link to="https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=929%3A12590">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/checkbox_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/checkbox">React implementation</Link>
      </p>
      <p>
        Checkboxes are used as a list in our forms and signup pages so users can select options of their choice. Users are free to choose how many options to select, from zero to all of them.

        As each checkbox is independent, this means that additional checkboxes do not affect any other selections… or planets. .
      </p>

      <Heading size={16}>Checkbox</Heading>
      <ExampleAndCode>
        <:example>
          <Checkbox>
            I agree to receive bonus & marketing emails.
          </Checkbox>
        </:example>

        <:code>
          <#CodePreview>
        <Checkbox>
          I agree to receive bonus & marketing emails.
        </Checkbox>
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={16}>Disabled</Heading>
      <ExampleAndCode>
        <:example>
          <Checkbox disabled="true">
            I agree to receive bonus & marketing emails.
          </Checkbox>
        </:example>

        <:code>
          <#CodePreview>
        <Checkbox disabled="true">
          I agree to receive bonus & marketing emails.
        </Checkbox>
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={16}>Selected Disabled</Heading>
      <ExampleAndCode>
        <:example>
          <Checkbox disabled="true" checked="true">
            I agree to receive bonus & marketing emails.
          </Checkbox>
        </:example>

        <:code>
          <#CodePreview>
        <Checkbox disabled="true" checked="true">
          I agree to receive bonus & marketing emails.
        </Checkbox>
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={16}>Checked</Heading>
      <ExampleAndCode>
        <:example>
          <Checkbox checked="true">
            I agree to receive bonus & marketing emails.
          </Checkbox>
        </:example>

        <:code>
          <#CodePreview>
        <Checkbox checked="true">
          I agree to receive bonus & marketing emails.
        </Checkbox>
    </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
