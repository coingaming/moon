defmodule MoonWeb.Pages.Components.DatepickerPage do
  use MoonWeb, :live_view
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
        data: format_data(data),
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
              model={{ @data }}
              start_date_field={{ :started_at }}
              end_date_field={{ :ended_at }}
              ranges={{ ["lastMonth", "lastWeek", "last24hours", "yesterday", "today", "tomorrow", "thisWeek", "nextWeek", "thisMonth", "nextMonth"] }}
            />
          </Form>
        </template>

        <template slot="code">
      <#CodePreview>
        <Datepicker />
      </#CodePreview>
        </template>

        <template slot="state">@data = {{ inspect(@data, pretty: true) }}<br><br>@changeset = {{ inspect(@changeset, pretty: true) }}</template>
      </ExampleAndCode>
    </Stack>
    """
  end

  def handle_event("validate", %{"contract" => params}, socket) do
    changeset = Contract.changeset(%Contract{}, params)

    data =
      changeset
      |> Ecto.Changeset.apply_changes()
      |> format_data()

    {:noreply, assign(socket, changeset: changeset, data: data)}
  end

  defp format_data(data) do
    data
    |> Map.from_struct()
    |> Map.delete(:__meta__)
    |> Map.delete(:id)
  end
end
