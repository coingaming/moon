defmodule MoonWeb.MockDB.Affiliates do
  @moduledoc false

  use GenServer

  alias MoonWeb.MockDB.Users
  alias MoonWeb.MockDB.Utils

  @process_name :mock_affliates
  @tags ["SOCIAL MEDIA", "MEDIA BUY", "FACEBOOK", "TWITTER", "MARKETING"]

  # client
  def start_link do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def list(
        args = %{
          filter: %{user: _},
          pagination: %{offset: _, limit: _},
          sort: _
        }
      ) do
    this_process() |> GenServer.call({:list, args})
  end

  def list_all do
    this_process() |> GenServer.call(:list_all)
  end

  # server
  def init(_args) do
    users = Users.list_all()

    {:ok,
     %{
       all:
         users
         |> Enum.map(fn user ->
           %{
             id: Utils.random_id(),
             user: user,
             tags: random_tags(),
             signup_at: Faker.DateTime.backward(120)
           }
         end)
     }}
  end

  def handle_call(:list_all, _from, state) do
    {:reply, state.all, state}
  end

  def handle_call({:list, args}, _from, state) do
    %{
      filter: %{user: user_filter},
      pagination: %{offset: offset, limit: limit},
      sort: sort
    } = args

    users =
      Users.list(%{
        filter: user_filter |> Map.put(:site, []),
        sort: %{
          id: sort |> Map.get(:userId),
          username: sort |> Map.get(:username)
        }
      })

    results =
      state.all
      |> Enum.filter(&Enum.member?(users, &1.user))
      |> Utils.take_page(offset, limit)

    {:reply, results, state}
  end

  # helpers
  defp this_process do
    Process.whereis(@process_name)
  end

  defp random_tags do
    0..Faker.random_between(0, length(@tags) - 1)
    |> Enum.map(&Enum.fetch!(@tags, &1))
  end
end
