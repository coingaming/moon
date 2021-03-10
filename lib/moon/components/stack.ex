defmodule Moon.Components.Stack do
  use Moon.StatelessComponent
  slot(default)
  prop(class, :string)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/stack" }}

    <div class="moon-stack {{ @class }}">
      <slot />
    </div>
    """
  end
end
