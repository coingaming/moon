
defmodule Moon.Assets.Duotones.DynamicRewards do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    {{ asset_import @socket, "js/assets/duotone" }}

    <svg class="moon-duotone">
      <use href="/images/assets/duotones/dynamic-rewards.svg#item"></use>
    </svg>
    """
  end
end
