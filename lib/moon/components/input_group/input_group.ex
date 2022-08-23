defmodule Moon.Components.InputGroup do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.InputGroup.Container

  prop orientation, :string,
    default: "horizontal",
    values: ["horizontal", "vertical"]

  prop dir, :string, default: "ltr", values: ["ltr", "rtl"]
  prop background_color, :string, default: "gohan-100", values: Moon.colors()

  slot default

  def render(assigns) do
    ~F"""
    <Context
      put={__MODULE__, orientation: @orientation}
      put={__MODULE__, dir: @dir}
      put={__MODULE__, background_color: @background_color}
      put={__MODULE__, is_in_group: true}
      put={__MODULE__, input_group_class: get_class_input_group(@orientation, @dir)}

    >
      <Container>
        <#slot />
      </Container>
    </Context>
    """
  end

  defp get_class_input_group(orientation, dir) do
    cond do
      orientation == "horizontal" && dir == "ltr" ->
        "first:[&*input]:rounded-tr-none first:[&*input]:rounded-br-none first:[&*input]:input-rsb-hidden last:[&*input]:rounded-tl-none last:[&*input]:rounded-bl-none last:[&*input]:input-lsb-hidden"

      orientation == "horizontal" && dir == "rtl" ->
        "first:[&*input]:rounded-tl-none first:[&*input]:rounded-bl-none first:[&*input]:input-lsb-hidden last:[&*input]:rounded-tr-none last:[&*input]:rounded-br-none last:[&*input]:input-rsb-hidden"

      orientation == "vertical" ->
        "first:[&*input]:rounded-bl-none first:[&*input]:rounded-br-none first:[&*input]:input-bbb-hidden last:[&*input]:rounded-tl-none last:[&*input]:rounded-tr-none last:[&*input]:input-tbb-hidden"

      true ->
        ""
    end
  end
end
