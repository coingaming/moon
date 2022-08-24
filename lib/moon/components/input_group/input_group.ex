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

  slot default, args: [:input_group_class], required: true

  def render(assigns) do
    ~F"""
    <Context
      put={__MODULE__, orientation: @orientation}
      put={__MODULE__, dir: @dir}
      put={__MODULE__, background_color: @background_color}
      put={__MODULE__, is_in_input_group: true}
    >
      <Container>
        <#slot :args={input_group_class: get_class_input_group(@has_fields, @orientation, @dir)} />
      </Container>
    </Context>
    """
  end

  defp get_class_input_group(has_fields, orientation, dir) do
    cond do
      has_fields -> get_class_input_group_with_fields(orientation, dir)
      !has_fields -> get_class_input_group_no_fields(orientation, dir)
      true -> ""
    end
  end

  defp get_class_input_group_with_fields(orientation, dir) do
    cond do
      orientation == "horizontal" && dir == "ltr" ->
        "
        [&:first-child>div>div>input]:rounded-tr-none hover:[&:first-child>div>div>input]:rounded-moon-i-md
        [&:first-child>div>div>input]:rounded-br-none hover:[&:first-child>div>div>input]:rounded-moon-i-md
        [&:first-child>div>div>input]:input-rsb-hidden
        [&:last-child>div>div>input]:rounded-tl-none hover:[&:last-child>div>div>input]:rounded-moon-i-md
        [&:last-child>div>div>input]:rounded-bl-none hover:[&:last-child>div>div>input]:rounded-moon-i-md
        [&:last-child>div>div>input]:input-lsb-hidden
        "

      orientation == "horizontal" && dir == "rtl" ->
        "
        [&:first-child>div>div>input]:rounded-tl-none hover:[&:first-child>div>div>input]:rounded-moon-i-md
        [&:first-child>div>div>input]:rounded-bl-none hover:[&:first-child>div>div>input]:rounded-moon-i-md
        [&:first-child>div>div>input]:input-lsb-hidden
        [&:last-child>div>div>input]:rounded-tr-none hover:[&:last-child>div>div>input]:rounded-moon-i-md
        [&:last-child>div>div>input]:rounded-br-none hover:[&:last-child>div>div>input]:rounded-moon-i-md
        [&:last-child>div>div>input]:input-rsb-hidden"

      orientation == "vertical" ->
        "
        [&:first-child>div>div>input]:rounded-bl-none hover:[&:first-child>div>div>input]:rounded-moon-i-md
        [&:first-child>div>div>input]:rounded-br-none hover:[&:first-child>div>div>input]:rounded-moon-i-md
        [&:first-child>div>div>input]:input-bbb-hidden
        [&:last-child>div>div>input]:rounded-tl-none hover:[&:last-child>div>div>input]:rounded-moon-i-md
        [&:last-child>div>div>input]:rounded-tr-none hover:[&:last-child>div>div>input]:rounded-moon-i-md
        [&:last-child>div>div>input]:input-tbb-hidden"

      true ->
        ""
    end
  end

  defp get_class_input_group_no_fields(orientation, dir) do
    cond do
      orientation == "horizontal" && dir == "ltr" ->
        "
        [&:first-child>div>input]:rounded-tr-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:rounded-br-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:input-rsb-hidden
        [&:last-child>div>input]:rounded-tl-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:rounded-bl-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:input-lsb-hidden
        "

      orientation == "horizontal" && dir == "rtl" ->
        "
        [&:first-child>div>input]:rounded-tl-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:rounded-bl-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:input-lsb-hidden
        [&:last-child>div>input]:rounded-tr-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:rounded-br-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:input-rsb-hidden"

      orientation == "vertical" ->
        "
        [&:first-child>div>input]:rounded-bl-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:rounded-br-none hover:[&:first-child>div>input]:rounded-moon-i-md
        [&:first-child>div>input]:input-bbb-hidden
        [&:last-child>div>input]:rounded-tl-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:rounded-tr-none hover:[&:last-child>div>input]:rounded-moon-i-md
        [&:last-child>div>input]:input-tbb-hidden"

      true ->
        ""
    end
  end
end
