defmodule Moon.Components.Text do
  use Moon.StatelessComponent

  prop(size, :integer)
  prop(is_bold, :boolean)
  prop(color, :string)

  def render(assigns) do
    ~H"""
    <div data-size={{ @size }} data-is-bold={{ @is_bold }} style={{ get_style(color: @color) }}>
      <slot />
    </div>
    """
  end
end
