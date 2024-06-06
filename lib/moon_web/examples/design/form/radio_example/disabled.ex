defmodule MoonWeb.Examples.Design.Form.RadioExample.Disabled do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Radio

  data(value, :string, default: "first")

  def render(assigns) do
    ~F"""
    <div>
      <Radio disabled {=@value} options={first: "First option", second: "Second option"} />
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Radio

    data(value, :string, default: "first")

    def render(assigns) do
      ~F\"""
      <Radio disabled {=@value} options={first: "First option", second: "Second option"} />
      \"""
    end
    """
  end
end
