defmodule MoonWeb.Examples.Design.Form.ComboboxExample.Default do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Form

  alias MoonWeb.Schema.User

  prop(titles, :list,
    default:
      [
        "Wade Cooper",
        "Arlene Mccoy",
        "Devon Webb",
        "Tom Cook",
        "Tanya Fox",
        "Hellen Schmidt"
      ]
      |> Enum.map(&%{key: &1, value: String.downcase(&1)})
  )

  prop(changeset, :any, default: User.changeset(%User{name: nil}))

  prop(filter, :string, default: "")

  def handle_event("change_filter", %{"value" => filter}, socket) do
    {:noreply, assign(socket, filter: filter)}
  end

  def handle_event("changed", params, socket) do
    user = Map.get(params, "user", %{})

    {:noreply,
     assign(socket,
       changeset: User.changeset(%User{}, user),
       filter: Map.get(user, "name", "")
     )}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full">
      <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
        <Form
          id={"user_combo_#{size}"}
          :for={size <- ~w(sm md lg)}
          class="w-full"
          for={@changeset}
          change="changed"
          submit="changed"
        >
          <Form.Field field={:name} label={"Size #{size}"} hint="Some hint here" {=size}>
            <Form.Combobox
              {=size}
              filter={@filter}
              options={@titles}
              on_keyup="change_filter"
            />
          </Form.Field>
        </Form>
      </div>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form

    alias MoonWeb.Schema.User

    import Moon.Helpers.Form, only: [filter_options: 2]

    prop(titles, :list,
      default:
        [
          "Wade Cooper",
          "Arlene Mccoy",
          "Devon Webb",
          "Tom Cook",
          "Tanya Fox",
          "Hellen Schmidt"
        ]
        |> Enum.map(&%{key: &1, value: String.downcase(&1)})
    )

    prop(changeset, :any, default: User.changeset(%User{name: nil}))

    prop(filter, :string, default: "")

    def handle_event("change_filter", _params = %{"value" => filter}, socket) do
      {:noreply, assign(socket, filter: filter)}
    end

    def handle_event("changed", params, socket) do
      user = Map.get(params, "user", %{})

      {:noreply,
      assign(socket,
        changeset: User.changeset(%User{}, user),
        filter: Map.get(user, "name", "")
      )}
    end

    def render(assigns) do
      ~F\"""
      <div class="w-full">
        <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
          <Form
            id={"user_combo_\#{size}"}
            :for={size <- ~w(sm md lg)}
            class="w-full"
            for={@changeset}
            change="changed"
          >
            <Form.Field field={:name} label={"Size \#{size}"} hint="Some hint here">
              <Form.Combobox
                {=size}
                filter={@filter}
                options={filter_options(@titles, @filter)}
                on_keyup="change_filter"
              />
            </Form.Field>
          </Form>
        </div>
      </div>
      \"""
    end
    """
  end
end
