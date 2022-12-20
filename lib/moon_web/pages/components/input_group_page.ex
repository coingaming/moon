defmodule MoonWeb.Pages.Components.InputGroupPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.InputGroup
  alias Moon.Components.TextInput
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Components.Form
  alias MoonWeb.Components.PropsTable
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button

  data(breadcrumbs, :any,
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
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'orientation',
        :type => 'vertical | horizontal',
        :required => 'No',
        :default => 'horizontal',
        :description => ''
      },
      %{
        :name => 'slot',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Default slot'
      }
    ]
  )

  def mount(_params, _session, socket) do
    user = %User{}
    user_changeset = User.changeset(user, %{})

    {:ok,
     assign(socket,
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
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <ComponentPageDescription title="Input Group">
          <p>
            !!! Input Group is supported only in size `xlarge`.
          </p>
        </ComponentPageDescription>

        <ExampleAndCode id="group_1" title="Default">
          <:example>
            <LeftToRight class="items-center justify-around w-full items-end">
              <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                <InputGroup included_fields={[:country, :phone]}>
                  <TextInput field={:country} size="xl" placeholder="Country" />
                  <TextInput field={:phone} size="xl" placeholder="Phone" />
                </InputGroup>
              </Form>

              <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                <InputGroup orientation="vertical" included_fields={[:country, :phone]}>
                  <TextInput field={:country} size="xl" placeholder="Country" />
                  <TextInput field={:phone} size="xl" placeholder="Phone" />
                </InputGroup>
              </Form>
            </LeftToRight>
          </:example>

          <:code>{input_group_1_code()}</:code>

          <:state>{input_group_1000_state(assigns)}</:state>
        </ExampleAndCode>

        <ExampleAndCode id="group_10" title="RTL">
          <:example>
            <LeftToRight class="items-center justify-around w-full items-end" dir="rtl">
              <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                <InputGroup included_fields={[:country, :phone]}>
                  <TextInput field={:country} size="xl" placeholder="Country" />
                  <TextInput field={:phone} size="xl" placeholder="Phone" />
                </InputGroup>
              </Form>

              <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                <InputGroup orientation="vertical" included_fields={[:country, :phone]}>
                  <TextInput field={:country} size="xl" placeholder="Country" />
                  <TextInput field={:phone} size="xl" placeholder="Phone" />
                </InputGroup>
              </Form>
            </LeftToRight>
          </:example>

          <:code>{input_group_10_code()}</:code>

          <:state>{input_group_1000_state(assigns)}</:state>
        </ExampleAndCode>

        <ExampleAndCode id="group_100" title="Text type variants">
          <:example>
            <LeftToRight class="items-center justify-around w-full items-end">
              <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                <InputGroup included_fields={[:email, :password]}>
                  <TextInput field={:email} size="xl" placeholder="Email" type="email" />
                  <TextInput field={:password} size="xl" placeholder="Password" type="password" id="password1" />
                </InputGroup>
              </Form>

              <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                <InputGroup orientation="vertical" included_fields={[:email, :password]}>
                  <TextInput field={:email} size="xl" placeholder="Email" type="email" />
                  <TextInput field={:password} size="xl" placeholder="Password" type="password" id="password2" />
                </InputGroup>
              </Form>
            </LeftToRight>
          </:example>

          <:code>{input_group_100_code()}</:code>

          <:state>{input_group_1000_state(assigns)}</:state>
        </ExampleAndCode>

        <ExampleAndCode id="group_130" title="Form submission example">
          <:example>
            <LeftToRight class="items-center justify-around w-full items-end">
              <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                <InputGroup included_fields={[:email, :password]}>
                  <TextInput field={:email} size="xl" placeholder="Email" type="email" />
                  <TextInput field={:password} size="xl" placeholder="Password" type="password" id="password3_1" />
                </InputGroup>

                <div class="pt-4">
                  <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
                </div>
              </Form>

              <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
                <InputGroup orientation="vertical" included_fields={[:email, :password]}>
                  <TextInput field={:email} size="xl" placeholder="Email" type="email" />
                  <TextInput field={:password} size="xl" placeholder="Password" type="password" id="password3_2" />
                </InputGroup>

                <div class="pt-4">
                  <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
                </div>
              </Form>
            </LeftToRight>
          </:example>

          <:code>{input_group_120_code()}</:code>

          <:state>{input_group_1000_state(assigns)}</:state>
        </ExampleAndCode>

        <PropsTable title="TextInpoutGroup props" data={@props_info_array} />
      </TopToDown>
    </Page>
    """
  end

  defp input_group_1_code() do
    """
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
    """
  end

  defp input_group_10_code() do
    """
    <LeftToRight class="items-center justify-around w-full items-end" dir="rtl">
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
    """
  end

  defp input_group_100_code() do
    """
    <LeftToRight class="items-center justify-around w-full items-end">
      <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
        <InputGroup>
          <TextInput field={:email} size="xl" placeholder="Email" type="email" />
          <TextInput field={:password} size="xl" placeholder="Password" type="password" id="password1" />
        </InputGroup>
      </Form>

      <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
        <InputGroup orientation="vertical">
          <TextInput field={:email} size="xl" placeholder="Email" type="email" />
          <TextInput field={:password} size="xl" placeholder="Password" type="password" id="password2" />
        </InputGroup>
      </Form>
    </LeftToRight>
    """
  end

  defp input_group_120_code() do
    """
    <LeftToRight class="items-center justify-around w-full items-end">
      <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
        <InputGroup included_fields={[:email, :password]}>
          <TextInput field={:email} size="xl" placeholder="Email" type="email" />
          <TextInput field={:password} size="xl" placeholder="Password" type="password" id="password3_1" />
        </InputGroup>

        <div class="pt-4">
          <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
        </div>
      </Form>

      <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
        <InputGroup orientation="vertical" included_fields={[:email, :password]}>
          <TextInput field={:email} size="xl" placeholder="Email" type="email" />
          <TextInput field={:password} size="xl" placeholder="Password" type="password" id="password3_2" />
        </InputGroup>

        <div class="pt-4">
          <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
        </div>
      </Form>
    </LeftToRight>
    """
  end
end
