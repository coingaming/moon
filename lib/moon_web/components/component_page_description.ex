defmodule MoonWeb.Components.ComponentPageDescription do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.Badges.Deprecated
  alias MoonWeb.Components.Badges.InProgress
  alias MoonWeb.Components.Badges.AriaSupport
  alias MoonWeb.Components.Badges.RTLSupport

  prop(title, :string)
  prop(image, :string)

  prop(is_deprecated, :boolean, default: false)
  prop(is_in_progress, :boolean, default: false)
  prop(is_aria_support, :boolean, default: false)
  prop(is_rtl_support, :boolean, default: false)

  slot(default)

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row gap-4">
      <div class="flex flex-col gap-12 lg:basis-1/2">
        <div class="flex flex-col gap-2">
          <h1 class="text-moon-32 font-medium">{@title}</h1>
          <div class="flex items-start gap-2">
            <Deprecated :if={@is_deprecated} />
            <InProgress :if={@is_in_progress} />
            <AriaSupport :if={@is_aria_support} />
            <RTLSupport :if={@is_rtl_support} />
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
