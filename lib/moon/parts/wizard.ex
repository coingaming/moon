defmodule Moon.Parts.Wizard do
  @moduledoc false

  use Moon.StatefulComponent

  alias __MODULE__
  alias Moon.Design.Tabs

  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Index of the selected step"
  prop(selected, :integer, default: 0)
  @doc "List of steps, format: [%{title, text}]"
  prop(steps, :list, default: [])
  @doc "Dark/Light theme switch"
  prop(is_dark, :boolean, default: true)

  @doc "Next button click event"
  prop(on_next, :event)
  @doc "Previous button click event"
  prop(on_prev, :event)
  @doc "Description slot"
  slot(description)

  @doc "Slot for buttons and so on"
  slot(default)

  @doc "Slot for tab panels"
  slot(content)

  def render(assigns) do
    ~F"""
    <div class={"relative w-full p-1 rounded-moon-s-lg", "bg-bulma": @is_dark}>
      <Tabs id={"#{@id}-tabs"} testid={@testid} class={"flex-row items-stretch", @class} {=@selected}>
        <Tabs.List
          class={"flex-col overflow-x-hidden overflow-y-auto items-left w-1/3 pe-10 ps-8", "theme-moon-dark": @is_dark}
          tab_module={Wizard.Step}
          tab_titles={@steps}
        >
          <#slot {@description} />
          <:tab_title :let={tabindex: _index, title: %{title: title, text: text}}>
            <span class="text-moon-14 text-bulma font-medium">{title}</span>
            <p class="text-moon-14 text-bulma text-start lg:inline hidden">{text}</p>
          </:tab_title>
        </Tabs.List>
        <:content>
          <#slot {@content} />
        </:content>
      </Tabs>

      <#slot context_put={
        on_next: @on_next || %{name: "next_page", target: @myself},
        on_prev: @on_prev || %{name: "prev_page", target: @myself},
        button_values: %{selected: @selected, total: Enum.count(@steps)}
      } />
    </div>
    """
  end

  def handle_event("next_page", %{"selected" => selected, "total" => tab_count}, socket) do
    selected =
      if String.to_integer(selected) >= tab_count,
        do: String.to_integer(selected),
        else: String.to_integer(selected) + 1

    {:noreply, assign(socket, selected: selected)}
  end

  def handle_event("prev_page", %{"selected" => selected}, socket) do
    selected = String.to_integer(selected) - 1
    {:noreply, assign(socket, selected: selected)}
  end
end
