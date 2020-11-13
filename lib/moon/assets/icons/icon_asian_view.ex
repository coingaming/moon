
defmodule Moon.Assets.Icons.IconAsianView do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop background_color, :string, values: Moon.colors
  prop font_size, :string
  
  def render(assigns) do 
    ~H"""
    <svg class="moon-icon">
      <use href="/assets/icons/icon-asian-view.svg#item"></use>
    </svg>
    """
  end
end
