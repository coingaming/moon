defmodule Moon.Components.Heading do
  use Moon.StatelessComponent

  prop(id, :string)
  prop(size, :integer)
  prop(is_regular, :boolean)
  prop(color, :string)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/heading" }}

    <div id={{ @id }} class="moon-heading {{ @class }}" data-size={{ @size }} data-is-regular={{ @is_regular && "true"}} style={{ get_style(color: @color) }}>
      <slot />
    </div>
    """
  end
end
