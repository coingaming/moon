defmodule MoonWeb.Pages.Components.CalendarPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Calendar
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Stack

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        events: []
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=32>Calendar</Heading>

      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=26127%3A3454">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/calendar_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/toolkit/calendar">React implementation</Link>
      </p>

      <ExampleAndCode show_state={{ true }} layout="column">
        <template slot="example">
          <Calendar
            id="default_calendar"
            week_starts_on={{ 1 }}
          />
        </template>

        <template slot="code">
      <#CodePreview>
        <Calendar
          id="default_calendar"
          week_starts_on={{ 1 }}
        />
      </#CodePreview>
        </template>

        <template slot="state">@events = {{ inspect(@events, pretty: true) }}</template>
      </ExampleAndCode>

      <Heading size=24 class="mt-4" is_regular>Custom weekstart</Heading>

      <p>
        Use <code class="bg-goku-40">week_starts_on</code> prop. The weekstart can between 1..7, where 1 means Monday. Default value is 1.
      </p>

      <ExampleAndCode show_state={{ true }} layout="column">
        <template slot="example">
          <Calendar
            id="sunday_calendar"
            week_starts_on={{ 7 }}
          />
        </template>

        <template slot="code">
      <#CodePreview>
        <Calendar
          id="sunday_calendar"
          week_starts_on={{ 7 }}
        />
      </#CodePreview>
        </template>

        <template slot="state">@events = {{ inspect(@events, pretty: true) }}</template>
      </ExampleAndCode>
    </Stack>
    """
  end
end
