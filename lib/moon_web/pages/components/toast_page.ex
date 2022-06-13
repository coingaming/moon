defmodule MoonWeb.Pages.Components.ToastPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Toast
  alias Moon.Components.Toast.Message
  alias Moon.Components.ToastStack
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/toast",
        name: "Toast"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'type',
        :type =>
          'date | datetime-local" | email | number | password | search | tel | text | url | time | url',
        :required => 'false',
        :default => 'text',
        :description => 'Different types of input'
      },
      %{
        :name => 'size',
        :type => 'medium | large | xlarge',
        :required => '-',
        :default => 'medium',
        :description =>
          'TODO - Size variant (currently only medium | large, with large as default)'
      },
      %{
        :name => 'label',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'TODO - Should be required for medium size only'
      },
      %{
        :name => 'placeholder',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Placeholder for input'
      },
      %{
        :name => 'field',
        :type => 'atom',
        :required => 'true',
        :default => '-',
        :description => 'Field value for underlying phoenix text input component'
      },
      %{
        :name => 'hint_text',
        :type => 'slot',
        :required => 'false',
        :default => '-',
        :description => 'Informative or error message under input'
      },
      %{
        :name => 'error',
        :type => 'boolean',
        :required => 'false',
        :default => '-',
        :description => 'Set error state for input'
      },
      %{
        :name => 'show_password_text',
        :type => '-',
        :required => '-',
        :default => '-',
        :description =>
          'TODO - Only for input type password. Text for toggle button: show/hide password'
      },
      %{
        :name => 'background_color',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Background color'
      }
    ]

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "moon-design-light",
        active_page: __MODULE__
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Toast</Heading>

        <p>
          Short, time-based messages that slide in and out of a page.
        </p>

        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=15488%3A332">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/toast.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/toolkit/toast">React implementation</Link>
        </p>

        <ToastStack id="toasts" />

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode title="Default" id="toast_1">
            <:example>
              <Toast id="minimal" message="Hey! Your toast is ready." />
            </:example>

            <:code>{toast_1_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Appearing and disappearing" id="toast_2">
            <:note>
              Toasts can be shown on top of the page and automatically disappear after a timeout.

              You should use <code class="bg-goku-40">ToastStack</code> component for it.
            </:note>
            <:example>
              <Button variant="primary" on_click="show_one_toast" class="block mb-4" size="small">Show one toast</Button>

              <Button variant="primary" on_click="show_two_toasts" class="block" size="small">Show two toasts</Button>
            </:example>

            <:code>{toast_2_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Variant" id="toast_3">
            <:note>
              Use <code class="bg-goku-40">variant</code> prop.
            </:note>
            <:example>
              <div class="flex flex-col items-start">
                <Toast
                  :for={toast <- variant_toasts()}
                  id={toast.id}
                  message={toast.message}
                  variant={toast.variant}
                />
              </div>

              <Button variant="primary" on_click="show_variant_toasts" class="block mt-2" size="small">Show all</Button>
            </:example>

            <:code>{toast_3_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Actions" id="toast_4">
            <:note>
              Use <code class="bg-goku-40">closeable</code> prop. Default value is true.
              To display link use <code class="bg-goku-40">link_text</code> and <code class="bg-goku-40">link_href</code> props.
            </:note>
            <:example>
              <div class="flex flex-col items-start">
                <Toast
                  :for={toast <- action_toasts()}
                  id={toast.id}
                  message={toast.message}
                  variant={toast.variant}
                  link_text={toast.link_text}
                  link_href={toast.link_href}
                  closeable={toast.closeable}
                />
              </div>

              <Button variant="primary" on_click="show_action_toasts" class="block mt-2" size="small">Show all</Button>
            </:example>

            <:code>{toast_4_code()}</:code>
          </ExampleAndCode>
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-moon-20 font-normal my-4">Props</div>
          <Table items={@props_info_array}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type" :let={item: item}>
              {item.type}
            </Column>
            <Column name="required" label="Required" :let={item: item}>
              {item.required}
            </Column>
            <Column name="default" label="Default" :let={item: item}>
              {item.default}
            </Column>
            <Column name="description" label="Description" :let={item: item}>
              {item.description}
            </Column>
          </Table>
        </div>
      </TopToDown>
    </Page>
    """
  end

  def handle_event("show_one_toast", _, socket) do
    ToastStack.show(
      %Message{
        message: "Hey! Your toast is ready.",
        variant: "success"
      },
      "toasts"
    )

    {:noreply, socket}
  end

  def handle_event("show_two_toasts", _, socket) do
    ToastStack.show(
      [
        %Message{
          message: "Hey! Another toast is ready.",
          variant: "success"
        },
        %Message{
          message: "And this is third one",
          variant: "success"
        }
      ],
      "toasts"
    )

    {:noreply, socket}
  end

  def handle_event("show_variant_toasts", _, socket) do
    ToastStack.show(variant_toasts(), "toasts")

    {:noreply, socket}
  end

  def handle_event("show_action_toasts", _, socket) do
    ToastStack.show(action_toasts(), "toasts")

    {:noreply, socket}
  end

  def handle_info({:hide_toast, toast_id}, socket) do
    ToastStack.hide_toast(toast_id, "toasts")
    {:noreply, socket}
  end

  def variant_toasts do
    [
      %Message{id: "error_toast", message: "Error!", variant: "error"},
      %Message{id: "warning_toast", message: "Warning.", variant: "warning"},
      %Message{id: "info_toast", message: "Info.", variant: "info"},
      %Message{id: "success_toast", message: "Success!", variant: "success"},
      %Message{id: "no_icon_toast", message: "Default."}
    ]
  end

  def action_toasts do
    [
      %Message{
        id: "closeable_toast",
        message: "You can close this toast.",
        variant: "success",
        closeable: true
      },
      %Message{
        id: "not_closeable_toast",
        message: "You cannot close this toast.",
        variant: "warning",
        closeable: false
      },
      %Message{
        id: "link_toast",
        message: "Allow this app to access your location?",
        variant: "info",
        link_href: "#",
        link_text: "Allow"
      },
      %Message{
        id: "simple_link_toast",
        message: "This toast has only text and a link.",
        link_href: "#",
        link_text: "Why?",
        closeable: false
      }
    ]
  end

  def toast_1_code do
    """
      <Toast id="minimal" message="Hey! Your toast is ready." />
    """
  end

  def toast_2_code do
    """
      alias Moon.Components.ToastStack
      alias Moon.Components.Toast.Message

      <ToastStack id="toasts" />

      <Button on_click="show_one_toast">
        Show one toast
      </Button>

      <Button on_click="show_two_toasts">
        Show two toasts
      </Button>

      def handle_event("show_one_toast", _, socket) do
        ToastStack.show(
          %Message{
            message: "Hey! Your toast is ready.",
            variant: "success"
          },
          "toasts"
        )

        {:noreply, socket}
      end

      def handle_event("show_two_toasts", _, socket) do
        ToastStack.show(
          [
            %Message{
              message: "Hey! Another toast is ready.",
              variant: "success"
            },
            %Message{
              message: "And this is third one",
              variant: "success"
            }
          ],
          "toasts"
        )

        {:noreply, socket}
      end

      def handle_info({:hide_toast, toast_id}, socket) do
        ToastStack.hide_toast(toast_id, "toasts")
        {:noreply, socket}
      end
    """
  end

  def toast_3_code do
    """
      <Toast
        id="error_toast"
        message="Error!"
        variant="error"
      />
      <Toast
        id="warning_toast"
        message="Warning."
        variant="warning"
      />
      <Toast
        id="info_toast"
        message="Info."
        variant="info"
      />
      <Toast
        id="success_toast"
        message="Success!"
        variant="success"
      />
      <Toast
        id="default_toast"
        message="Default."
      />
    """
  end

  def toast_4_code do
    """
      <Toast
        id="closeable_toast"
        message="You can close this toast."
        variant="success"
        closeable={ true }
      />

      <Toast
        id="not_closeable_toast"
        message="You cannot close this toast."
        variant="warning"
        closeable={ false }
      />

      <Toast
        id="link_toast"
        message="Allow this app to access your location?"
        variant="info"
        link_href="#"
        link_text="Allow"
      />

      <Toast
        id="simple_link_toast"
        message="This toast has only text and a link."
        link_href="#"
        link_text="Why?"
        closeable={ false }
      />
    """
  end
end
