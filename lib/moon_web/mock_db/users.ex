defmodule MoonWeb.MockDB.Users do
  use GenServer

  alias MoonWeb.MockDB.{Countries, Sites}
  alias MoonWeb.MockDB.Utils

  @process_name :mock_users

  # client
  def start_link do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def list(
        args = %{
          filter: %{id: _, country: _, site: _},
          sort: _
        }
      ) do
    this_process() |> GenServer.call({:list, args})
  end

  def list_all, do: this_process() |> GenServer.call(:list_all)

  def search_by_usernames(""), do: []

  def search_by_usernames(search_text) do
    this_process()
    |> GenServer.call({:search_usernames, search_text})
  end

  # server
  def init(_args) do
    countries = Countries.list_all()

    {:ok,
     %{
       all:
         0..1000
         |> Enum.flat_map(fn _ ->
           Sites.random_list()
           |> Enum.map(fn site ->
             %{
               id: Utils.random_id(),
               name: Faker.Person.name(),
               email: Faker.Internet.email(),
               country: Faker.Util.pick(countries).name,
               username: Faker.Internet.user_name(),
               site: site.name,
               signup_at: Faker.DateTime.backward(120)
             }
           end)
         end)
     }}
  end

  def handle_call(:list_all, _from, state) do
    {:reply, state.all, state}
  end

  def handle_call({:list, args}, _from, state) do
    %{filter: %{id: id, country: country, site: site}, sort: sort} = args

    results =
      state.all
      |> Enum.sort(fn a, b ->
        case sort do
          %{id: :asc} -> a.id < b.id
          %{id: :desc} -> a.id >= b.id
          %{username: :asc} -> a.username < b.username
          %{username: :desc} -> a.username >= b.username
          _ -> true
        end
      end)
      |> Enum.filter(fn user ->
        (Enum.empty?(id) or Enum.member?(id, user.id)) and
          (Enum.empty?(site) or Enum.member?(site, user.site)) and
          (Enum.empty?(country) or Enum.member?(country, user.country))
      end)

    {:reply, results, state}
  end

  def handle_call({:search_usernames, search_text}, _from, state) do
    results =
      state.all
      |> Enum.filter(&String.contains?(&1.username, search_text))

    {:reply, results, state}
  end

  # helpers
  defp this_process do
    Process.whereis(@process_name)
  end
end
