defmodule Moon.Components.Heading do
  use Moon.StatelessComponent

  prop(size, :integer, default: 16)
  prop(is_regular, :boolean)
  prop(color, :string)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/heading" }}

    <div class="moon-heading" data-size={{ @size }} data-is-regular={{ @is_regular && "true"}} style={{ get_style(color: @color) }}>
      <slot />
    </div>
    """
  end
end
