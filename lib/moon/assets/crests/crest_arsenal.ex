
defmodule Moon.Assets.Crests.CrestArsenal do 
  use Moon.StatelessComponent
  
  prop color, :string, values: Moon.colors
  prop height, :string
  prop width, :string
  prop font_size, :string
  prop vertical_align, :string
  
  def render(assigns) do 
    ~H"""
    {{ asset_import @socket, "js/assets/crest" }}

    <svg class="moon-crest">
      <use href="/images/assets/crests/crest-arsenal.svg#item"></use>
    </svg>
    """
  end
end
