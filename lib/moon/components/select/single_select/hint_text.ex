defmodule Moon.Components.Select.SingleSelect.HintText do
  @moduledoc false

  use Moon.StatelessComponent

  prop is_error, :boolean, default: false

  slot default

  def render(assigns) do
    ~F"""
    <div
      role="alert"
      class={"inline-block mt-2 text-moon-12", "text-chi-chi-100": @is_error, "text-trunks-100": !@is_error}
    >
      <#slot />
    </div>
    """
  end
end
