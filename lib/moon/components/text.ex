defmodule Moon.Components.Text do
  use Moon.StatelessComponent

  prop(size, :integer, required: false, default: 16)
  prop(is_bold, :boolean, required: false, default: false)
  prop(color, :string, default: "bulma_100")
  prop(style, :string)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/text" }}

    <div class="moon-text">
      <slot />
    </div>
    """
  end
end
