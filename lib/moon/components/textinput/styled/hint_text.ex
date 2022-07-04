defmodule Moon.Components.TextInput.HintText do
  @moduledoc false

  use Moon.StatelessComponent

  prop is_error, :boolean

  slot default

  def render(assigns) do
    ~F"""
    <p role="alert"
      class={"inline-block mt-2 text-moon-12", "text-chi-chi-100": @is_error, "text-trunks": !@is_error}>
      <#slot />
    </p>
    """
  end
end
