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
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Components.Form

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
        <Heading size={56} class="mb-4">Text Input Group</Heading>
        <ComponentPageDescription>
          <p>
          !!! TextInput Group is supported only in size `xlarge`.
          </p>
        </ComponentPageDescription>


        <Context put={theme_class: @theme_name}>
          <ExampleAndCode id="group_1" title="Default">
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

          <ExampleAndCode id="group_6" title="RTL">
            <:example>
              <LeftToRight class="items-center justify-around w-full items-end">

                <TextInputGroup dir="rtl">
                  <FirstInput placeholder="Country" t_dir="rtl" />
                  <SecondInput placeholder="Phone" t_dir="rtl"/>
                </TextInputGroup>

                <TextInputGroup orientation="vertical" dir="rtl">
                  <FirstInput placeholder="Country" t_orientation="vertical" t_dir="rtl"/>
                  <SecondInput placeholder="Phone" t_orientation="vertical" t_dir="rtl"/>
                </TextInputGroup>
              </LeftToRight>
            </:example>

            <:code>{text_input_group_6_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="group_10" title="With Field">
            <:example>
              <LeftToRight class="items-center justify-around w-full items-end">

              <Form
                for={@user_changeset}
                change="register_form_update"
                submit="register_form_submit"
                autocomplete="off"
              >
                <TextInputGroup>
                  <FirstInput placeholder="Username" field={:username} />
                  <SecondInput placeholder="Password" id="password" type="password" field={:password} />
                </TextInputGroup>

              </Form>
              </LeftToRight>
            </:example>

            <:code>{text_input_group_10_code()}</:code>
          </ExampleAndCode>
        </Context>
      </TopToDown>
    </Page>
    """
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event("register_form_update", params, socket) do
    user_changeset = User.changeset(socket.assigns.user, params["user"])

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("register_form_submit", params, socket) do
    user_changeset =
      User.changeset(socket.assigns.user, params["user"]) |> Map.merge(%{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  defp text_input_group_1_code() do
    """
    """
  end

  defp text_input_group_6_code() do
    """
    """
  end

  defp text_input_group_10_code() do
    """
    """
  end
end
