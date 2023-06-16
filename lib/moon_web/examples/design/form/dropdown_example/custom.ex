defmodule MoonWeb.Examples.Design.Form.DropdownExample.Custom do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias MoonWeb.Schema.User
  alias Moon.Design.Form
  alias Moon.Design.Dropdown

  prop(roles, :list, default: User.available_roles_with_icon())

  prop(changeset1, :any, default: User.changeset(%User{}))
  prop(changeset2, :any, default: User.changeset(%User{}))

  def handle_event("change" <> num, params, socket) do
    changeset = User.changeset(%User{}, Map.get(params, "user", %{}))
    {:noreply, assign(socket, "changeset#{num}": changeset)}
  end

  defp icon_and_title(assigns = %{option: nil}), do: ~F"{@prompt}"
  defp icon_and_title(assigns), do: ~F"<Moon.Icon name={@option[:icon]} /> {@option[:key]}"

  def render(assigns) do
    ~F"""
    <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
      <Form for={@changeset2} class="w-full" change="change2" id="user_bit_custom">
        <Form.Field field={:role} label="Light customization">
          <Form.Dropdown options={@roles}>
            <:option :let={option: option}>
              <Moon.Icon :if={option} name={option[:icon]} />
              {option[:key] || "Please select role"}
            </:option>
          </Form.Dropdown>
        </Form.Field>
      </Form>

      <Form for={@changeset1} class="w-full" change="change1" id="user_very_custom">
        <Form.Field field={:role} label="Deep customization">
          <Dropdown id="my-custom-dropdown">
            <Dropdown.Select class="rounded-full bg-chichi/10">
              [<.icon_and_title
                option={Enum.find(@roles, &(&1[:value] == to_form(@changeset1)[:role].value))}
                prompt="Select role"
              />]
            </Dropdown.Select>
            <Dropdown.Options class="rounded-none my-0 shadow-chichi">
              <Form.Radio.Button
                :for={o <- @roles}
                class="p-2 hover:bg-heles"
                value={o[:value]}
                disabled={o[:disabled]}
              >
                <.icon_and_title option={o} />
                <Form.Radio.Indicator />
              </Form.Radio.Button>
            </Dropdown.Options>
          </Dropdown>
        </Form.Field>
      </Form>
    </div>
    """
  end

  def code() do
    """
    alias MoonWeb.Schema.User
    alias Moon.Design.Form
    alias Moon.Design.Dropdown

    prop(roles, :list, default: User.available_roles_with_icon())

    prop(changeset1, :any, default: User.changeset(%User{}))
    prop(changeset2, :any, default: User.changeset(%User{}))

    def handle_event("change" <> num, params, socket) do
      changeset = User.changeset(%User{}, Map.get(params, "user", %{}))
      {:noreply, assign(socket, "changeset\#{num}": changeset)}
    end

    defp icon_and_title(assigns = %{option: nil}), do: ~F"{@prompt}"
    defp icon_and_title(assigns), do: ~F"<Moon.Icon name={@option[:icon]} /> {@option[:key]}"

    def render(assigns) do
      ~F\"""
      <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
        <Form for={@changeset2} class="w-full" change="change2" id="user_bit_custom">
          <Form.Field field={:role} label="Light customization">
            <Form.Dropdown options={@roles}>
              <:option :let={option: option}>
                <Moon.Icon :if={option} name={option[:icon]} />
                {option[:key] || "Please select role"}
              </:option>
            </Form.Dropdown>
          </Form.Field>
        </Form>

        <Form for={@changeset1} class="w-full" change="change1" id="user_very_custom">
          <Form.Field field={:role} label="Deep customization">
            <Dropdown id="my-custom-dropdown">
              <Dropdown.Select class="rounded-full bg-chichi/10">
                [<.icon_and_title
                  option={Enum.find(@roles, &(&1[:value] == to_form(@changeset1)[:role].value))}
                  prompt="Select role"
                />]
              </Dropdown.Select>
              <Dropdown.Options class="rounded-none my-0 shadow-chichi">
                <Form.Radio.Button
                  :for={o <- @roles}
                  class="p-2 hover:bg-heles"
                  value={o[:value]}
                  disabled={o[:disabled]}
                >
                  <Form.Radio.Indicator />
                  <.icon_and_title option={o} />
                </Form.Radio.Button>
              </Dropdown.Options>
            </Dropdown>
          </Form.Field>
        </Form>
      </div>
      \"""
    end
    """
  end
end
