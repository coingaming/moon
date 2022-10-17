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
    </Container>
    """
  end
end
