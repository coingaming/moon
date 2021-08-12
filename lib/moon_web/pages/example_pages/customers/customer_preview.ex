defmodule MoonWeb.Pages.ExamplePages.Customers.CustomerPreview do
  use MoonWeb, :stateful_component

  alias Moon.Components.{Text, Divider, Button}
  alias Moon.Autolayouts.{LeftToRight}
  alias Moon.Assets.Icons.{IconUser, IconShare, IconCloseRounded}

  alias MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.OverviewTab
  alias MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.RewardsTab

  data active_tab, :string, default: "overview"

  prop customer, :map, required: true
  prop on_close, :event, required: true

  def render(assigns) do
    ~F"""
    <div class="fixed top-0 right-0 bottom-0 w-1/2 flex flex-col px-6 z-20 bg-gohan-100 shadow overflow-y-auto">
      <div class="flex-none flex justify-between py-5">
        <Text size="24" class="block">Quick View</Text>
        <div class="flex items-center">
          <IconUser font_size="1.5rem" class="mr-4" />
          <IconShare font_size="1.5rem" />
          <Divider orientation="vertical" class="mx-4" />
          <div class="p-2 rounded bg-goku-100 cursor-pointer" :on-click={@on_close}>
            <IconCloseRounded font_size="1.5rem" />
          </div>
        </div>
      </div>

      <LeftToRight class="mb-4">
        {#for tab <- ["overview", "rewards", "KPI", "cashier", "TXN", "comms", "fraud", "notes"]}
          <Button
            :if={tab == @active_tab}
            on_click={"select_tab:#{tab}"}
            size="xsmall"
            class="rounded bg-goku-100"
          >
            <Text size="14" class="capitalize text-gohan-80">{tab}</Text>
          </Button>

          <Button
            :if={tab != @active_tab}
            on_click={"select_tab:#{tab}"}
            variant="danger"
            size="xsmall"
            class="rounded"
          >
            <Text size="14" class="capitalize text-hit-80">{tab}</Text>
          </Button>
        {/for}
      </LeftToRight>

      {#case @active_tab}
        {#match "overview"}
          <OverviewTab id="overview_tab" customer={@customer} />
        {#match "rewards"}
          <div class="flex items-center justify-around h-64 w-full">
            <RewardsTab id="rewards_tab" />
          </div>
        {#match "KPI"}
          <div class="flex items-center justify-around h-64 w-full">
            <Text size="16">TODO</Text>
          </div>
        {#match "cashier"}
          <div class="flex items-center justify-around h-64 w-full">
            <Text size="16">TODO</Text>
          </div>
        {#match "TXN"}
          <div class="flex items-center justify-around h-64 w-full">
            <Text size="16">TODO</Text>
          </div>
        {#match "comms"}
          <div class="flex items-center justify-around h-64 w-full">
            <Text size="16">TODO</Text>
          </div>
        {#match "fraud"}
          <div class="flex items-center justify-around h-64 w-full">
            <Text size="16">TODO</Text>
          </div>
        {#match "notes"}
          <div class="flex items-center justify-around h-64 w-full">
            <Text size="16">No notes found</Text>
          </div>
      {/case}
    </div>
    """
  end

  def handle_event(event, _, socket) do
    case String.split(event, ":") do
      ["select_tab", tab] ->
        {:noreply, socket |> assign(active_tab: tab)}

      _ ->
        {:noreply, socket}
    end
  end
end
