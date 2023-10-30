defmodule MoonWeb.Pages.Components.ToastPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Button
  alias Moon.Components.Toast
  alias Moon.Components.Toast.Message
  alias Moon.Components.ToastStack
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/toast",
        name: "Toast"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"type",
        :type =>
          ~c"date | datetime-local\" | email | number | password | search | tel | text | url | time | url",
        :required => ~c"No",
        :default => ~c"text",
        :description => ~c"Different types of input"
      },
      %{
        :name => ~c"size",
        :type => ~c"medium | large | xlarge",
        :required => ~c"-",
        :default => ~c"medium",
        :description =>
          ~c"TODO - Size variant (currently only medium | large, with large as default)"
      },
      %{
        :name => ~c"label",
        :type => ~c"string",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"TODO - Should be required for medium size only"
      },
      %{
        :name => ~c"placeholder",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Placeholder for input"
      },
      %{
        :name => ~c"field",
        :type => ~c"atom",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Field value for underlying phoenix text input component"
      },
      %{
        :name => ~c"hint_text",
        :type => ~c"slot",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Informative or error message under input"
      },
      %{
        :name => ~c"error",
        :type => ~c"boolean",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Set error state for input"
      },
      %{
        :name => ~c"show_password_text",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description =>
          ~c"TODO - Only for input type password. Text for toggle button: show/hide password"
      },
      %{
        :name => ~c"background_color",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Background color"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Toast">
        <p>
          Short, time-based messages that slide in and out of a page.
        </p>
        <p>
          Toasts can be shown on top of the page and automatically disappear after a timeout. You should use <code>ToastStack</code> component for it.
        </p>
      </ComponentPageDescription>

      <ToastStack id="toasts" />

      <ExampleAndCode title="Default" id="toast_1">
        <:example>
          <Toast id="minimal" message="Hey! Your toast is ready." />
        </:example>

        <:code>{toast_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Appearing and disappearing" id="toast_2">
        <:example>
          <Button variant="primary" on_click="show_one_toast" class="block mb-4" size="sm">Show one toast</Button>

          <Button variant="primary" on_click="show_two_toasts" class="block" size="sm">Show two toasts</Button>
        </:example>

        <:code>{toast_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Variant" id="toast_3">
        <:example>
          <Toast
            :for={toast <- variant_toasts()}
            id={toast.id}
            message={toast.message}
            variant={toast.variant}
          />

          <Button variant="primary" on_click="show_variant_toasts" class="block mt-2" size="sm">Show all</Button>
        </:example>

        <:code>{toast_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Actions" id="toast_4">
        <:example>
          <Toast
            :for={toast <- action_toasts()}
            id={toast.id}
            message={toast.message}
            variant={toast.variant}
            link_text={toast.link_text}
            link_href={toast.link_href}
            closeable={toast.closeable}
          />

          <Button variant="primary" on_click="show_action_toasts" class="block mt-2" size="sm">Show all</Button>
        </:example>

        <:code>{toast_4_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
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
