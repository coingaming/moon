
defmodule Moon.Assets.Crests.CrestSouthampton do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    <svg class="moon-crest">
      <use href="/assets/crests/crest-southampton.svg#item"></use>
    </svg>
    """
  end
end
