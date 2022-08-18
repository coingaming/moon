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
  alias MoonWeb.Components.ComponentPageDescription

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
        <Heading size={56} class="mb-4">Text Input Group</Heading>
        <ComponentPageDescription>
          <p>
          !!! TextInput Group is supported only in size `xlarge`.
          </p>
        </ComponentPageDescription>


        <Context put={theme_class: @theme_name}>
          <ExampleAndCode id="input_1" title="Default">
            <:example>
              <LeftToRight class="items-center justify-around w-full items-end">

                <TextInputGroup>
                  <FirstInput placeholder="Country" />
                  <SecondInput placeholder="Phone" />
                </TextInputGroup>

                <TextInputGroup orientation="vertical" >
                  <FirstInput placeholder="Country" t_orientation="vertical" />
                  <SecondInput placeholder="Phone" t_orientation="vertical" />
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
