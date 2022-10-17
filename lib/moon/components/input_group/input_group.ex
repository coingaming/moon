defmodule Moon.Components.InputGroup do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.InputGroup.Container

  prop orientation, :string,
    default: "horizontal",
    values: ["horizontal", "vertical"]

  prop has_fields, :boolean, default: false
  prop included_fields, :list

  slot default, required: true, args: [:group_class_fields]

  def render(assigns) do
    ~F"""
    <Container orientation={@orientation}>
      <#slot />
      <div>
      </div>
    </Container>
    """
  end

  defp get_errors(form, fields) do
    list =
      for field <- fields do
        Enum.at(Keyword.get_values(form.errors, field), 0)
      end

    IO.inspect(list)
    list
  end
end
