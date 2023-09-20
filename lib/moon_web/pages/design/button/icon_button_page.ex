defmodule MoonWeb.Pages.Design.Button.IconButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.IconButtonExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/icon_button",
        name: "IconButton"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="IconButton" image="facing/components/icon_button.png">
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
        IconButtonExample.Default,
        IconButtonExample.ButtonAsLinkHtmlElement,
        IconButtonExample.Variants,
        IconButtonExample.Sizes,
        IconButtonExample.Disabled,
        IconButtonExample.Animation,
        IconButtonExample.Customization
      ]} />

      <PropsTable module={Moon.Design.Button.IconButton} />
    </Page>
    """
  end
end
