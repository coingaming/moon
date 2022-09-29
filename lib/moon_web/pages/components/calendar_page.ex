defmodule MoonWeb.Pages.Components.CalendarPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Calendar
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/calendar",
        name: "Calendar"
      }
    ]

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "moon-design-light",
        active_page: __MODULE__,
        events: generate_events()
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Calendar</Heading>

        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=26127%3A3454">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/calendar_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/toolkit/calendar">React implementation</Link>
        </p>

        <ExampleAndCode layout="column" id="calendar_1">
          <:example>
            <Calendar id="default_calendar" week_starts_on={1} events={@events} />
          </:example>

          <:code>{calendar_1_code()}</:code>

          <:state>@events = {inspect(@events, pretty: true)}</:state>
        </ExampleAndCode>

        <ExampleAndCode title="Custom weekstart" layout="column" id="calendar_2">
          <:example>
            <Calendar id="sunday_calendar" week_starts_on={7} events={@events} />
          </:example>

          <:code>{calendar_2_code()}</:code>

          <:state>@events = {inspect(@events, pretty: true)}</:state>
          <:note>
            Use <code class="bg-goku-40">week_starts_on</code> prop. The weekstart can between 1..7, where 1 means Monday. Default value is 1.
          </:note>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def generate_events do
    [
      %{
        id: Ecto.UUID.generate(),
        started_at: shifted_time(-240),
        ended_at: shifted_time(-238),
        description: "Syncronite Splitz™",
        location: "Yggdrasil"
      },
      %{
        id: Ecto.UUID.generate(),
        started_at: shifted_time(46),
        ended_at: shifted_time(48),
        description: "Miner Donkey Trouble",
        location: "Play'n Go"
      },
      %{
        id: Ecto.UUID.generate(),
        started_at: shifted_time(3),
        ended_at: shifted_time(5),
        description: "Bayern Munich vs Augsburg",
        location: "Allianz Arena, Munich, Germany"
      },
      %{
        id: Ecto.UUID.generate(),
        started_at: shifted_time(1),
        ended_at: shifted_time(3),
        description: "Aston Villa vs Chelsea",
        location: "Villa Park, Aston, England"
      },
      %{
        id: Ecto.UUID.generate(),
        started_at: shifted_time(24),
        ended_at: shifted_time(28),
        description: "Formula 1 Monaco GP 2021",
        location: "Monaco"
      }
    ]
  end

  def shifted_time(hours) do
    Timex.now()
    |> Timex.to_naive_datetime()
    |> NaiveDateTime.truncate(:second)
    |> Timex.shift(hours: hours)
  end

  def calendar_1_code do
    """
      alias Moon.Components.Calendar

      <Calendar
        id="default_calendar"
        week_starts_on={ 1 }
        events={ @events }
      />
    """
  end

  def calendar_2_code do
    """
      alias Moon.Components.Calendar

      <Calendar
        id="sunday_calendar"
        week_starts_on={ 7 }
        events={ @events }
      />
    """
  end
end
