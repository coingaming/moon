
defmodule Moon.Assets.Duotones.PriceBoost do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    <svg class="moon-duotone">
      <use href="/assets/duotones/price-boost.svg#item"></use>
    </svg>
    """
  end
end
