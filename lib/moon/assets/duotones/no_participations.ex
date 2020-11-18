
defmodule Moon.Assets.Duotones.NoParticipations do 
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
      <use href="/images/assets/duotones/no-participations.svg#item"></use>
    </svg>
    """
  end
end
