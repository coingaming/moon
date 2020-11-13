
defmodule Moon.Assets.Icons.IconGeneralInfo do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop background_color, :string, values: Moon.colors
  prop font_size, :string
  
  def render(assigns) do 
    ~H"""
    <svg class="moon-icon">
      <use href="/assets/icons/icon-general-info.svg#item"></use>
    </svg>
    """
  end
end
