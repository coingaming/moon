defmodule MoonWeb.Pages.Components.ButtonPage do
  use MoonWeb, :live_view
  alias Moon.Components.Button
  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <h1>Button</h1>

    <h2>Variants</h2>

    <h3>Primary</h3>
    To be used where the the button would be the main call to action on the page.
    <Inline>
      <Button variant="primary">Default</Button>
      <Button variant="primary" mock_state="hover">
        Hover
      </Button>
      <Button variant="primary" mock_state="active">
        Focus
      </Button>
      <Button variant="primary" disabled>
        Disabled
      </Button>
    </Inline>
    <#CodePreview>
      <Inline>
        <Button variant="primary">Default</Button>
        <Button variant="primary" mock_state="hover">
          Hover
        </Button>
        <Button variant="primary" mock_state="active">
          Focus
        </Button>
        <Button variant="primary" disabled>
          Disabled
        </Button>
      </Inline>
    </#CodePreview>

    <h3>Secondary</h3>
    To be used where the the button would be the main call to action on the page.
    <Inline>
      <Button variant="secondary">Default</Button>
      <Button variant="secondary" mock_state="hover">
        Hover
      </Button>
      <Button variant="secondary" mock_state="active">
        Focus
      </Button>
      <Button variant="secondary" disabled>
        Disabled
      </Button>
    </Inline>
    <#CodePreview>
      <Inline>
        <Button variant="secondary">Default</Button>
        <Button variant="secondary" mock_state="hover">
          Hover
        </Button>
        <Button variant="secondary" mock_state="active">
          Focus
        </Button>
        <Button variant="secondary" disabled>
          Disabled
        </Button>
      </Inline>
    </#CodePreview>

    <h3>Tertiary</h3>
    To be used where the the button would be a optional call to action.
    <Inline>
      <Button variant="tertiary">Default</Button>
      <Button variant="tertiary" mock_state="hover">
        Hover
      </Button>
      <Button variant="tertiary" mock_state="active">
        Focus
      </Button>
      <Button variant="tertiary" disabled>
        Disabled
      </Button>
    </Inline>
    <#CodePreview>
      <Inline>
        <Button variant="tertiary">Default</Button>
        <Button variant="tertiary" mock_state="hover">
          Hover
        </Button>
        <Button variant="tertiary" mock_state="active">
          Focus
        </Button>
        <Button variant="tertiary" disabled>
          Disabled
        </Button>
      </Inline>
    </#CodePreview>

    <h3>Highlight</h3>
    To be used where the the button would be a optional call to action.
    <Inline>
      <Button variant="highlight">Default</Button>
      <Button variant="highlight" mock_state="hover">
        Hover
      </Button>
      <Button variant="highlight" mock_state="active">
        Focus
      </Button>
      <Button variant="highlight" disabled>
        Disabled
      </Button>
    </Inline>
    <#CodePreview>
      <Inline>
        <Button variant="highlight">Default</Button>
        <Button variant="highlight" mock_state="hover">
          Hover
        </Button>
        <Button variant="highlight" mock_state="active">
          Focus
        </Button>
        <Button variant="highlight" disabled>
          Disabled
        </Button>
      </Inline>
    </#CodePreview>

    <h3>Default</h3>
    To be used where the the button would be a default call to action.
    <Inline>
      <Button>Default</Button>
      <Button mock_state="hover">
        Hover
      </Button>
      <Button mock_state="active">
        Focus
      </Button>
      <Button disabled>
        Disabled
      </Button>
    </Inline>
    <#CodePreview>
      <Inline>
        <Button>Default</Button>
        <Button mock_state="hover">
          Hover
        </Button>
        <Button mock_state="active">
          Focus
        </Button>
        <Button disabled>
          Disabled
        </Button>
      </Inline>
    </#CodePreview>

    <h2>Sizing</h2>

    <h3>Sizes</h3>
    <Inline>
      <Button variant="primary" size="xsmall">
        Xsmall
      </Button>
      <Button variant="primary" size="small">
        Small
      </Button>
      <Button variant="primary" size="medium">
        Medium
      </Button>
      <Button variant="primary" size="large">
        Large
      </Button>
    </Inline>
    <#CodePreview>
      <Inline>
        <Button variant="primary" size="xsmall">
          Xsmall
        </Button>
        <Button variant="primary" size="small">
          Small
        </Button>
        <Button variant="primary" size="medium">
          Medium
        </Button>
        <Button variant="primary" size="large">
          Large
        </Button>
      </Inline>
    </#CodePreview>

    <h3>Full width</h3>
    <Button variant="secondary" full_width>
      Full Width
    </Button>
    <#CodePreview>
      <Button variant="secondary" full_width>
        Full Width
      </Button>
    </#CodePreview>
    """
  end
end
