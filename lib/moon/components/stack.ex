defmodule Moon.Components.Stack do
  use Moon.StatelessComponent
  slot(default)
  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/stack" }}

    <div class="moon-stack">
      <slot />
    </div>
    """
  end
end
