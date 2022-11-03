defmodule Moon.Components.DropdownMenuItems do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default)
  prop(width, :string, default: "60")
  prop(gap, :integer, default: 0)
  prop(class, :string)

  def render(assigns) do
    ~F"""
    <div class={"px-1 py-2 rounded-lg bg-gohan-100 shadow text-left w-#{@width} space-y-#{@gap} #{@class}"}>
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.DropdownMenuItem do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default)

  def render(assigns) do
    ~F"""
    <div class="p-3 text-moon-14 rounded cursor-pointer hover:bg-goku-100">
      <#slot />
    </div>
    """
  end
end
