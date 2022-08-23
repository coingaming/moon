defmodule MoonWeb.Pages.Components.InputGroupPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Components.Heading
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.InputGroup
  alias Moon.Components.TextInput
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Components.Form

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/input-group",
        name: "Input Group"
      }
    ]

  def mount(params, _session, socket) do
    user = %User{}
    user_changeset = User.changeset(user, %{})

    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__,
       user: user,
       user_changeset: user_changeset
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Input Group</Heading>
        <ComponentPageDescription>
          <p>
          !!! Input Group is supported only in size `xlarge`.
          </p>
        </ComponentPageDescription>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode id="group_1" title="Default">
              <:example>
                <LeftToRight class="items-center justify-around w-full items-end">

                  <InputGroup :let={input_group_class: input_group_class}>
                    <TextInput size="xl" placeholder="Country" class={input_group_class} />
                    <TextInput size="xl" placeholder="Phone" class={input_group_class} />
                  </InputGroup>

                  <InputGroup orientation="vertical" :let={input_group_class: input_group_class}>
                    <TextInput size="xl" placeholder="Country" class={input_group_class} />
                    <TextInput size="xl" placeholder="Phone" class={input_group_class} />
                  </InputGroup>
                </LeftToRight>
              </:example>

              <:code>{input_group_1_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="group_10" title="RTL">
            <:example>
              <LeftToRight class="items-center justify-around w-full items-end">

                <InputGroup dir="rtl" :let={input_group_class: input_group_class}>
                  <TextInput size="xl" placeholder="Country" class={input_group_class} dir="rtl" />
                  <TextInput size="xl" placeholder="Phone" class={input_group_class} dir="rtl" />
                </InputGroup>

                <InputGroup dir="rtl" orientation="vertical" :let={input_group_class: input_group_class}>
                  <TextInput size="xl" placeholder="Country" dir="rtl" class={input_group_class} />
                  <TextInput size="xl" placeholder="Phone" dir="rtl" class={input_group_class} />
                </InputGroup>
              </LeftToRight>
            </:example>

            <:code>{input_group_10_code()}</:code>
          </ExampleAndCode>
        </Context>
      </TopToDown>
    </Page>
    """
  end

  defp input_group_1_code() do
    """
    """
  end

  defp input_group_10_code() do
    """
    """
  end
end
