defmodule Moon.Autolayouts.CenterOfScreen do
  @moduledoc false

  use Moon.StatelessComponent

  slot default
  prop class, :string

  def render(assigns) do
    ~F"""
    <div class={"grid grid-cols-1 place-content-center min-h-full min-h-[100vh]", @class}>
      <#slot />
    </div>
    """
  end
end
