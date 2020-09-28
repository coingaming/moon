defmodule MoonWeb do
  def shared_live_behaviour do
    quote do
    end
  end

  def live_view do
    quote do
      use Moon.LiveView
      use MoonWeb, :shared_live_behaviour
    end
  end

  def live_stateful_component do
    quote do
      use Moon.StatefulComponent
      use MoonWeb, :shared_live_behaviour
    end
  end

  def live_stateless_component do
    quote do
      use Moon.StatelessComponent
      use MoonWeb, :shared_live_behaviour
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
