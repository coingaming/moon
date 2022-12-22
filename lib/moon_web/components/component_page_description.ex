defmodule MoonWeb.Components.ComponentPageDescription do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Label

  prop(title, :string)
  prop(image, :string)
  prop(is_aria_support, :boolean)
  prop(is_rtl_support, :boolean)
  prop(is_in_progress, :boolean)
  prop(is_deprecated, :boolean)

  prop(is_label_visible, :boolean, default: false)

  slot(default)


  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row gap-4">
      <div class="flex flex-col gap-12 lg:basis-1/2">
        <div class="flex flex-col gap-2">
          <h1 class="text-moon-32 font-medium">{@title}</h1>

          <div class="flex items-start gap-2">
            <Label is_deprecated={@is_deprecated} size="2xs" background_color="bg-chiChi-60" color="text-popo" class="gap-1 select-none py-0 px-2 text-moon-9-caption uppercase font-medium h-4" >Deprecated</Label>
            <Label is_in_progress={@is_in_progress} size="2xs" background_color="bg-krillin-60" color="text-popo" class="gap-1 select-none py-0 px-2 text-moon-9-caption uppercase font-medium h-4">In progress</Label>
            <Label is_aria_support={@is_aria_support} size="2xs" background_color="bg-nappa" color="text-goten" class="gap-1 select-none py-0 px-2 text-moon-9-caption uppercase font-medium h-4">ARIA</Label>
            <Label is_rtl_support={@is_rtl_support} size="2xs" background_color="bg-whis" color="text-goten" class="gap-1 select-none py-0 px-2 text-moon-9-caption uppercase font-medium h-4">RTL</Label>
            </div>
        </div>
        <div class="flex flex-col items-start gap-2 text-moon-16">
          <#slot />
        </div>
      </div>
      <div
        :if={@image}
        class="flex lg:basis-1/2 items-center justify-center h-80 rounded-moon-s-md overflow-hidden"
      >
        <img src={@image} alt={@title}>
      </div>
    </div>
    """
  end
end
