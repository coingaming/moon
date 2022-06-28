defmodule MoonWeb.Pages.Components.BannerPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Banner
  alias Moon.Components.Button
  alias Moon.Icons.ControlsClose

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

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={32}>Banner</Heading>
        <Context put={theme_class: @theme_name}>
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
        </Context>
      </TopToDown>
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
