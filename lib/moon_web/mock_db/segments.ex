defmodule MoonWeb.MockDB.Segments do
  @moduledoc false

  use GenServer

  @process_name :mock_segments

  alias MoonWeb.MockDB.Utils

  # client
  def start_link do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def save(
        segment = %{
          name: _,
          type: _,
          params: _
        }
      ) do
    this_process() |> GenServer.call({:save, segment})
  end

  def get_by_id(id) do
    this_process() |> GenServer.call({:get_by_id, id})
  end

  def list_all do
    this_process() |> GenServer.call(:list_all)
  end

  def get_by_type(type) do
    this_process() |> GenServer.call({:get_by_type, type})
  end

  # server
  def init(_args) do
    {:ok, %{all: []}}
  end

  def handle_call(:list_all, _from, state) do
    {:reply, state.all, state}
  end

  def handle_call({:save, segment}, _from, state) do
    segment = segment |> Map.put(:id, Utils.random_id())
    {:reply, segment, %{all: [segment | state.all]}}
  end

  def handle_call({:get_by_id, id}, _form, state) do
    case state.all |> Enum.filter(&(&1.id == id)) do
      [x | _] -> {:reply, x, state}
      _ -> {:reply, nil, state}
    end
  end

  def handle_call({:get_by_type, type}, _form, state) do
    {:reply, state.all |> Enum.filter(&(&1.type == type)), state}
  end

  # helpers
  defp this_process do
    Process.whereis(@process_name)
  end
end
