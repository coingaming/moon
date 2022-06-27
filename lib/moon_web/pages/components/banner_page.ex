defmodule MoonWeb.Pages.Components.BannerPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Banner
  alias Moon.Components.Button

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
          <ExampleAndCode id="banner_1">
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

            <:code>{banner_1_code()}</:code>
          </ExampleAndCode>
        </Context>
      </TopToDown>

    </Page>
    """
  end

  def banner_1_code do
    """
    """
  end
end
