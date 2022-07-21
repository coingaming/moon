defmodule MoonWeb.Components.ManifestCard do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop title, :string
  prop is_highlighted, :boolean
  prop content_items, :list

  def render(assigns) do
    ~F"""
    <div class={
      "moon-design-light flex flex-col gap-4 py-6 px-8 rounded-moon-s-lg",
      "bg-frieza-100 text-goten-100": @is_highlighted,
      "bg-gohan-100 text-bulma-100": !@is_highlighted
    }>
      <h3 class="text-moon-24 font-semibold">{@title}</h3>
      <ul :if={@content_items} class="list-disc ml-6">
        {#for item <- @content_items}
          <li class="text-moon-16">{item}</li>
        {/for}
      </ul>
    </div>
    """
  end
end
