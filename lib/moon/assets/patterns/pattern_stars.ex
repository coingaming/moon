
defmodule Moon.Assets.Patterns.PatternStars do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    <svg class="moon-pattern">
      <use href="/assets/patterns/pattern-stars.svg#item"></use>
    </svg>
    """
  end
end
