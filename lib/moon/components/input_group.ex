defmodule Moon.Components.InputGroup do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.ErrorTag

  prop orientation, :string, default: "vertical", values: ["vertical", "horizontal"]
  prop error_from_field, :atom
  slot(default)

  def render(assigns) do
    ~F"""
    <Context put={__MODULE__, is_in_input_group: true, orientation: @orientation}>
      <div class={flex: @orientation == "horizontal"}>
        <#slot />
      </div>
      <ErrorTag field={@error_from_field} />
    </Context>
    """
  end
end
