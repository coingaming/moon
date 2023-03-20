defmodule MoonWeb.Examples.Design.ModalExample.ExampleWithSelect do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Modal
  alias Moon.Design.Button
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Design.Form
  alias Moon.Design.Form.Select

  data(modal_is_open, :boolean, default: false)

  prop(size_options, :list,
    default: [
      [key: "Small", value: "small"],
      [key: "Medium", value: "medium"],
      [key: "Large", value: "large"]
    ]
  )

  prop(color_options, :list,
    default: [
      [key: "Red", value: "red"],
      [key: "Blue", value: "blue"],
      [key: "Green", value: "green"]
    ]
  )

  prop(material_options, :list,
    default: [
      [key: "Leather", value: "leather"],
      [key: "Wool", value: "wool"],
      [key: "Cotton", value: "cotton"],
      [key: "Silk", value: "silk"]
    ]
  )

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="open_modal">Open dialog</Button>
      <Modal is_open={@modal_is_open} on_close="close_modal">
        <Modal.Backdrop />
        <Modal.Panel>
          <Modal.Header has_divider has_close>Modal title</Modal.Header>
          <div class="px-6 py-4 flex flex-col gap-3">
            <Form for={@user_changeset}>
              <Select field={:size} options={@size_options} prompt="Please select size" class="w-full" />
            </Form>
            <Form for={@user_changeset}>
              <Select field={:color} options={@color_options} prompt="Please select color" class="w-full" />
            </Form>
            <Form for={@user_changeset}>
              <Select
                field={:material}
                options={@material_options}
                prompt="Please select material"
                class="w-full"
              />
            </Form>
          </div>
          <div class="flex gap-2 p-4 justify-end pt-2">
            <Button variant="secondary" on_click="close_modal">Cancel</Button>
            <Button on_click="close_modal">Create</Button>
          </div>
        </Modal.Panel>
      </Modal>
    </div>
    """
  end

  def handle_event("open_modal", _params, socket) do
    socket = assign(socket, modal_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal", _params, socket) do
    socket = assign(socket, modal_is_open: false)
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Modal
    alias Moon.Design.Button
    alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
    alias Moon.Design.Form
    alias Moon.Design.Form.Select

    data(modal_is_open, :boolean, default: false)

    prop(size_options, :list,
      default: [
        [key: "Small", value: "small"],
        [key: "Medium", value: "medium"],
        [key: "Large", value: "large"]
      ]
    )

    prop(color_options, :list,
      default: [
        [key: "Red", value: "red"],
        [key: "Blue", value: "blue"],
        [key: "Green", value: "green"]
      ]
    )

    prop(material_options, :list,
      default: [
        [key: "Leather", value: "leather"],
        [key: "Wool", value: "wool"],
        [key: "Cotton", value: "cotton"],
        [key: "Silk", value: "silk"]
      ]
    )

    prop(user_changeset, :any, default: User.changeset(%User{}))

    ...

    <div>
      <Button on_click="open_modal">Open dialog</Button>
      <Modal is_open={@modal_is_open} on_close="close_modal">
        <Modal.Backdrop />
        <Modal.Panel>
          <Modal.Header has_divider has_close>Modal title</Modal.Header>
          <div class="px-6 py-4 flex flex-col gap-3">
            <Form for={@user_changeset}>
              <Select field={:size} options={@size_options} prompt="Please select size" class="w-full" />
            </Form>
            <Form for={@user_changeset}>
              <Select field={:color} options={@color_options} prompt="Please select color" class="w-full" />
            </Form>
            <Form for={@user_changeset}>
              <Select
                field={:material}
                options={@material_options}
                prompt="Please select material"
                class="w-full"
              />
            </Form>
          </div>
          <div class="flex gap-2 p-4 justify-end pt-2">
            <Button variant="secondary" on_click="close_modal">Cancel</Button>
            <Button on_click="close_modal">Create</Button>
          </div>
        </Modal.Panel>
      </Modal>
    </div>

    ...

    def handle_event("open_modal", _params, socket) do
      socket = assign(socket, modal_is_open: true)
      {:noreply, socket}
    end

    def handle_event("close_modal", _params, socket) do
      socket = assign(socket, modal_is_open: false)
      {:noreply, socket}
    end
    """
  end
end
