defmodule Moon.Components.Heading do
  use Moon.StatelessComponent

  prop(size, :integer, required: false, default: 16)
  prop(is_bold, :boolean, required: false, default: false)
  prop(color, :string, default: "bulma_100")

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/heading" }}

    <div class="moon-heading">
      <slot />
    </div>
    """
  end
end
