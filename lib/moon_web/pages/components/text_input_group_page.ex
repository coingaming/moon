defmodule MoonWeb.Pages.Components.TextInputGroupPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Components.Heading
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.TextInputGroup
  alias Moon.Components.TextInputGroup.FirstInput
  alias Moon.Components.TextInputGroup.SecondInput

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/text-input-group",
        name: "Text Input Group"
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

      <Context put={theme_class: @theme_name}>
        <ExampleAndCode id="input_020" title="Sizes">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInputGroup>
                <FirstInput />
                <SecondInput />
              </TextInputGroup>
            </LeftToRight>
          </:example>

          <:code>{text_input_group_1_code()}</:code>
        </ExampleAndCode>
      </Context>
      </TopToDown>
    </Page>
    """
  end

  defp text_input_group_1_code() do
    """
    """
  end
end
