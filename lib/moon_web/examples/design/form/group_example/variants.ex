defmodule MoonWeb.Examples.Design.Form.GroupExample.Variants do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Group
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.Select

  alias Moon.Design.Form
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.InsetField
  alias MoonWeb.Schema.User

  prop(countries, :list,
    default: [
      [key: "Italy", value: "IT"],
      [key: "China", value: "CH"],
      [key: "Germany", value: "GE"]
    ]
  )

  prop(numbers, :list,
    default: [
      [key: "41", value: "41"],
      [key: "42", value: "42"],
      [key: "43", value: "43"],
      [key: "44", value: "44"]
    ]
  )

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-4">
      <Group>
        <Select options={@countries} />
        <Input placeholder="Phone number" type="phone" />
      </Group>
      <Group orientation="horizontal">
        <Input placeholder="Street" />
        <Select options={@numbers} />
      </Group>

      <Form for={@user_changeset}>
        <Group>
          <InsetField label="Label1">
            <Input placeholder="Placeholder1" />
          </InsetField>
          <InsetField label="Label2">
            <Input placeholder="Placeholder2" />
          </InsetField>
        </Group>
      </Form>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Group
    alias Moon.Design.Form.Input
    alias Moon.Design.Form.Select

    prop(countries, :list,
      default: [
        [key: "Italy", value: "IT"],
        [key: "China", value: "CH"],
        [key: "Germany", value: "GE"]
      ]
    )

    prop(numbers, :list,
      default: [
        [key: "41", value: "41"],
        [key: "42", value: "42"],
        [key: "43", value: "43"],
        [key: "44", value: "44"]
      ]
    )

    def render(assigns) do
      ~F\"""
      <div class="flex flex-col gap-4">
        <Group>
          <Select options={@countries} />
          <Input placeholder="Phone number" type="phone" />
        </Group>
        <Group orientation="horizontal">
          <Input placeholder="Street" />
          <Select options={@numbers} />
        </Group>
      </div>
      \"""
    end
    """
  end
end
