defmodule MoonWeb.MockDB.Affiliates do
  use GenServer

  alias MoonWeb.MockDB.Users
  alias MoonWeb.MockDB.Utils

  @process_name :mock_affliates
  @tags ["SOCIAL MEDIA", "MEDIA BUY", "FACEBOOK", "TWITTER", "MARKETING"]

  # client
  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @process_name)
  end

  def list(%{
    filter: %{ user: _ }
  } = args) do
    this_process()
    |> Genserver.call({:list, args})
  end

  def list_all() do
    this_process()
    |> GenServer.call(:list_all)
  end

  # server
  def init(_args) do
    users = Users.list_all()
    {:ok, %{
      all: users
        |> Enum.flat_map(fn user ->
          Utils.random_sites()
          |> Enum.map(fn site ->
            %{
              id: Utils.random_id(),
              user: user,
              site: site,
              tags: random_tags(),
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
    %{filter: %{user: user_filter}} = args

    users = Users.list(%{filter: user_filter})
    results = state.all |> Enum.filter(&(Enum.member?(users, &1.user)))

    {:reply, results, state}
  end

  # helpers
  defp this_process() do
    Process.whereis(@process_name)
  end

  defp random_tags() do
    0..Faker.random_between(0, length(@tags) - 1)
    |> Enum.map(&(Enum.fetch!(@tags, &1)))
  end
end
