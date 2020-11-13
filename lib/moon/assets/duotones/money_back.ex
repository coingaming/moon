
defmodule Moon.Assets.Duotones.MoneyBack do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    <svg class="moon-duotone">
      <use href="/assets/duotones/money-back.svg#item"></use>
    </svg>
    """
  end
end
