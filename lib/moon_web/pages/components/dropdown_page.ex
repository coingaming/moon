defmodule MoonWeb.Pages.Components.DropdownPage do
  require Logger
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Heading
  alias Moon.Components.CodePreview
  alias Moon.Components.Dropdown
  alias Moon.Components.Link
  alias Moon.Components.CheckboxMultiselect
  alias Moon.Components.SingeItemSelect

  @default_games_list [
    %{label: "Game 1", value: "1"},
    %{label: "Game 2", value: "2"},
    %{label: "Game 3", value: "3"},
    %{label: "Game 4", value: "4"},
    %{label: "Game 5", value: "5"}
  ]

  data(item_id, :string, default: "1")
  data(selected_game_ids, :list, default: ["1", "2"])
  data(selectable_game_options, :list, default: @default_games_list)
  data(selectable_filtered_game_options, :list, default: @default_games_list)
  data(game_search, :string, default: %{value: ""})
  data(other_game_id, :string, default: "1")

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    <Heading size={32} class="mb-8">Dropdown</Heading>

    <p>
      Dropdowns showcase a list of options that allow users to make single or multiple selections. An option that’s been selected can represent a corresponding value in forms or be used to filter/sort content.
    </p>
    <p class="mt-4">
      <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Components?node-id=15965%3A14977">Figma design</Link>
    </p>
    <p class="mt-4">
      <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/dropdown_page.ex">Sourcecode of this page</Link>
    </p>
    <p class="mt-4">
      <Link to="https://moon.io/components/filterDropdown">React implementation</Link>
    </p>

    <Heading size={24} class="mt-8">
      <a id="checkbox-multiselect">Using CheckboxMultiselect</a>
    </Heading>

    <ExampleAndCode class="mt-4" show_state={true}>
      <#template slot="example">
        <Dropdown>
          <CheckboxMultiselect
            on_change="handle_game_selection_changed"
            value={@selected_game_ids}
            options={@selectable_game_options}
          />
        </Dropdown>
      </#template>

      <#template slot="code">
        <#CodePreview>
        <Dropdown>
          <CheckboxMultiselect
            on_change="handle_game_selection_changed"
            value={{ @selected_game_ids }}
            options={{ @selectable_game_options }}
          />
        </Dropdown>
        </#CodePreview>
      </#template>

      <#template slot="state">
    @selected_game_ids = {inspect(@selected_game_ids)}
      </#template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4" show_state={true}>
      <#template slot="example">
        <Dropdown
          on_search_change="handle_search_changed"
          search_placeholder="Search for a name ..."
          search_name={:game_search}
        >
          <CheckboxMultiselect
            on_change="handle_game_selection_changed"
            class="max-h-32"
            value={@selected_game_ids}
            options={@selectable_filtered_game_options}
          />
        </Dropdown>
      </#template>

      <#template slot="code">
        <#CodePreview>
        <Dropdown
          on_search_change="handle_search_changed"
          search_placeholder="Search for a name ..."
          search_name={{ :game_search }}
        >
          <CheckboxMultiselect
            on_change="handle_game_selection_changed"
            class="max-h-32"
            value={{ @selected_game_ids }}
            options={{ @selectable_filtered_game_options }}
          />
        </Dropdown>
        </#CodePreview>
      </#template>

      <#template slot="state">
    @selected_game_ids = {inspect(@selected_game_ids)}
    @game_search = {inspect(@game_search)}
      </#template>
    </ExampleAndCode>

    <Heading size={24} class="mt-8">
      <a id="single-item-select">Using SingleItemSelect</a>
    </Heading>

    <ExampleAndCode class="mt-4" show_state={true}>
      <#template slot="example">
        <Dropdown>
          <SingeItemSelect
            on_change="handle_other_game_selected"
            value={@other_game_id}
            options={@selectable_game_options}
          />
        </Dropdown>
      </#template>

      <#template slot="code">
        <#CodePreview>
        <Dropdown>
          <SingeItemSelect
            on_change="handle_other_game_selected"
            value={{ @other_game_id }}
            options={{ @selectable_game_options }}
          />
        </Dropdown>
        </#CodePreview>
      </#template>

      <#template slot="state">
    @other_game_id = {inspect(@other_game_id)}
      </#template>
    </ExampleAndCode>

    <ExampleAndCode class="mt-4" show_state={true}>
      <#template slot="example">
        <Dropdown
          on_search_change="handle_search_changed"
          search_placeholder="Search for a name ..."
          search_name={:game_search}
        >
          <SingeItemSelect
            on_change="handle_other_game_selected"
            class="max-h-32"
            value={@other_game_id}
            options={@selectable_filtered_game_options}
          />
        </Dropdown>
      </#template>

      <#template slot="code">
        <#CodePreview>
        <Dropdown
          on_search_change="handle_search_changed"
          search_placeholder="Search for a name ..."
          search_name={{ :game_search }}
        >
          <SingeItemSelect
            on_change="handle_other_game_selected"
            class="max-h-32"
            value={{ @other_game_id }}
            options={{ @selectable_filtered_game_options }}
          />
        </Dropdown>
        </#CodePreview>
      </#template>

      <#template slot="state">
    @other_game_id = {inspect(@other_game_id)}
    @game_search = {inspect(@game_search)}
      </#template>
    </ExampleAndCode>

    """
  end

  def handle_event("handle_search_changed", %{"game_search" => %{"value" => value}}, socket) do
    {:noreply,
     assign(
       socket,
       game_search: %{value: value},
       selectable_filtered_game_options:
         get_fitered_game_options(value, socket.assigns.selectable_game_options)
     )}
  end

  def handle_event(
        "handle_game_selection_changed",
        %{"toggled_item_id" => toggled_item_id},
        socket
      ) do
    selected_game_ids = socket.assigns.selected_game_ids
    enabled = Enum.member?(selected_game_ids, toggled_item_id)

    new_ids =
      if enabled do
        Enum.filter(selected_game_ids, fn x -> x != toggled_item_id end)
      else
        selected_game_ids ++ [toggled_item_id]
      end

    {:noreply, assign(socket, selected_game_ids: new_ids)}
  end

  def handle_event(
        "handle_other_game_selected",
        %{"selected_item_id" => selected_item_id},
        socket
      ) do
    {:noreply, assign(socket, other_game_id: selected_item_id)}
  end

  def get_fitered_game_options(search_value, selectable_game_options) do
    Enum.filter(selectable_game_options, fn x ->
      String.contains?(String.downcase(x.label), String.downcase(search_value))
    end)
  end
end
