
defmodule Moon.Assets.Icons.IconESportsRocketLeague do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop background_color, :string, values: Moon.colors
  prop font_size, :string
  
  def render(assigns) do 
    ~H"""
    {{ asset_import @socket, "js/assets/icon" }}

    <svg class="moon-icon">
      <use href="/images/assets/icons/icon-e-sports-rocket-league.svg#item"></use>
    </svg>
    """
  end
end
