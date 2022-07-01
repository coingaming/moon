defmodule MoonWeb.Pages.Components.TextInput.TextInputPage2 do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Components.TextInput2
  alias Moon.Components.Heading

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/text_input",
        name: "Text Input"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Text Input</Heading>

        <ExampleAndCode id="input_1" title="Default">
          <:example>
            <TextInput2 />
          </:example>

          <:code>{text_input_code()}</:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def text_input_code do
    """

    """
  end
end
