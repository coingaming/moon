
defmodule Moon.Assets.Patterns.PatternSpeed do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    {{ asset_import @socket, "js/assets/pattern" }}

    <svg class="moon-pattern">
      <use href="/images/assets/patterns/pattern-speed.svg#item"></use>
    </svg>
    """
  end
end
