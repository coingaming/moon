defmodule MoonWeb.MockDB.Countries do
  use GenServer

  @process_name :mock_countries

  # client
  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def list_all() do
    this_process()
    |> GenServer.call(:list_all)
  end

  def search_names(search_text) do
    this_process()
    |> GenServer.call({:search_names, search_text})
  end

  # server
  def init(_args) do
    {:ok, %{
      all: [
        %{name: "Estonia"},
        %{name: "France"},
        %{name: "Germany"},
        %{name: "Ukraine"},
        %{name: "United Kingdom"}
      ]
    }}
  end

  def handle_call(:list_all, _from, state) do
    {:reply, state.all, state}
  end

  def handle_call({:search_names, search_text}, _from, state) do
    results = state.all
      |> Enum.filter(&(String.contains?(&1.name, search_text)))
      |> Enum.map(&(&1.name))
    {:reply, results, state}
  end

  # helpers
  defp this_process() do
    Process.whereis(@process_name)
  end
end
