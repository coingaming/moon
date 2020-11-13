
defmodule Moon.Assets.Icons.IconSportsCricket do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop background_color, :string, values: Moon.colors
  prop font_size, :string
  
  def render(assigns) do 
    ~H"""
    <svg class="moon-icon">
      <use href="/assets/icons/icon-sports-cricket.svg#item"></use>
    </svg>
    """
  end
end
