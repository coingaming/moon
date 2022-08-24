defmodule Moon.Components.InputGroup do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.InputGroup.Container

  prop orientation, :string,
    default: "horizontal",
    values: ["horizontal", "vertical"]

  prop dir, :string, default: "ltr", values: ["ltr", "rtl"]
  prop background_color, :string, default: "gohan-100", values: Moon.colors()
  prop has_fields, :boolean, default: false

  slot default, required: true

  def render(assigns) do
    ~F"""
    <Context
      put={__MODULE__, orientation: @orientation}
      put={__MODULE__, dir: @dir}
      put={__MODULE__, background_color: @background_color}
    >
      <Container>
        <#slot />
      </Container>
    </Context>
    """
  end
end
