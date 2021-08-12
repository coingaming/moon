defmodule MoonWeb.Pages.ExamplePages.Shared.NewWidgetPanel do
  use MoonWeb, :stateful_component

  alias Moon.Components.Button
  alias Moon.Components.IconButton
  alias Moon.Components.SlideOver

  prop categories, :list, default: []

  data active_category, :map, default: %{}

  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign(active_category: List.first(assigns.categories))

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <SlideOver on_close="close">
      <:heading>Add new widget</:heading>
      <:content>
        <div class="flex flex-wrap items-center gap-1 mb-6">
          {#for category <- @categories}
            <Button
              rounded
              class={"p-2 text-sm font-normal #{active_btn_class(category.name == @active_category.name)}"}
              on_click="select_category"
              value_name="category_name"
              value={category.name}
            >
              {category.name} · {length(category.widget_kinds)}
            </Button>
          {/for}
        </div>

        <div class={
          "grid gap-6",
          "grid-cols-1": length(@active_category.widget_kinds) == 1,
          "grid-cols-2": length(@active_category.widget_kinds) > 1
        }>
          {#for widget_kind <- @active_category.widget_kinds}
            <div class="flex flex-col items-center justify-center p-6 border border-dashed rounded border-beerus-100">
              <IconButton
                icon_name={widget_icon(widget_kind)}
                icon_size="4.5rem"
                class="bg-goku-100"
                height={25}
                width={25}
                click="add_widget"
                value_name="widget"
                value={"#{@active_category.name}:#{widget_kind}"}
              />

              <div class="mt-6 text-sm font-semibold text-piccolo-100">
                {widget_kind}
              </div>
            </div>
          {/for}
        </div>
      </:content>
    </SlideOver>
    """
  end

  defp active_btn_class(true), do: "bg-goku-120 text-bulma-100"
  defp active_btn_class(false), do: "text-trunks-100 hover:text-bulma-100"

  defp widget_icon("Top"), do: "icon_chart_bar"
  defp widget_icon("Calendar"), do: "icon_calendar"

  def handle_event("select_category", %{"category_name" => name}, socket) do
    category = Enum.find(socket.assigns.categories, &(&1.name == name))
    {:noreply, assign(socket, active_category: category)}
  end

  def handle_event("close", _, socket) do
    send(self(), {:new_widget_panel, :close})
    {:noreply, socket}
  end

  def handle_event("add_widget", %{"widget" => value}, socket) do
    [category, widget_kind] = String.split(value, ":", parts: 2)
    send(self(), {:new_widget_panel, :add, {category, widget_kind}})
    {:noreply, socket}
  end
end
