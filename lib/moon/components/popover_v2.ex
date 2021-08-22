defmodule Moon.Components.PopoverV2 do
  use Moon.StatelessComponent

  prop show, :boolean, required: true

  prop placement, :string,
    values: [
      "top-start",
      "top",
      "top-end",
      "right-start",
      "right",
      "right-end",
      "bottom-start",
      "bottom",
      "bottom-end",
      "left-start",
      "left",
      "left-end"
    ],
    default: "bottom-start"

  prop on_close, :event

  slot default, required: true
  slot content, required: true

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}

    <div class="relative inline-block">
      <#slot />
      <div :if={@show} :on-click={@on_close} class="fixed inset-0 z-40" />

      {#case @placement}
        {#match "top-start"}
          <div :if={@show} class="absolute top-0 left-0 z-40">
            <div class="transform -translate-y-full pb-2">
              <#slot name="content" />
            </div>
          </div>
        {#match "top"}
          <div :if={@show} class="absolute left-0 top-0 right-0 flex flex-col items-center z-40">
            <div class="transform -translate-y-full pb-2">
              <#slot name="content" />
            </div>
          </div>
        {#match "top-end"}
          <div :if={@show} class="absolute top-0 right-0 z-40">
            <div class="transform -translate-y-full pb-2">
              <#slot name="content" />
            </div>
          </div>
        {#match "right-start"}
          <div :if={@show} class="absolute left-0 top-0 right-0 z-40">
            <div class="transform translate-x-full pl-2">
              <#slot name="content" />
            </div>
          </div>
        {#match "right"}
          <div :if={@show} class="absolute left-0 top-0 right-0 z-40">
            <div class="transform translate-x-full -translate-y-1/3 pl-2">
              <#slot name="content" />
            </div>
          </div>
        {#match "right-end"}
          <div :if={@show} class="absolute left-0 bottom-0 right-0 z-40">
            <div class="transform translate-x-full pl-2">
              <#slot name="content" />
            </div>
          </div>
        {#match "bottom-start"}
          <div :if={@show} class="absolute left-0 bottom-0 z-40">
            <div class="transform translate-y-full pt-2">
              <#slot name="content" />
            </div>
          </div>
        {#match "bottom"}
          <div :if={@show} class="absolute left-0 bottom-0 right-0 flex flex-col items-center z-40">
            <div class="transform translate-y-full pt-2">
              <#slot name="content" />
            </div>
          </div>
        {#match "bottom-end"}
          <div :if={@show} class="absolute right-0 bottom-0 z-40">
            <div class="transform translate-y-full pt-2">
              <#slot name="content" />
            </div>
          </div>
        {#match "left-start"}
          <div :if={@show} class="absolute left-0 top-0 right-0 z-40">
            <div class="absolute transform -translate-x-full">
              <div class="top-0 right-0 pr-2">
                <#slot name="content" />
              </div>
            </div>
          </div>
        {#match "left"}
          <div :if={@show} class="absolute left-0 bottom-0 right-0 z-40">
            <div class="absolute transform -translate-x-full -translate-y-1/3">
              <div class="top-0 right-0 pr-2">
                <#slot name="content" />
              </div>
            </div>
          </div>
        {#match "left-end"}
          <div :if={@show} class="absolute left-0 bottom-0 right-0 z-40">
            <div class="absolute transform -translate-x-full -translate-y-full">
              <div class="top-0 right-0 pr-2">
                <#slot name="content" />
              </div>
            </div>
          </div>
      {/case}
    </div>
    """
  end
end
