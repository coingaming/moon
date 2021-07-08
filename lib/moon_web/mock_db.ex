defmodule MoonWeb.MockDB do
  use Supervisor

  alias MoonWeb.MockDB.{Sites, Currencies, Countries, Users, Affiliates}

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_arg) do
    # mind the order
    children = [
      %{id: :sites, start: {Sites, :start_link, []}},
      %{id: :currencies, start: {Currencies, :start_link, []}},
      %{id: :countries, start: {Countries, :start_link, []}},
      %{id: :users, start: {Users, :start_link, []}},
      %{id: :affiliates, start: {Affiliates, :start_link, []}}
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
