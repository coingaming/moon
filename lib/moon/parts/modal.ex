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
  @doc "Size of the modal"
  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "xl")
  @doc "Whether the Modal is open or not"
  prop(is_open, :boolean)

  @doc "Close button slot"
  slot(close_button)
  @doc "Default slot for modal content"
  slot(default)

  def render(assigns) do
    ~F"""
    <Modal {=@id} {=@testid} {=@on_close} {=@is_open}>
      <Modal.Backdrop />
      <Modal.Panel class={merge([
        [
          "flex flex-col p-8 w-auto h-auto rounded-[1.25rem] bg-goku relative",
          get_modal_size_classes(@size)
        ],
        @class
      ])}>
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

  def get_modal_size_classes(size) do
    case size do
      "xs" -> "pb-4 pe-4 min-h-fit max-w-[28rem] max-h-[13.25rem] overflow-auto"
      "sm" -> "min-h-fit max-w-[35rem] max-h-[28rem] overflow-auto"
      "md" -> "min-h-fit max-w-[45.5rem] max-h-[34.25rem] overflow-auto"
      "lg" -> "min-h-fit max-w-[45.5rem] max-h-[39.75rem] overflow-auto"
      "xl" -> "min-h-[20rem] max-w-[68.5rem] max-h-[43.5rem] overflow-auto"
    end
  end
end
