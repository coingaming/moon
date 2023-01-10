defmodule Moon.Components.Select.SingleSelect.HintText do
  @moduledoc false

  use Moon.StatelessComponent

  prop(has_error, :boolean, default: false)

  slot(default)

  def render(assigns) do
    ~F"""
    <div
      role="alert"
      class={"inline-block mt-2 text-moon-12", "text-chichi": @has_error, "text-trunks": !@has_error}
    >
      <#slot />
    </div>
    """
  end
end
