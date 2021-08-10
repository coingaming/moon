defmodule MoonWeb.Pages.ExamplePages.Customers.CustomerPreview do
  use MoonWeb, :stateful_component

  alias Moon.Components.{Text, Divider, Button, SlideOver}
  alias Moon.Autolayouts.{LeftToRight}
  alias Moon.Assets.Icons.{IconUser, IconShare}

  alias MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.OverviewTab
  alias MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.RewardsTab

  data active_tab, :string, default: "overview"

  prop customer, :map, required: true
  prop on_close, :event, required: true

  def render(assigns) do
    ~F"""
    <SlideOver on_close={@on_close}>
      <:header><Text size="24" class="block">Quick View</Text></:header>
      <:options>
        <IconUser font_size="1.5rem" class="mr-4" />
        <IconShare font_size="1.5rem" />
        <Divider orientation="vertical" class="mx-4"/>
      </:options>

      <div class="px-6 ">
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
    </SlideOver>
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
