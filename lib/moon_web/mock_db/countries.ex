defmodule MoonWeb.MockDB.Countries do
  use GenServer

  @process_name :mock_countries

  # client
  def start_link do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def list_all do
    this_process() |> GenServer.call(:list_all)
  end

  # server
  def init(_args) do
    {:ok,
     %{
       all: [
         %{name: "Estonia"},
         %{name: "France"},
         %{name: "Germany"},
         %{name: "Ukraine"},
         %{name: "United Kingdom"},
         %{name: "Italy"},
         %{name: "Span"},
         %{name: "Poland"},
         %{name: "Romania"},
         %{name: "Greece"},
         %{name: "Austria"},
         %{name: "Serbia"},
         %{name: "Bulgaria"},
         %{name: "Finland"}
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
