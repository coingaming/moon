defmodule Moon.Design.Modal.Backdrop do
  @moduledoc false

  use Moon.StatelessComponent
  prop(close, :event)

  def render(assigns) do
    ~F"""
    <div :on-click={@close} class="fixed inset-0 bg-popo opacity-[.4]" />
    """
  end
end
