defmodule Moon.Parts.Status do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Active status"
  prop(active, :boolean, default: false)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional attributes set for the tag"
  prop(side_values, :any)

  def render(assigns) do
    ~F"""
    <div
      class={"w-6 h-6 relative bg-heles rounded-full", "bg-roshi-10": @active}
      :values={@side_values}
    >
      <div class={"w-4 h-4 start-1 top-1 absolute bg-beerus rounded-full", "bg-roshi": @active} />
    </div>
    """
  end
end
