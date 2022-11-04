defmodule MoonWeb.Pages.PhoenixUsagePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.CodeSnippet
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PageSection

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/usage_with_phoenix_templates",
        name: "Usage with Phoenix templates"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <h1 class="text-moon-32 font-semibold">Usage with Phoenix templates</h1>
      <PageSection>
        <p>
          If you find a Moon component you want to use in your existing non-surface templates the recommended way
          is to replace the live views (or components) that will use the desired component with their Surface's counterparts. See
          <a
            class="text-piccolo-100 font-medium transition-colors duration-200 hover:text-hit visited:text-hit"
            href="https://surface-ui.org/usage_with_phoenix_templates"
            rel="nofollow"
            target="_blank"
          >
            Surface guides
          </a>
        </p>
        <p>
          Another solution is to use Moon helpers for rendering  components in PhoenixLiveView templates, i.e. using ~H or in *.heex files, is partially
          supported, however, this approach is limited and mostly not recommended. Keep in mind that Surface extends Liveview, adding extra features
          like slots and contexts, that are partially supported by helpers.
        </p>
      </PageSection>
      <PageSection title="Examples">
        <p>Imagine you want to insert Button component to a template. Using Surface your code will look like</p>
        <CodeSnippet>{surface_code()}</CodeSnippet>
        <p>The same with LiveView only</p>
        <CodeSnippet>{liveview_code()}</CodeSnippet>
        <p>
          Please note that moon_component function can render only stateless component. For stateful one you should use
          moon_live_component function. And moon function can be used for both types of components.
        </p>
      </PageSection>
      <PageSection title="Context">
        <p>
          Context usage is a bit tricky. You have to pass it as a Map to the __context__ attribute. And it will not be populated to the
          child components within template. See examples
        </p>
        <CodeSnippet>{surface_context_code()}</CodeSnippet>
        <CodeSnippet>{liveview_context_code()}</CodeSnippet>
      </PageSection>
    </Page>
    """
  end

  def surface_code() do
    """
    alias Moon.Components.Button

    def render(assigns) do
      ~F\"""
        ...
          <Button variant="secondary">Secondary</Button>
        ...
      \"""
    end
    """
  end

  def liveview_code() do
    """
    alias Moon.Components.Button

    import Moon.Helpers.MoonRender

    def render(assigns) do
      ~H\"""
        ...
          <.moon module={Button} variant="secondary">Secondary</.moon>

          # or, if you wish more explicit naming - use for stateless component
          <.moon_component module={Button} variant="secondary">Secondary</.moon_component>
        ...
      \"""
    end
    """
  end

  def surface_context_code() do
    """
    # with Surface
    def render(assigns) do
      ~F\"""
        ...
          <Context put={locale: @locale}>
            <Button variant="secondary">Secondary</Button>
          </Context>
        ...
      \"""
    end
    """
  end

  def liveview_context_code() do
    """
    # without Surface
    def render(assigns) do
      ~H\"""
        ...
          <.moon module={Button}
              variant="secondary"
              __context__={%{locale: @locale}}
          >
            Secondary
          </.moon>
        ...
      \"""
    end
    """
  end
end
