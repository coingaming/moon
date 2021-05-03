defmodule MoonWeb.Pages.Components.DatepickerPage do
  use MoonWeb, :live_view
  import Ecto.Changeset, only: [fetch_field: 2, put_change: 3]
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Datepicker
  alias Moon.Components.Form
  alias Moon.Components.Heading
  alias Moon.Components.Stack
  alias Moon.Components.Link

  defmodule Contract do
    use Ecto.Schema
    import Ecto.Changeset

    schema "contracts" do
      field(:started_at, :naive_datetime)
      field(:ended_at, :naive_datetime)
    end

    def changeset(contract, attrs \\ %{}) do
      contract
      |> cast(attrs, [:started_at, :ended_at])
    end
  end

  def mount(params, _session, socket) do
    data = %Contract{started_at: Timex.today() |> Timex.to_naive_datetime()}

    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        changeset: Contract.changeset(data)
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=32>Datepicker</Heading>

      <p>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/datepicker.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/datepicker">React implementation</Link>
      </p>

      <ExampleAndCode show_state={{ true }}>
        <template slot="example">
          <Form for={{ @changeset }} change="validate">
            <Datepicker
              id="default_datepicker"
              start_date={{ fetch_field(@changeset, :started_at) |> elem(1) }}
              end_date={{ fetch_field(@changeset, :ended_at) |> elem(1) }}
              start_date_field={{ :started_at }}
              end_date_field={{ :ended_at }}
              on_date_change="update_dates"
              ranges={{ ["lastMonth", "lastWeek", "last24hours", "yesterday", "today", "tomorrow", "thisWeek", "nextWeek", "thisMonth", "nextMonth"] }}
            />
          </Form>
        </template>

        <template slot="code">
      <#CodePreview>
        <Datepicker />
      </#CodePreview>
        </template>

        <template slot="state">@data = {{ inspect(fetch_data(@changeset), pretty: true) }}<br><br>@changeset = {{ inspect(@changeset, pretty: true) }}</template>
      </ExampleAndCode>
    </Stack>
    """
  end

  defp fetch_data(changeset) do
    {_, started_at} = fetch_field(changeset, :started_at)
    {_, ended_at} = fetch_field(changeset, :ended_at)

    %{started_at: started_at, ended_at: ended_at}
  end

  def handle_info({"update_dates", %{started_at: start_date, ended_at: end_date}}, socket) do
    changeset =
      socket.assigns.changeset
      |> put_change(:started_at, start_date)
      |> put_change(:ended_at, end_date)

    {:noreply, assign(socket, changeset: changeset)}
  end

  # Form validation
  def handle_event("validate", %{"contract" => params}, socket) do
    {start_date, end_date} = Datepicker.validate(params["started_at"], params["ended_at"])

    params =
      params
      |> Map.put("started_at", start_date)
      |> Map.put("ended_at", end_date)

    changeset = Contract.changeset(%Contract{}, params)
    {:noreply, assign(socket, changeset: changeset)}
  end
end
