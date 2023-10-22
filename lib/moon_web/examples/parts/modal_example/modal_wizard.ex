defmodule MoonWeb.Examples.Parts.ModalExample.ModalWizard do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.ModalWizard
  alias Moon.Design.Button
  alias Moon.Design.Modal

  prop(menu_items, :list, default: MoonWeb.Schema.Link.menu())

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Open modal wizard</Button>
      <ModalWizard id="modal_wizard">
        <ModalWizard.Title>Create new flow</ModalWizard.Title>
        <ModalWizard.Description>In order to make you available and match you with the right opportunities we need some additional information first.</ModalWizard.Description>
        <ModalWizard.CloseButton on_click="set_close" />
        <ModalWizard.CancelButton on_click="cancel">Cancel</ModalWizard.CancelButton>
        <ModalWizard.PrevButton on_click="prev_page">Back</ModalWizard.PrevButton>
        <ModalWizard.NextButton on_click="next_page">Next</ModalWizard.NextButton>
      </ModalWizard>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Modal.open("modal_wizard")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    Modal.close("modal_wizard")
    {:noreply, socket}
  end

  def handle_event("next_page", %{"selected" => selected, "completed" => completed}, socket) do
    tab_count = 3

    selected =
      if String.to_integer(selected) >= tab_count,
        do: String.to_integer(selected),
        else: String.to_integer(selected) + 1

    completed =
      if String.to_integer(completed) >= tab_count,
        do: String.to_integer(completed),
        else: String.to_integer(completed) + 1

    {:noreply, assign(socket, completed: completed, selected: selected)}
  end

  def handle_event("prev_page", %{"selected" => selected}, socket) do
    selected = String.to_integer(selected) - 1
    {:noreply, assign(socket, selected: selected)}
  end

  def code() do
    """
    """
  end
end
