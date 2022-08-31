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
  alias MoonWeb.Components.PropsTable

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

  data props_info_array, :list,
    default: [
      %{
        :name => 'orientation',
        :type => 'vertical | horizontal',
        :required => 'false',
        :default => 'horizontal',
        :description => ''
      },
      %{
        :name => 'slot',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Default slot'
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

  def input_group_1000_state(assigns) do
    ~F"""
    {inspect(@user_changeset.changes, pretty: true)}
    """
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
                <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                  <InputGroup>
                    <TextInput field={:country} size="xl" placeholder="Country" />
                    <TextInput field={:phone} size="xl" placeholder="Phone" />
                  </InputGroup>
                </Form>

                <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                  <InputGroup orientation="vertical">
                    <TextInput field={:country} size="xl" placeholder="Country" />
                    <TextInput field={:phone} size="xl" placeholder="Phone" />
                  </InputGroup>
                </Form>
              </LeftToRight>
            </:example>

            <:code>{input_group_1_code()}</:code>

            <:state>{input_group_1000_state(assigns)}</:state>
          </ExampleAndCode>
        </Context>

        <PropsTable data={@props_info_array} />
      </TopToDown>
    </Page>
    """
  end

  defp input_group_1_code() do
    """
    <LeftToRight class="items-center justify-around w-full items-end">
      <InputGroup>
        <TextInput size="xl" placeholder="Country"/>
        <TextInput size="xl" placeholder="Phone"/>
      </InputGroup>

      <InputGroup orientation="vertical">
        <TextInput size="xl" placeholder="Country"/>
        <TextInput size="xl" placeholder="Phone"/>
      </InputGroup>
    </LeftToRight>
    """
  end

  defp input_group_100_code() do
    """
    <LeftToRight class="items-center justify-around w-full items-end">
      <InputGroup>
        <TextInput size="xl" type="email" placeholder="Email"/>
        <TextInput
          size="xl"
          type="password"
          id="password1"
          placeholder="Password"
        />
      </InputGroup>

      <InputGroup orientation="vertical">
        <TextInput size="xl" type="email" placeholder="Email"/>
        <TextInput
          size="xl"
          type="password"
          id="password2"
          placeholder="Password"
        />
      </InputGroup>
    </LeftToRight>
    """
  end

  defp input_group_1000_code() do
    """
    <TopToDown class="items-center">
      <Form
        for={@user_changeset}
        change="register_form_update"
        submit="register_form_submit"
        autocomplete="off"
      >
        <InputGroup>
          <TextInput field={:email} size="xl" type="email" placeholder="Email" />
          <TextInput field={:password} size="xl" type="password" id="password3" placeholder="Password" />
        </InputGroup>

        <div class="pt-4 flex items-center justify-around">
          <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
        </div>
      </Form>
    </TopToDown>
    """
  end
end
