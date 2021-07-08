defmodule MoonWeb.MockDB.Sites do
  use GenServer

  alias MoonWeb.MockDB.Utils

  @process_name :mock_sites

  # client
  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def list_all(), do: this_process() |> GenServer.call(:list_all)

  def random_list() do
    sites = list_all()

    0..Faker.random_between(0, length(sites) - 1)
      |> Enum.map(&(Enum.fetch!(sites, &1)))
  end

  def random() do
    list_all() |> Utils.get_random_item()
  end

  # server
  def init(_args) do
    {:ok, %{
      all: [
        %{name: "Bitcasino"},
        %{name: "Sportsbet"},
        %{name: "Slots"},
        %{name: "Aposta10"}
      ]
    }}
  end

  def handle_call(:list_all, _from, state) do
    {:reply, state.all, state}
  end

  def handle_call(:random, _from, state) do
    site =
      0..Faker.random_between(0, length(state.all) - 1)
      |> Enum.map(&(Enum.fetch!(state.all, &1)))

    {:reply, site, state}
  end

  # helpers
  defp this_process() do
    Process.whereis(@process_name)
  end
end
