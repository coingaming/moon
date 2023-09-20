defmodule MoonWeb.Examples.Design.ModalExample.ExampleWithSelect do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Icons.ControlsCloseSmall
  alias Moon.Design.Modal
  alias Moon.Design.Button
  alias MoonWeb.Schema.User
  alias Moon.Design.Form
  alias Moon.Design.Form.Select

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
      <Button on_click="set_open" testid="open-modal">Open dialog</Button>
      <Modal id="with_select_modal">
        <Modal.Backdrop />
        <Modal.Panel>
          <div class="border-b-[0.063rem] border-beerus pt-5 pb-4 px-6 relative">
            <h3 class="text-moon-18 text-bulma font-medium">Modal title</h3>
            <span class="absolute top-5 right-5 cursor-pointer">
              <ControlsCloseSmall class="text-moon-24" click="set_close" />
            </span>
          </div>

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
            <Button variant="outline" on_click="set_close" testid="close-modal">Cancel</Button>
            <Button on_click="set_close">Create</Button>
          </div>
        </Modal.Panel>
      </Modal>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Modal.open("with_select_modal")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    Modal.close("with_select_modal")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Icons.ControlsCloseSmall
    alias Moon.Design.Modal
    alias Moon.Design.Button
    alias MoonWeb.Schema.User
    alias Moon.Design.Form
    alias Moon.Design.Form.Select

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
      ~F\"""
      <div>
        <Button on_click="set_open">Open dialog</Button>
        <Modal id="with_select_modal">
          <Modal.Backdrop />
          <Modal.Panel>
            <div class="border-b-[0.063rem] border-beerus pt-5 pb-4 px-6 relative">
              <h3 class="text-moon-18 text-bulma font-medium">Modal title</h3>
              <span class="absolute top-5 right-5 cursor-pointer" >
                <ControlsCloseSmall class="text-moon-24" click="set_close"/>
              </span>
            </div>

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
              <Button variant="outline" on_click="set_close">Cancel</Button>
              <Button on_click="set_close">Create</Button>
            </div>
          </Modal.Panel>
        </Modal>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      Modal.open("with_select_modal")
      {:noreply, socket}
    end

    def handle_event("set_close", _, socket) do
      Modal.close("with_select_modal")
      {:noreply, socket}
    end
    """
  end
end
