defmodule MoonWeb.Examples.Design.DropdownExample.CustomInForm do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias MoonWeb.Schema.User
  alias Moon.Design.Form
  alias Moon.Design.Dropdown

  alias MoonWeb.Components.Anatomy

  prop(roles, :list, default: User.available_roles_with_icon())

  prop(changeset, :any, default: User.changeset(%User{}))

  def handle_event("change", params, socket) do
    changeset = User.changeset(%User{}, Map.get(params, "user", %{}))
    {:noreply, assign(socket, changeset: changeset)}
  end

  defp icon_and_title(assigns = %{option: nil}), do: ~F"{@prompt}"
  defp icon_and_title(assigns), do: ~F"<Moon.Icon name={@option[:icon]} /> {@option[:key]}"

  def render(assigns) do
    ~F"""
    <Form for={@changeset} class="w-full" change="change" id="user_very_custom">
      <Form.Field field={:role}>
        <Dropdown id="my-custom-dropdown">
          <Dropdown.Select class="rounded-none bg-chichi/10">
            <.icon_and_title
              option={Enum.find(@roles, &(&1[:value] == to_form(@changeset)[:role].value))}
              prompt="Select role"
            />
          </Dropdown.Select>
          <Dropdown.Options class="rounded-none my-0 shadow-chichi">
            <Dropdown.Option :for={o <- @roles}>
              <!-- span is here for some dirty hack to work with Surface's named slots -->
              <span class="w-full">
                <Form.Radio.Button class="w-full flex justify-between" value={o[:value]} disabled={o[:disabled]}>
                  <.icon_and_title option={o} />
                  <Form.Radio.Indicator />
                </Form.Radio.Button>
              </span>
            </Dropdown.Option>
          </Dropdown.Options>
        </Dropdown>
      </Form.Field>
      <Anatomy class="theme-moon-dark rounded-none" title={false}>@changeset = {inspect(@changeset, pretty: true)}</Anatomy>
    </Form>
    """
  end

  def code() do
    """
    alias MoonWeb.Schema.User
    alias Moon.Design.Form
    alias Moon.Design.Dropdown

    alias MoonWeb.Components.Anatomy

    prop(roles, :list, default: User.available_roles_with_icon())

    prop(changeset, :any, default: User.changeset(%User{}))

    def handle_event("change", params, socket) do
      changeset = User.changeset(%User{}, Map.get(params, "user", %{}))
      {:noreply, assign(socket, changeset: changeset)}
    end

    defp icon_and_title(assigns = %{option: nil}), do: ~F"{@prompt}"
    defp icon_and_title(assigns), do: ~F"<Moon.Icon name={@option[:icon]} /> {@option[:key]}"

    def render(assigns) do
      ~F\"""
      <Form for={@changeset} class="w-full" change="change" id="user_very_custom">
        <Form.Field field={:role}>
          <Dropdown id="my-custom-dropdown">
            <Dropdown.Select class="rounded-none bg-chichi/10">
              <.icon_and_title
                option={Enum.find(@roles, &(&1[:value] == to_form(@changeset)[:role].value))}
                prompt="Select role"
              />
            </Dropdown.Select>
            <Dropdown.Options class="rounded-none my-0 shadow-chichi">
              <Dropdown.Option :for={o <- @roles}>
                <!-- span is here for some dirty hack to work with Surface's named slots -->
                <span class="w-full">
                  <Form.Radio.Button class="w-full flex justify-between" value={o[:value]} disabled={o[:disabled]}>
                    <.icon_and_title option={o} />
                    <Form.Radio.Indicator />
                  </Form.Radio.Button>
                </span>
              </Dropdown.Option>
            </Dropdown.Options>
          </Dropdown>
        </Form.Field>
        <Anatomy class="theme-moon-dark rounded-none" title={false}>@changeset = {inspect(@changeset, pretty: true)}</Anatomy>
      </Form>
      \"""
    end
    """
  end
end
