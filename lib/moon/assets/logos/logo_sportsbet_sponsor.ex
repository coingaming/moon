
defmodule Moon.Assets.Logos.LogoSportsbetSponsor do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    {{ asset_import @socket, "js/assets/logo" }}

    <svg class="moon-logo">
      <use href="/images/assets/logos/logo-sportsbet-sponsor.svg#item"></use>
    </svg>
    """
  end
end
