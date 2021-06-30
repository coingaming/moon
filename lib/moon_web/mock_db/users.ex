defmodule MoonWeb.MockDB.Users do
  use GenServer

  alias MoonWeb.MockDB.Countries
  alias MoonWeb.MockDB.Utils

  @process_name :mock_users

  # client
  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def list(args = %{
    filters: %{ id: _, country: _ },
  }) do
    this_process()
    |> GenServer.call({:list, args})
  end

  def list_all() do
    this_process()
    |> GenServer.call(:list_all)
  end

  def search_by_usernames(search_text) do
    this_process()
    |> GenServer.call({:search_usernames, search_text})
  end

  # server
  def init(_args) do
    countries = Countries.list_all()

    {:ok, %{
      all: 0..1000
        |> Enum.map(fn _ ->
          %{
            id: Utils.random_id(),
            name: Faker.Person.name(),
            email: Faker.Internet.email(),
            country: Faker.Util.pick(countries).name,
            username: Faker.Internet.user_name()
          }
        end)
    }}
  end

  def handle_call(:list_all, _from, state) do
    {:reply, state.all, state}
  end

  def handle_call({:list, args}, _from, state) do
    %{filters: %{id: id, country: country}} = args
    results = state.all
      |> Enum.filter(fn user ->
        (length(id) == 0 or Enum.member?(id, user.id)) or
        (length(country) == 0 or Enum.member?(country, user.country))
      end)

    {:reply, results, state}
  end

  def handle_call({:search_usernames, search_text}, _from, state) do
    results = state.all
      |> Enum.filter(&(String.contains?(&1.username, search_text)))
    {:reply, results, state}
  end

  # helpers
  defp this_process() do
    Process.whereis(@process_name)
  end
end
