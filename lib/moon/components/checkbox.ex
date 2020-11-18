defmodule Moon.Components.Checkbox do
  use Moon.StatelessComponent

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/checkbox" }}

    <label class="moon-checkbox">
      <input class="moon-checkbox-input" type="checkbox" />
      <span class="moon-checkbox-caption">
        <slot />
      </span>
    </label>
    """
  end
end
