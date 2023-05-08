defmodule MoonWeb.Pages.ResponsiveWebPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.UIPattern.Visibility.OnlyTabletAndDesktop
  alias Moon.UIPattern.Visibility.OnlyMobile
  alias Moon.UIPattern.Visibility.VisibleTabletAndDesktop
  alias Moon.UIPattern.Visibility.VisibleMobile
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/responsive-web",
        name: "Responsive Web"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Responsive Web">
        <p>Responsive Web comes in different flavours.</p>
        <ul class="list-decimal list-inside">
          <li>Moon provides components that automatically behave correctly on different devices.</li>
          <li>Application developer can use existing components for CSS rendering and HTML dom rendering.</li>
        </ul>
      </ComponentPageDescription>
      <ExampleAndCode id="only-rendered-for-device" title="HTML rendered only for specific device">
        <:example>
          <OnlyMobile>
            Only on Mobile (inspect HTML)
          </OnlyMobile>
          <OnlyTabletAndDesktop>
            Only on Tablet and Desktop (inspect HTML)
          </OnlyTabletAndDesktop>
        </:example>
        <:code>{only_rendered_for_device()}</:code>
      </ExampleAndCode>
      <ExampleAndCode
        id="only-visible-for-device"
        title="HTML rendered for both devices, but CSS is used to hide HTML dom"
      >
        <:example>
          <VisibleMobile>
            Visible on Mobile, but in HTML for desktop also (inspect HTML)
          </VisibleMobile>
          <VisibleTabletAndDesktop>
            Visible on Tablet and Desktop, but in HTML for mobile also (inspect HTML)
          </VisibleTabletAndDesktop>
        </:example>
        <:code>{only_visible_for_device()}</:code>
      </ExampleAndCode>
    </Page>
    """
  end

  def only_rendered_for_device() do
    """
    alias Moon.UIPattern.Visibility.OnlyTabletAndDesktop
    alias Moon.UIPattern.Visibility.OnlyMobile

    <OnlyMobile>
      Only on Mobile (inspect HTML)
    </OnlyMobile>
    <OnlyTabletAndDesktop>
      Only on Tablet and Desktop (inspect HTML)
    </OnlyTabletAndDesktop>
    """
  end

  def only_visible_for_device() do
    """
    alias Moon.UIPattern.Visibility.VisibleTabletAndDesktop
    alias Moon.UIPattern.Visibility.VisibleMobile

    <VisibleMobile>
      Visible on Mobile, but in HTML for desktop also (inspect HTML)
    </VisibleMobile>
    <VisibleTabletAndDesktop>
      Visible on Tablet and Desktop, but in HTML for mobile also (inspect HTML)
    </VisibleTabletAndDesktop>
    """
  end
end
