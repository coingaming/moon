defmodule Moon.Parts.Status do
  @moduledoc false

  use Moon.StatelessComponent

  prop(active, :boolean, default: false)
  prop(class, :css_class)
  prop(id, :string)
  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <div class={"w-6 h-6 relative bg-heles rounded-full", "bg-roshi-10": @active}>
      <div class={"w-4 h-4 start-1 top-1 absolute bg-beerus rounded-full", "bg-roshi": @active} />
    </div>
    """
  end
end
