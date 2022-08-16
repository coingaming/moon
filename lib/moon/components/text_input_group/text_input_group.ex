defmodule Moon.Components.TextInputGroup do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInputGroup.Container

  prop orientation, :string,
    default: "horizontal",
    values: ["horizontal", "vertical"]

  prop dir, :string, default: "ltr", values: ["ltr", "rtl"]
  prop background_color, :string, default: "bg-gohan-100", values: Moon.colors()
  prop size, :string, values: ["md", "lg", "xl"]

  slot first_input, required: true
  slot second_input, required: true

  def render(assigns) do
    ~F"""
    <Context
      put={__MODULE__, orientation: @orientation}
      put={__MODULE__, dir: @dir}
      put={__MODULE__, background_color: @background_color}
      put={__MODULE__, orientation: @orientation}
      put={__MODULE__, size: @size}
    >
      <Container>
        <slot name="first_input" />
        <slot name="second_input" />
      </Container>
    </Context>
    """
  end
end
