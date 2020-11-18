
defmodule Moon.Assets.Icons.IconSbShield do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop background_color, :string, values: Moon.colors
  prop font_size, :string
  
  def render(assigns) do 
    ~H"""
    {{ asset_import @socket, "js/assets/icon" }}
    
    <svg class="moon-icon" style={{ get_style(color: @color, background_color: @background_color, font_size: @font_size) }}>
      <use href="/svgs/icons/icon-sb-shield.svg#item"></use>
    </svg>
    
    """
  end
end
