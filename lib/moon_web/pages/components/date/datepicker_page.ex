defmodule MoonWeb.Pages.Components.Date.DatepickerPage do
  @moduledoc false

  use MoonWeb, :live_view
  import Ecto.Changeset, only: [fetch_field: 2, put_change: 3]

  alias Moon.Components.Datepicker
  alias Moon.Components.Form
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/date/datepicker",
        name: "Datepicker"
      }
    ]

  defmodule Contract do
    @moduledoc false

    use Ecto.Schema
    import Ecto.Changeset

    schema "contracts" do
      field(:started_at, :date)
      field(:ended_at, :date)

      field(:datetime_started_at, :naive_datetime)
      field(:datetime_ended_at, :naive_datetime)
    end

    def changeset(contract, attrs \\ %{}) do
      contract
      |> cast(attrs, [:started_at, :ended_at, :datetime_started_at, :datetime_ended_at])
    end
  end

  def mount(params, _session, socket) do
    data = %Contract{started_at: Timex.today()}

    socket =
      assign(socket,
        theme_name: params["theme_name"] || "moon-design-light",
        active_page: __MODULE__,
        changeset: Contract.changeset(data),
        time_changeset: Contract.changeset(%Contract{}),
        range_changeset: Contract.changeset(%Contract{}),
        weekstart_changeset:
          Contract.changeset(%Contract{
            started_at: Timex.today() |> Timex.beginning_of_week(),
            ended_at: Timex.today() |> Timex.end_of_week()
          })
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <ComponentPageDescription title="Datepicker">
        <p>
          Datepicker
        </p>
        <p>
          <code>Datepicker</code> component has to be placed inside the <code>Form</code> component.
        </p>
        <p>
          Use <code>with_time</code> (list) prop. Default value is false.
        </p>
        <p>
          Use <code>ranges</code> (list) prop. Possible values are <code>lastMonth, lastWeek, yesterday, last24hours, today, tomorrow, thisWeek, nextWeek, thisMonth, nextMonth</code>.
        </p>
        <p>
          Use <code>week_starts_on</code> prop. The weekstart can between 1..7, where 1 means Monday. Default value is 1.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="datepicker_1">
        <:example>
          <Form for={@changeset} change="validate">
            <Datepicker
              id="default_datepicker"
              start_date={fetch_field(@changeset, :started_at) |> elem(1)}
              end_date={fetch_field(@changeset, :ended_at) |> elem(1)}
              start_date_field={:started_at}
              end_date_field={:ended_at}
              show_date_inputs
            />
          </Form>
        </:example>

        <:code>{datepicker_1_code()}</:code>
        <:state>@data = {inspect(fetch_data(@changeset), pretty: true)}<br><br>@changeset = {inspect(@changeset, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="With time" id="datepicker_2">
        <:example>
          <Form for={@time_changeset} change="time_validate">
            <Datepicker
              id="time_datepicker"
              start_date={fetch_field(@time_changeset, :datetime_started_at) |> elem(1)}
              end_date={fetch_field(@time_changeset, :datetime_ended_at) |> elem(1)}
              start_date_field={:datetime_started_at}
              end_date_field={:datetime_ended_at}
              show_date_inputs
              with_time
            />
          </Form>
        </:example>

        <:code>{datepicker_2_code()}</:code>
        <:state>@data = {inspect(fetch_time_data(@time_changeset), pretty: true)}<br><br>@changeset = {inspect(@time_changeset, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Custom ranges" id="datepicker_3">
        <:example>
          <Form for={@range_changeset} change="range_validate">
            <Datepicker
              id="range_datepicker"
              start_date={fetch_field(@range_changeset, :started_at) |> elem(1)}
              end_date={fetch_field(@range_changeset, :ended_at) |> elem(1)}
              start_date_field={:started_at}
              end_date_field={:ended_at}
              show_date_inputs={false}
              ranges={["lastWeek", "today", "thisWeek", "nextWeek"]}
            />
          </Form>
        </:example>

        <:code>{datepicker_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Custom weekstart" id="datepicker_4">
        <:example>
          <Form for={@weekstart_changeset} change="weekstart_validate">
            <Datepicker
              id="weekstart_datepicker"
              start_date={fetch_field(@weekstart_changeset, :started_at) |> elem(1)}
              end_date={fetch_field(@weekstart_changeset, :ended_at) |> elem(1)}
              start_date_field={:started_at}
              end_date_field={:ended_at}
              week_starts_on={7}
              show_date_inputs={false}
              ranges={["lastWeek", "today", "thisWeek", "nextWeek"]}
            />
          </Form>
        </:example>

        <:code>{datepicker_4_code()}</:code>
      </ExampleAndCode>
    </Page>
    """
  end

  def fetch_data(changeset) do
    {_, started_at} = fetch_field(changeset, :started_at)
    {_, ended_at} = fetch_field(changeset, :ended_at)

    %{started_at: started_at, ended_at: ended_at}
  end

  def fetch_time_data(changeset) do
    {_, started_at} = fetch_field(changeset, :datetime_started_at)
    {_, ended_at} = fetch_field(changeset, :datetime_ended_at)

    %{datetime_started_at: started_at, datetime_ended_at: ended_at}
  end

  def update_changeset(start_date, end_date) do
    Contract.changeset(%Contract{}, %{
      "started_at" => start_date,
      "ended_at" => end_date
    })
  end

  def update_time_changeset(start_date, end_date) do
    Contract.changeset(%Contract{}, %{
      "datetime_started_at" => start_date,
      "datetime_ended_at" => end_date
    })
  end

  # Handle date selection
  def handle_info(
        {:filter, {"default_datepicker", :apply, %{started_at: start_date, ended_at: end_date}}},
        socket
      ) do
    changeset = update_changeset(start_date, end_date)
    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_info(
        {:filter,
         {"time_datepicker", :apply,
          %{datetime_started_at: start_date, datetime_ended_at: end_date}}},
        socket
      ) do
    changeset = update_time_changeset(start_date, end_date)
    {:noreply, assign(socket, time_changeset: changeset)}
  end

  def handle_info(
        {:filter, {"range_datepicker", :apply, %{started_at: start_date, ended_at: end_date}}},
        socket
      ) do
    changeset = update_changeset(start_date, end_date)
    {:noreply, assign(socket, range_changeset: changeset)}
  end

  def handle_info(
        {:filter,
         {"weekstart_datepicker", :apply, %{started_at: start_date, ended_at: end_date}}},
        socket
      ) do
    changeset = update_changeset(start_date, end_date)
    {:noreply, assign(socket, weekstart_changeset: changeset)}
  end

  # Form validation
  def handle_event("validate", %{"contract" => params}, socket) do
    {start_date, end_date} = Datepicker.validate(params["started_at"], params["ended_at"])
    changeset = update_changeset(start_date, end_date)
    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("time_validate", %{"contract" => params}, socket) do
    {start_date, end_date} =
      Datepicker.validate(params["datetime_started_at"], params["datetime_ended_at"])

    changeset = update_time_changeset(start_date, end_date)
    {:noreply, assign(socket, time_changeset: changeset)}
  end

  def handle_event("range_validate", %{"contract" => params}, socket) do
    {start_date, end_date} = Datepicker.validate(params["started_at"], params["ended_at"])
    changeset = update_changeset(start_date, end_date)
    {:noreply, assign(socket, range_changeset: changeset)}
  end

  def handle_event("weekstart_validate", %{"contract" => params}, socket) do
    {start_date, end_date} = Datepicker.validate(params["started_at"], params["ended_at"])
    changeset = update_changeset(start_date, end_date)
    {:noreply, assign(socket, weekstart_changeset: changeset)}
  end

  def datepicker_1_code do
    """
      <Form for={ @changeset } change="validate">
        <Datepicker
          id="default_datepicker"
          start_date={fetch_field(@changeset, :started_at) |> elem(1)}
          end_date={fetch_field(@changeset, :ended_at) |> elem(1)}
          start_date_field={ :started_at }}
          end_date_field={ :ended_at }}
          show_date_inputs={true}
        />
      </Form>

      # Handle date selection
      def handle_info({:filter, {"default_datepicker", :apply, %{started_at: start_date, ended_at: end_date}}}, socket) do
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
    """
  end

  def datepicker_2_code do
    """
      <Form for={ @changeset } change="validate">
        <Datepicker
          id="time_datepicker"
          start_date={ fetch_field(@changeset, :datetime_started_at) |> elem(1) }
          end_date={ fetch_field(@changeset, :datetime_ended_at) |> elem(1) }
          start_date_field={ :datetime_started_at }
          end_date_field={ :datetime_ended_at }
          show_date_inputs={true}
          with_time={ true }
        />
      </Form>
    """
  end

  def datepicker_3_code do
    """
      <Form for={ @changeset } change="validate">
        <Datepicker
          id="range_datepicker"
          start_date={ fetch_field(@changeset, :started_at) |> elem(1) }
          end_date={ fetch_field(@changeset, :ended_at) |> elem(1) }
          start_date_field={ :started_at }
          end_date_field={ :ended_at }
          show_date_inputs={false}
          ranges={["lastWeek", "today", "thisWeek", "nextWeek"]}
        />
      </Form>
    """
  end

  def datepicker_4_code do
    """
      <Form for={ @changeset } change="validate">
        <Datepicker
          id="weekstart_datepicker"
          start_date={ fetch_field(@changeset, :started_at) |> elem(1) }
          end_date={ fetch_field(@changeset, :ended_at) |> elem(1) }
          start_date_field={ :started_at }
          end_date_field={ :ended_at }
          week_starts_on={ 7 }
          show_date_inputs={false}
          ranges={["lastWeek", "today", "thisWeek", "nextWeek"]}
        />
      </Form>
    """
  end
end
