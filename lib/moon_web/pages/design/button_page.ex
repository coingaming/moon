defmodule MoonWeb.Pages.Design.Button.ButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.ButtonExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/button",
        name: "Button"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_rtl_support title="Button" image="facing/components/button.png">
        <p>Buttons allow users to take actions, and make choices, with a single tap.</p>
        <p>
          Buttons communicate actions that users can take. They are typically
          placed throughout your UI, in places like:
        </p>
        <ul class="list-disc ps-5">
          <li>Modal windows</li>
          <li>Forms</li>
          <li>Cards</li>
          <li>Toolbars</li>
        </ul>
      </ComponentPageDescription>

      <ExamplesList examples={[
        ButtonExample.Default,
        ButtonExample.ButtonAsLinkHtmlElement,
        ButtonExample.Variants,
        ButtonExample.Sizes,
        ButtonExample.Icons,
        ButtonExample.FullWidth,
        ButtonExample.Disabled,
        ButtonExample.Animations,
        ButtonExample.MultiLine,
        ButtonExample.Customization
      ]} />

      <PropsTable module={Moon.Design.Button} />
    </Page>
    """
  end
end
