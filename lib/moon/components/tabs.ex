defmodule Moon.Components.Tabs do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Reel

  slot(default)

  def render(assigns) do
    ~F"""
    <div class="border-b border-goku-40">
      <Reel>
        <#slot />
      </Reel>
    </div>
    """
  end
end

defmodule Moon.Components.Tabs.TabLink do
  @moduledoc false

  use Moon.StatelessComponent
  alias Surface.Components.Link
  alias Surface.Components.LivePatch

  prop(active, :boolean, default: false)
  prop(patch, :boolean, default: false)
  prop(to, :any)
  prop(on_click, :event)
  prop(item_id, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    {#if @patch}
      <LivePatch
        to={@to}
        class={"inline-block p-1 text-center mr-5 #{@active && "border-b-2 border-piccolo"}"}
        :if={@to}
      >
        <#slot />
      </LivePatch>
    {#else}
      <Link
        to={@to}
        class={"inline-block p-1 text-center mr-5 #{@active && "border-b-2 border-piccolo"}"}
        :if={@to}
      >
        <#slot />
      </Link>
    {/if}
    <div
      :on-click={@on_click}
      phx-value-item_id={@item_id}
      class={"inline-block p-1 text-center mr-5 #{@active && "border-b-2 border-piccolo"}"}
      :if={!@to}
    >
      <#slot />
    </div>
    """
  end
end
