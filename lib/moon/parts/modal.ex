defmodule Moon.Parts.Modal do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Modal

  alias Moon.Parts.IconButton

  @doc "id attribute for Modal"
  prop(id, :string, required: true)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Title of the modal"
  prop(title, :string)
  @doc "On close button is pressed event. Is used if no close_button slot is given"
  prop(on_close, :event)

  @doc "Close button slot"
  slot(close_button)

  slot(default)

  def render(assigns) do
    ~F"""
    <Modal {=@id} {=@testid} {=@on_close}>
      <Modal.Backdrop />
      <Modal.Panel class={
        "flex flex-col max-w-[68.5rem] min-h-[20rem] p-8 w-auto rounded-[1.25rem] bg-goku relative",
        @class
      }>
        <h3 :if={@title} class="text-moon-24 text-bulma font-grotesk w-full">{@title}</h3>
        <#slot {@close_button}>
          <IconButton.White
            :if={@on_close}
            class="absolute end-2 top-2 z-10"
            icon="controls_close_small"
            on_click={@on_close}
          />
        </#slot>
        <#slot />
      </Modal.Panel>
    </Modal>
    """
  end

  defdelegate open(id), to: Modal
  defdelegate close(id), to: Modal
end
