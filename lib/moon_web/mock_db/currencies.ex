defmodule MoonWeb.MockDB.Currencies do
  use GenServer

  alias MoonWeb.MockDB.Utils

  @process_name :mock_currencies

  # client
  def start_link do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def list_all, do: this_process() |> GenServer.call(:list_all)

  def random do
    list_all() |> Utils.get_random_item()
  end

  # server
  def init(_args) do
    {:ok,
     %{
       all: [
         %{name: "EUR"},
         %{name: "BTC"},
         %{name: "ETC"},
         %{name: "USD"},
         %{name: "UAH"},
         %{name: "JPY"}
       ]
     }}
  end

  def handle_call(:list_all, _from, state) do
    {:reply, state.all, state}
  end

  # helpers
  defp this_process do
    Process.whereis(@process_name)
  end
end
