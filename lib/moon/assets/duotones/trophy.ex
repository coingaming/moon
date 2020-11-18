
defmodule Moon.Assets.Duotones.Trophy do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    {{ asset_import @socket, "js/assets/duotone" }}
    
    <svg class="moon-duotone" style={{ get_style(color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align) }}>
      <use href="/svgs/duotones/trophy.svg#item"></use>
    </svg>
    
    """
  end
end
