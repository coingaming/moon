defmodule Moon.Design.Snackbar.Trigger do
  @moduledoc false

  use Moon.StatelessComponent, slot: "trigger"

  # slot(default, required: true)

  # def render(assigns) do
  #   ~F"""
  #   <div
  #     role="button"
  #     :on-click={JS.dispatch("moon:show-snackbar", detail: %{snackbar_id: "#{@id}", position: "#{@position}"})}
  #   >
  #     <#slot {@default} />
  #   </div>
  #   """
  # end
end
