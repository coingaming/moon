defmodule Moon.Components.Popover do
  use Moon.StatelessComponent

  slot(default)
  prop class, :css_class
  prop placement, :string, values: ["under"]
  prop close, :event

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}

    <div
      class="fixed top-0 left-0 right-0 bottom-0 bg-gohan-100 z-30"
      style="opacity: 0;"
      :on-click={@close}
    >
    </div>

    <div class={"p-4 h-80 w-80 bg-gohan-100 shadow rounded absolute #{@class} z-40"}>
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.Popover.Outer do
  use Moon.StatelessComponent

  slot(default)

  def render(assigns) do
    ~F"""
    <div class="relative">
      <#slot />
    </div>
    """
  end
end
