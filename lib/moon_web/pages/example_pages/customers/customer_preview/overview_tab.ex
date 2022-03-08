defmodule MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.OverviewTab.Row do
  @moduledoc false

  use MoonWeb, :stateless_component

  slot col1, required: true
  slot col2, required: true

  def render(assigns) do
    ~F"""
    <div class="flex my-5">
      <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
        <#slot name="col1" />
      </div>
      <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
        <#slot name="col2" />
      </div>
    </div>
    """
  end
end

defmodule MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.OverviewTab do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Assets.Icons.{
    IconAbout,
    IconCalendarEmpty,
    IconData,
    IconGeneralInfo,
    IconGlobe,
    IconLightbulb,
    IconMail,
    IconPencil,
    IconSbShield,
    IconSettings,
    IconText,
    IconUser,
    IconWalletRounded
  }

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.{Accordion, Button, Divider, Text}
  alias MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.OverviewTab.Row

  data show_account_details, :boolean, default: true
  data show_security, :boolean, default: true
  data show_wallets, :boolean, default: true
  data wallets_active_tab, :string, default: "BTC · 156.45"

  prop customer, :map, required: true

  def render(assigns) do
    ~F"""
    <div>
      <Accordion id="account-details">
        <:title>Account Details</:title>
        <:content>
          <Row>
            <:col1><IconUser font_size="1rem" class="mr-2" />Name</:col1>
            <:col2>{"#{@customer.name} (#{@customer.username})"}</:col2>
          </Row>

          <Row>
            <:col1><IconUser font_size="1rem" class="mr-2" />Usr Scr ID</:col1>
            <:col2>{@customer.id}</:col2>
          </Row>

          <Row>
            <:col1><IconText font_size="1rem" class="mr-2" />Registration</:col1>
            <:col2>3 months ago<IconAbout font_size="1rem" class="ml-1" /></:col2>
          </Row>

          <Row>
            <:col1><IconGlobe font_size="1rem" class="mr-2" />Reg. country</:col1>
            <:col2>{@customer.country}<IconAbout font_size="1rem" class="ml-1" /></:col2>
          </Row>

          <Row>
            <:col1><IconCalendarEmpty font_size="1rem" class="mr-2" />Birthday</:col1>
            <:col2>{@customer.signup_at |> Timex.format!("%b %d, %Y", :strftime)}</:col2>
          </Row>

          <Row>
            <:col1><IconMail font_size="1rem" class="mr-2" />Email</:col1>
            <:col2>{@customer.email}<IconAbout font_size="1rem" class="ml-1" /></:col2>
          </Row>

          <Row>
            <:col1><IconGeneralInfo font_size="1rem" class="mr-2" />KYC</:col1>
            <:col2>PENDING<IconAbout font_size="1rem" class="ml-1" /></:col2>
          </Row>

          <Row>
            <:col1><IconUser font_size="1rem" class="mr-2" />Account Type</:col1>
            <:col2>Player</:col2>
          </Row>

          <Row>
            <:col1><IconSettings font_size="1rem" class="mr-2" />Preffered Language</:col1>
            <:col2>English</:col2>
          </Row>

          <Row>
            <:col1><IconSettings font_size="1rem" class="mr-2" />Preffered Currency</:col1>
            <:col2>
              EUR</:col2>
          </Row>

          <Row>
            <:col1><IconLightbulb font_size="1rem" class="mr-2" />Source</:col1>
            <:col2>
              -</:col2>
          </Row>

          <Row>
            <:col1><IconData font_size="1rem" class="mr-2" />Value90</:col1>
            <:col2>
              HV90</:col2>
          </Row>
        </:content>
      </Accordion>

      <Divider class="mb-2" />

      <Accordion id="security">
        <:title>Security</:title>
        <:content>
          <Row>
            <:col1><IconSbShield font_size="1rem" class="mr-2" />Chat Visits (last 30 days)</:col1>
            <:col2>
              23</:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem" class="mr-2" />Password changed in 48h</:col1>
            <:col2>3h<IconAbout font_size="1rem" class="ml-1" /></:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem" class="mr-2" />Login Status</:col1>
            <:col2>Login closed<IconPencil font_size="1rem" class="ml-1" /></:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem" class="mr-2" />Active sessions</:col1>
            <:col2>3 &nbsp;&nbsp;</:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem" class="mr-2" />First deposite made in 48h</:col1>
            <:col2>22h<IconAbout font_size="1rem" class="ml-1" /></:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem" class="mr-2" />Cashier</:col1>
            <:col2>Non-Depositor<IconAbout font_size="1rem" class="ml-1" /></:col2>
          </Row>
        </:content>
      </Accordion>

      <Divider class="mb-2" />

      <Accordion id="wallets">
        <:title>Wallets · 3</:title>
        <:content>
          <LeftToRight class="mt-2 mb-6">
            {#for tab <- ["BTC · 156,45", "ETH · 600.23", "EUR · 1220.45"]}
              <Button
                :if={tab == @wallets_active_tab}
                on_click={"select_wallets_tab:#{tab}"}
                size="xsmall"
                class="rounded bg-goku-100 py-2"
              >
                <Text size="14" class="capitalize text-gohan-80">{tab}</Text>
              </Button>

              <Button
                :if={tab != @wallets_active_tab}
                on_click={"select_wallets_tab:#{tab}"}
                variant="danger"
                size="xsmall"
                class="rounded py-2"
              >
                <Text size="14" class="capitalize text-hit-80">{tab}</Text>
              </Button>
            {/for}
          </LeftToRight>

          <Row>
            <:col1><IconWalletRounded font_size="1rem" class="mr-2" />Real Money Wallet</:col1>
            <:col2>{get_money(@wallets_active_tab)}</:col2>
          </Row>

          <Row>
            <:col1><IconWalletRounded font_size="1rem" class="mr-2" />Locked Wallet</:col1>
            <:col2>0</:col2>
          </Row>

          <Row>
            <:col1><IconWalletRounded font_size="1rem" class="mr-2" />Reward Wallet</:col1>
            <:col2>0</:col2>
          </Row>

          <Row>
            <:col1><IconWalletRounded font_size="1rem" class="mr-2" />Capped Wallet</:col1>
            <:col2>0</:col2>
          </Row>
        </:content>
      </Accordion>
    </div>
    """
  end

  def handle_event(event, _, socket) do
    case String.split(event, ":") do
      ["select_wallets_tab", tab] ->
        {:noreply, socket |> assign(wallets_active_tab: tab)}

      _ ->
        {:noreply, socket}
    end
  end

  def get_money(tab) do
    case String.split(tab, " · ") do
      [_, money] -> money
      _ -> "0"
    end
  end
end
