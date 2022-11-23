defmodule MoonWeb.Components.ColorsPalette do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop(title, :string)
  prop(description, :string)
  prop(colors, :list)
  slot(default)

  def render(assigns) do
    ~F"""
    <h3 class="font-moon-16 font-semibold">
      {@title}
      <span :if={@description} class="font-normal">
        - {@description}</span>
    </h3>
    <div class="flex gap-4 items-start font-moon-16">
      {#for {color, index} <- Enum.with_index(@colors)}
        <div class="flex flex-col basis-1/2 lg:basis-40 gap-2 justify-center items-center" key={index}>
          <div class={"w-full h-40 rounded-moon-s-sm border border-beerus", color.bg_color} />
          <p>
            {color.name}
          </p>
        </div>
      {/for}
    </div>
    """
  end
end
