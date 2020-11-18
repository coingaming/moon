
defmodule Moon.Assets.Icons.IconGlobe do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop background_color, :string, values: Moon.colors
  prop font_size, :string
  
  def render(assigns) do 
    ~H"""
    {{ asset_import @socket, "js/assets/icon" }}

    <svg class="moon-icon">
      <use href="/images/assets/icons/icon-globe.svg#item"></use>
    </svg>
    """
  end
end
