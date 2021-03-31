defmodule Moon.Components.FileInput do
  use Moon.StatelessComponent

  prop label, :string
  prop placeholder, :string
  prop conf, :any

  def render(assigns) do
    ~H"""
    {{ live_file_input @conf }}
    """
  end
end
