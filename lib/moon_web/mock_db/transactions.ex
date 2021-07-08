defmodule MoonWeb.MockDB.Transactions do
  use GenServer

  alias MoonWeb.MockDB.{ Users, Sites, Currencies }
  alias MoonWeb.MockDB.Utils

  @process_name :mock_transactions
  @statuses ["COMPLETE", "CANCELLED", "PENDING"]

  # client
  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def list(%{
    filter: %{ user: _, site: _, currency: _ },
    pagination: %{ offset: _, limit: _ }
  } = args) do
    this_process() |> GenServer.call({:list, args})
  end

  def list_all(), do: this_process() |> GenServer.call(:list_all)

  # server
  def init(_args) do
    users = Users.list_all()

    {:ok, %{
      all: users
        |> Enum.flat_map(fn user ->
          0..Faker.random_between(0, 100)
          |> Enum.map(fn _ ->
            %{
              id: Utils.random_id(),
              user: user,
              site: Sites.random().name,
              currency: Currencies.random().name,
              amount: Faker.random_between(0, 100000),
              status: Utils.get_random_item(@statuses),
              created_at: Faker.DateTime.backward(120)
            }
          end)
        end)
    }}
  end

  def handle_call(:list_all, _from, state) do
    {:reply, state.all, state}
  end

  def handle_call({:list, args}, _from, state) do
    %{
      filter: %{ user: user_filter, site: sites, currency: currencies },
      pagination: %{ offset: offset, limit: limit }
    } = args

    users = Users.list(%{filter: user_filter})
    results = state.all
      |> Enum.filter(&(Enum.member?(users, &1.user)))
      |> Enum.filter(fn txn ->
        (length(sites) == 0 or Enum.member?(sites, txn.site)) and
        (length(currencies) == 0 or Enum.member?(sites, txn.currency))
      end)
      |> Utils.take_page(offset, limit)

    {:reply, results, state}
  end

  # helpers
  defp this_process() do
    Process.whereis(@process_name)
  end
end
