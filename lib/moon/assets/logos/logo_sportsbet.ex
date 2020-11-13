
defmodule Moon.Assets.Logos.LogoSportsbet do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    <svg class="moon-logo">
      <use href="/assets/logos/logo-sportsbet.svg#item"></use>
    </svg>
    """
  end
end
