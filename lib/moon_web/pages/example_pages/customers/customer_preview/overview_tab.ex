defmodule MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.OverviewTab do
  use MoonWeb, :stateful_component

  alias Moon.Components.{Accordion, Divider}

  alias Moon.Assets.Icons.{IconUser, IconText, IconGlobe, IconMail, IconGeneralInfo, IconPencil, IconAbout, IconSbShield, IconData, IconSettings, IconLightbulb, IconCalendarEmpty}

  data show_account_details, :boolean, default: true
  data show_security, :boolean, default: true

  prop customer, :map, required: true

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <div>
      <Accordion>
        <Accordion.Item title="Account Details" click="toggle_account_details" is_open={@show_account_details}>
          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconUser font_size="1rem"/> &nbsp;&nbsp;Name
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              {@customer.name}
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconUser font_size="1rem"/> &nbsp;&nbsp;Usr Scr ID
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              {"#{@customer.id}"}
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconText font_size="1rem"/> &nbsp;&nbsp;Registration
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              3 months ago &nbsp;&nbsp; <IconAbout font_size="1rem"/>
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconGlobe font_size="1rem"/> &nbsp;&nbsp;Reg. country
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              {@customer.country} &nbsp;&nbsp; <IconAbout font_size="1rem"/>
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconCalendarEmpty font_size="1rem"/> &nbsp;&nbsp;Birthday
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              {@customer.signup_at |> Timex.format!("%b %d, %Y", :strftime)}
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconMail font_size="1rem"/> &nbsp;&nbsp;Email
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              {@customer.email} &nbsp;&nbsp; <IconAbout font_size="1rem"/>
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconGeneralInfo font_size="1rem"/> &nbsp;&nbsp;KYC
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              PENDING &nbsp;&nbsp; <IconAbout font_size="1rem"/>
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconUser font_size="1rem"/> &nbsp;&nbsp;Account Type
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              Player
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconSettings font_size="1rem"/> &nbsp;&nbsp;Preffered Language
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              English
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconSettings font_size="1rem"/> &nbsp;&nbsp;Preffered Currency
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              EUR
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconLightbulb font_size="1rem"/> &nbsp;&nbsp;Source
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              -
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconData font_size="1rem"/> &nbsp;&nbsp;Value90
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              HV90
            </div>
          </div>
        </Accordion.Item>

        <Divider class="mb-2"/>

        <Accordion.Item title="Security" click="toggle_security" is_open={@show_security}>
          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconSbShield font_size="1rem"/> &nbsp;&nbsp;Chat Visits (last 30 days)
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              23
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconSbShield font_size="1rem"/> &nbsp;&nbsp;Password changed in 48h
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              3h &nbsp;&nbsp; <IconAbout font_size="1rem"/>
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconSbShield font_size="1rem"/> &nbsp;&nbsp;Login Status
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              Login closed &nbsp;&nbsp; <IconPencil font_size="1rem"/>
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconSbShield font_size="1rem"/> &nbsp;&nbsp;Active sessions
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              3 &nbsp;&nbsp;
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconSbShield font_size="1rem"/> &nbsp;&nbsp;First deposite made in 48h
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              22h &nbsp;&nbsp; <IconAbout font_size="1rem"/>
            </div>
          </div>

          <div class="flex my-5">
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              <IconSbShield font_size="1rem"/> &nbsp;&nbsp;Cashier
            </div>
            <div class="w-1/2 flex-none flex align-start items-center text-md text-gohan-40">
              Non-Depositor &nbsp;&nbsp; <IconAbout font_size="1rem"/>
            </div>
          </div>
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
end
