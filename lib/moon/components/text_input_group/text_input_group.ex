defmodule Moon.Components.TextInputGroup do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.TextInputGroup.Container

  prop orientation, :string,
    default: "horizontal",
    values: ["horizontal", "vertical"]

  prop dir, :string, default: "ltr", values: ["ltr", "rtl"]
  prop background_color, :string, default: "bg-gohan-100", values: Moon.colors()

  slot first_input, required: true, args: [:group_info]
  slot second_input, required: true, args: [:group_info]

  def render(assigns) do
    ~F"""
    <Container>
      <#slot name="first_input"
        :args={group_info: %{orientation: @orientation, dir: @dir, background_color: @background_color}}
      />
      <#slot name="second_input"
        :args={group_info: %{orientation: @orientation, dir: @dir, background_color: @background_color}}
      />
    </Container>
    """
  end
end
