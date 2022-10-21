defmodule MoonWeb.Pages.Components.BannerPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Banner
  alias Moon.Components.Button
  alias Moon.Icons.ControlsClose
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.ComponentPageDescription

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/banner",
        name: "Banner"
      }
    ]

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Banner">
        <p>
          Banners are used to show users important, succinct messages, or space alerts, that users should know about. They can interact or ignore banners at any time, as they are non-modal. What to take note of when using banners Only one banner should be shown at a time. Banners require user action in order to be dismissed. Messages should consist of no longer than one headline, one description sentence and one short call-to-action.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode id="banner_1" title="Default">
        <:example>
          <Banner title="Title here" description="Lorem ipsum dolor..." />
        </:example>

        <:code>{banner_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode id="banner_2" title="Buttons">
        <:example>
          <Banner title="Title here" description="Lorem ipsum dolor...">
            <:buttons_slot>
              <Button variant="secondary">Discard</Button>
              <Button>Confirm</Button>
            </:buttons_slot>
          </Banner>
        </:example>

        <:code>{banner_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode id="banner_3" title="Header Icon">
        <:example>
          <Banner title="Title here" description="Lorem ipsum dolor...">
            <:icon_header_slot>
              <ControlsClose />
            </:icon_header_slot>
          </Banner>
        </:example>

        <:code>{banner_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode id="banner_4" title="Mobile">
        <:example>
          <Banner title="Title here" description="Lorem ipsum dolor..." is_mobile>
            <:buttons_slot>
              <Button variant="secondary">Discard</Button>
              <Button>Confirm</Button>
            </:buttons_slot>
          </Banner>
        </:example>

        <:code>{banner_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode id="banner_5" title="Single Line">
        <:example>
          <Banner
            description="Your email is not verified. Verify to enable withdrawals."
            is_multiline={false}
          >
            <:link_slot>
              <Button variant="ghost">Resend verification link to email ›</Button>
            </:link_slot>
          </Banner>
        </:example>

        <:code>{banner_5_code()}</:code>
      </ExampleAndCode>
    </Page>
    """
  end

  def banner_1_code do
    """
    <Banner title="Title here" description="Lorem ipsum dolor..." />
    """
  end

  def banner_2_code do
    """
    <Banner title="Title here" description="Lorem ipsum dolor..." >
      <:buttons_slot>
        <Button variant="secondary">Discard</Button>
        <Button>Confirm</Button>
      </:buttons_slot>
    </Banner>
    """
  end

  def banner_3_code do
    """
    <Banner title="Title here" description="Lorem ipsum dolor..." >
      <:icon_header_slot>
        <ControlsClose />
      </:icon_header_slot>
    </Banner>
    """
  end

  def banner_4_code do
    """
    <Banner title="Title here" description="Lorem ipsum dolor..." is_mobile={true}>
      <:buttons_slot>
        <Button variant="secondary">Discard</Button>
        <Button>Confirm</Button>
      </:buttons_slot>
    </Banner>
    """
  end

  def banner_5_code do
    """
    <Banner
      description="Your email is not verified. Verify to enable withdrawals."
      is_multiline={false}
    >
      <:link_slot>
        <Button variant="ghost">Resend verification link to email ›</Button>
      </:link_slot>
    </Banner>
    """
  end
end
