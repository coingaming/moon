defmodule MoonWeb.Pages.Design.ModalPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Select

  alias Moon.Design.Button
  alias Moon.Design.Modal

  alias Moon.Autolayouts.PullAside

  import MoonWeb.Helpers.Lorem

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/modal",
        name: "Modal"
      }
    ]
  )

  data(modal_props, :list,
    default: [
      %{
        :name => 'backdrop',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Backdrop of Modal element, see Modal.Backdrop'
      },
      %{
        :name => 'panel',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Content of Modal element, see Modal.Panel'
      },
      %{
        :name => 'is_open',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Whether the Modal is open or not.'
      },
      %{
        :name => 'on_close',
        :type => 'event',
        :required => 'No',
        :default => '-',
        :description => 'Handler for open/close of the element'
      }
    ]
  )

  data(modal_panel_props, :list,
    default: [
      %{
        :name => 'header',
        :type => 'slot',
        :required => 'No',
        :default => '-',
        :description => 'Header of Modal element, see Modal.Header'
      },
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'Yes',
        :default => '-',
        :description => 'Tailwind classes for customization of Panel.'
      }
    ]
  )

  data(modal_panel_header_props, :list,
    default: [
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'Yes',
        :default => '-',
        :description => 'Tailwind classes for customization of Panel.'
      },
      %{
        :name => 'has_divider',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Whether the Modal header has divider.'
      },
      %{
        :name => 'has_close',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Whether the Modal header has "close" icon.'
      }
    ]
  )

  data(modal_backdrop_props, :list,
    default: [
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'Yes',
        :default => '-',
        :description => 'Tailwind classes for customization of Backdrop.'
      }
    ]
  )

  data(modal_1_is_open, :boolean, default: false)
  data(modal_2_is_open, :boolean, default: false)
  data(modal_3_is_open, :boolean, default: false)
  data(modal_4_is_open, :boolean, default: false)

  def mount(_params, _session, socket) do
    size_options = [
      [key: "Small", value: "small"],
      [key: "Medium", value: "medium"],
      [key: "Large", value: "large"]
    ]

    color_options = [
      [key: "Red", value: "red"],
      [key: "Blue", value: "blue"],
      [key: "Green", value: "green"]
    ]

    material_options = [
      [key: "Leather", value: "leather"],
      [key: "Wool", value: "wool"],
      [key: "Cotton", value: "cotton"],
      [key: "Silk", value: "silk"]
    ]

    {:ok,
     assign(socket,
       size_options: size_options,
       color_options: color_options,
       material_options: material_options
     )}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress is_rtl_support title="Modal">
        <p>
          A modal is an interface element that appears over other content. It requires an interaction from the user before they can return to whatever is underneath.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="default_modal">
        <:example>
          <Button on_click="open_modal_1">Open dialog</Button>
          <Modal is_open={@modal_1_is_open}>
            <Modal.Backdrop />
            <Modal.Panel>
              <Modal.Header has_divider>Payment successful</Modal.Header>
              <div class="p-4">
                <p class="text-moon-16 text-trunks">
                  {lorem_payment()}
                </p>
              </div>
              <div class="p-4 border-t-2 border-beerus">
                <PullAside>
                  <:left>
                    <Button on_click="close_modal_1">Got it, thanks!</Button>
                  </:left>
                </PullAside>
              </div>
            </Modal.Panel>
          </Modal>
        </:example>
        <:code>{get_example_code_1()}</:code>
        <:state>{get_state_1(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Example with big content" id="big_content">
        <:example>
          <Button on_click="open_modal_2">Open dialog</Button>
          <Modal is_open={@modal_2_is_open}>
            <Modal.Backdrop />
            <Modal.Panel>
              <Modal.Header has_divider>Payment successful</Modal.Header>
              <div class="p-4">
                <p class="text-moon-16 text-trunks">
                  {lorem_big_content()}
                </p>
              </div>
              <div class="p-4 border-t-2 border-beerus">
                <PullAside>
                  <:left>
                    <Button on_click="close_modal_2">Got it, thanks!</Button>
                  </:left>
                </PullAside>
              </div>
            </Modal.Panel>
          </Modal>
        </:example>
        <:code>{get_example_code_2()}</:code>
        <:state>{get_state_2(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Example with styled content" id="styled_content">
        <:example>
          <Button on_click="open_modal_3">Open dialog</Button>
          <Modal is_open={@modal_3_is_open} on_close="close_modal_3">
            <Modal.Backdrop />
            <Modal.Panel class="lg:max-w-md bg-roshi text-goten">
              <Modal.Header has_close class="text-moon-24" />
              <div class="p-4">
                <div class="mt-2">
                  <h3 class="text-moon-24 text-goten font-semibold text-center">
                    Your payment has been successfully submitted.
                  </h3>
                </div>
              </div>
              <div class="p-4 flex items-center justify-center">
                <Button variant="secondary" on_click="close_modal_3">Got it, thanks!</Button>
              </div>
            </Modal.Panel>
          </Modal>
        </:example>
        <:code>{get_example_code_3()}</:code>
        <:state>{get_state_3(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Example with select" id="with_select">
        <:example>
          <Button on_click="open_modal_4">Open dialog</Button>
          <Modal is_open={@modal_4_is_open} on_close="close_modal_4">
            <Modal.Backdrop />
            <Modal.Panel>
              <Modal.Header has_divider has_close>Modal title</Modal.Header>
              <div class="px-6 py-4 flex flex-col gap-3">
                <Select label="Size" class="w-full" options={@size_options} prompt="Please select size" />
                <Select label="Color" class="w-full" options={@color_options} prompt="Please select color" />
                <Select
                  label="Material"
                  class="w-full"
                  options={@material_options}
                  prompt="Please select material"
                />
              </div>
              <div class="flex gap-2 p-4 justify-end pt-2">
                <Button variant="secondary" on_click="close_modal_4">Cancel</Button>
                <Button on_click="close_modal_4">Create</Button>
              </div>
            </Modal.Panel>
          </Modal>
        </:example>
        <:code>{get_example_code_4()}</:code>
        <:state>{get_state_4(assigns)}</:state>
      </ExampleAndCode>

      <PropsTable title="Modal props" data={@modal_props} />
      <PropsTable title="Modal.Panel" data={@modal_panel_props} />
      <PropsTable title="Modal.Header" data={@modal_panel_header_props} />
      <PropsTable title="Modal.Backdrop" data={@modal_backdrop_props} />
    </Page>
    """
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event("open_modal_1", _params, socket) do
    socket = assign(socket, modal_1_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal_1", _params, socket) do
    socket = assign(socket, modal_1_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_modal_2", _params, socket) do
    socket = assign(socket, modal_2_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal_2", _params, socket) do
    socket = assign(socket, modal_2_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_modal_3", _params, socket) do
    socket = assign(socket, modal_3_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal_3", _params, socket) do
    socket = assign(socket, modal_3_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_modal_4", _params, socket) do
    socket = assign(socket, modal_4_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal_4", _params, socket) do
    socket = assign(socket, modal_4_is_open: false)
    {:noreply, socket}
  end

  def get_example_code_1() do
    """
    <Button on_click="open_modal_1">Open dialog</Button>
    <Modal is_open={@modal_1_is_open}>
      <Modal.Backdrop />
      <Modal.Panel>
        <Modal.Header has_divider>Payment successful</Modal.Header>
        <div class="p-4">
          <p class="text-moon-16 text-trunks">
            {lorem_payment()}
          </p>
        </div>
        <div class="p-4 border-t-2 border-beerus">
          <PullAside>
            <:left>
              <Button on_click="close_modal_1">Got it, thanks!</Button>
            </:left>
          </PullAside>
        </div>
      </Modal.Panel>
    </Modal>
    """
  end

  def get_example_code_2() do
    """
    <Button on_click="open_modal_2">Open dialog</Button>
    <Modal is_open={@modal_2_is_open}>
      <Modal.Backdrop />
      <Modal.Panel>
        <Modal.Header has_divider>Payment successful</Modal.Header>
        <div class="p-4">
          <p class="text-moon-16 text-trunks">
            {lorem_big_content()}
          </p>
        </div>
        <div class="p-4 border-t-2 border-beerus">
          <PullAside>
            <:left>
              <Button on_click="close_modal_2">Got it, thanks!</Button>
            </:left>
          </PullAside>
        </div>
      </Modal.Panel>
    </Modal>
    """
  end

  def get_example_code_3() do
    """
    <Button on_click="open_modal_3">Open dialog</Button>
    <Modal is_open={@modal_3_is_open} on_close="close_modal_3">
      <Modal.Backdrop />
      <Modal.Panel class="lg:max-w-md bg-roshi text-goten">
        <Modal.Header has_close class="text-moon-24" />
        <div class="p-4">
          <div class="mt-2">
            <h3 class="text-moon-24 text-goten font-semibold text-center">
              Your payment has been successfully submitted.
            </h3>
          </div>
        </div>
        <div class="p-4 flex items-center justify-center">
          <Button variant="secondary" on_click="close_modal_3">Got it, thanks!</Button>
        </div>
      </Modal.Panel>
    </Modal>
    """
  end

  def get_example_code_4() do
    """
    <Button on_click="open_modal_4">Open dialog</Button>
    <Modal is_open={@modal_4_is_open} on_close="close_modal_4">
      <Modal.Backdrop />
      <Modal.Panel>
        <Modal.Header has_divider has_close>Modal title</Modal.Header>
        <div class="px-6 py-4 flex flex-col gap-3">
          <Select label="Size" class="w-full" options={@size_options} prompt="Please select size" />
          <Select label="Color" class="w-full" options={@color_options} prompt="Please select color" />
          <Select
            label="Material"
            class="w-full"
            options={@material_options}
            prompt="Please select material"
          />
        </div>
        <div class="flex gap-2 p-4 justify-end pt-2">
          <Button variant="secondary" on_click="close_modal_4">Cancel</Button>
          <Button on_click="close_modal_4">Create</Button>
        </div>
      </Modal.Panel>
    </Modal>
    """
  end

  def get_state_1(assigns) do
    inspect(%{modal_1_is_open: assigns.modal_1_is_open})
  end

  def get_state_2(assigns) do
    inspect(%{modal_2_is_open: assigns.modal_2_is_open})
  end

  def get_state_3(assigns) do
    inspect(%{modal_3_is_open: assigns.modal_3_is_open})
  end

  def get_state_4(assigns) do
    inspect(%{modal_4_is_open: assigns.modal_4_is_open})
  end
end
