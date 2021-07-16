defmodule MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.OverviewTab.Row do
  use MoonWeb, :stateless_component

  slot col1, required: true
  slot col2, required: true

  def render(assigns) do
    ~F"""
    <div class="flex my-5">
      <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
        <#slot name="col1"/>
      </div>
      <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
        <#slot name="col2"/>
      </div>
    </div>
    """
  end
end

defmodule MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.OverviewTab do
  use MoonWeb, :stateful_component

  alias Moon.Components.{Accordion, Divider, Button, Text}
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Assets.Icons.{
    IconUser, IconText, IconGlobe, IconMail, IconGeneralInfo,
    IconWalletRounded, IconPencil, IconAbout, IconSbShield,
    IconData, IconSettings, IconLightbulb, IconCalendarEmpty
  }
  alias MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.OverviewTab.Row

  data show_account_details, :boolean, default: true
  data show_security, :boolean, default: true
  data show_wallets, :boolean, default: true
  data wallets_active_tab, :string, default: "BTC · 156,45"

  prop customer, :map, required: true

  def render(assigns) do
    ~F"""
    <div>
      <Accordion>
        <Accordion.Item title="Account Details" click="toggle_account_details" is_open={@show_account_details}>
          <Row>
            <:col1><IconUser font_size="1rem"/> &nbsp;&nbsp;Name</:col1>
            <:col2>{@customer.name} &nbsp;&nbsp;({@customer.username})</:col2>
          </Row>

          <Row>
            <:col1><IconUser font_size="1rem"/> &nbsp;&nbsp;Usr Scr ID</:col1>
            <:col2>{"#{@customer.id}"}</:col2>
          </Row>

          <Row>
            <:col1><IconText font_size="1rem"/> &nbsp;&nbsp;Registration</:col1>
            <:col2>3 months ago &nbsp;&nbsp; <IconAbout font_size="1rem"/></:col2>
          </Row>

          <Row>
            <:col1><IconGlobe font_size="1rem"/> &nbsp;&nbsp;Reg. country</:col1>
            <:col2>{@customer.country} &nbsp;&nbsp; <IconAbout font_size="1rem"/></:col2>
          </Row>

          <Row>
            <:col1><IconCalendarEmpty font_size="1rem"/> &nbsp;&nbsp;Birthday</:col1>
            <:col2>{@customer.signup_at |> Timex.format!("%b %d, %Y", :strftime)}</:col2>
          </Row>

          <Row>
            <:col1><IconMail font_size="1rem"/> &nbsp;&nbsp;Email</:col1>
            <:col2>{@customer.email} &nbsp;&nbsp; <IconAbout font_size="1rem"/></:col2>
          </Row>

          <Row>
            <:col1><IconGeneralInfo font_size="1rem"/> &nbsp;&nbsp;KYC</:col1>
            <:col2>PENDING &nbsp;&nbsp; <IconAbout font_size="1rem"/></:col2>
          </Row>

          <Row>
            <:col1><IconUser font_size="1rem"/> &nbsp;&nbsp;Account Type</:col1>
            <:col2>Player</:col2>
          </Row>

          <Row>
            <:col1><IconSettings font_size="1rem"/> &nbsp;&nbsp;Preffered Language</:col1>
            <:col2>English</:col2>
          </Row>

          <Row>
            <:col1><IconSettings font_size="1rem"/> &nbsp;&nbsp;Preffered Currency</:col1>
            <:col2>  EUR</:col2>
          </Row>

          <Row>
            <:col1><IconLightbulb font_size="1rem"/> &nbsp;&nbsp;Source</:col1>
            <:col2>    -</:col2>
          </Row>

          <Row>
            <:col1><IconData font_size="1rem"/> &nbsp;&nbsp;Value90</:col1>
            <:col2> HV90</:col2>
          </Row>
        </Accordion.Item>

        <Divider class="mb-2"/>

        <Accordion.Item title="Security" click="toggle_security" is_open={@show_security}>
          <Row>
            <:col1><IconSbShield font_size="1rem"/> &nbsp;&nbsp;Chat Visits (last 30 days)</:col1>
            <:col2>   23</:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem"/> &nbsp;&nbsp;Password changed in 48h</:col1>
            <:col2>3h &nbsp;&nbsp; <IconAbout font_size="1rem"/></:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem"/> &nbsp;&nbsp;Login Status</:col1>
            <:col2>Login closed &nbsp;&nbsp; <IconPencil font_size="1rem"/></:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem"/> &nbsp;&nbsp;Active sessions</:col1>
            <:col2>3 &nbsp;&nbsp;</:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem"/> &nbsp;&nbsp;First deposite made in 48h</:col1>
            <:col2>22h &nbsp;&nbsp; <IconAbout font_size="1rem"/></:col2>
          </Row>

          <Row>
            <:col1><IconSbShield font_size="1rem"/> &nbsp;&nbsp;Cashier</:col1>
            <:col2>Non-Depositor &nbsp;&nbsp; <IconAbout font_size="1rem"/></:col2>
          </Row>
        </Accordion.Item>

        <Divider class="mb-2"/>

        <Accordion.Item title="Wallets · 3" click="toggle_wallets" is_open={@show_wallets}>
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
            <:col1><IconWalletRounded font_size="1rem"/> &nbsp;&nbsp;Real Money Wallet</:col1>
            <:col2>{get_money(@wallets_active_tab)}</:col2>
          </Row>

          <Row>
            <:col1><IconWalletRounded font_size="1rem"/> &nbsp;&nbsp;Locked Wallet</:col1>
            <:col2>0</:col2>
          </Row>

          <Row>
            <:col1><IconWalletRounded font_size="1rem"/> &nbsp;&nbsp;Reward Wallet</:col1>
            <:col2>0</:col2>
          </Row>

          <Row>
            <:col1><IconWalletRounded font_size="1rem"/> &nbsp;&nbsp;Capped Wallet</:col1>
            <:col2>0</:col2>
          </Row>
        </Accordion.Item>
      </Accordion>
    </div>
    """
  end

  def handle_event("toggle_account_details", _, socket) do
    %{ show_account_details: show } = socket.assigns

    {:noreply, socket |> assign(show_account_details: !show)}
  end

  def handle_event("toggle_security", _, socket) do
    %{ show_security: show } = socket.assigns

    {:noreply, socket |> assign(show_security: !show)}
  end

  def handle_event("toggle_wallets", _, socket) do
    %{ show_wallets: show } = socket.assigns

    {:noreply, socket |> assign(show_wallets: !show)}
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
      _          -> "0"
    end
  end
end
