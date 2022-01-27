defmodule MoonWeb.Pages.Components.DropdownPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias Moon.Autolayouts.{LeftToRight, TopToDown}
  alias Moon.Components.CheckboxMultiselect
  alias Moon.Components.CodePreview
  alias Moon.Components.Dropdown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.SingeItemSelect
  alias Moon.Components.SingleSelect
  alias Moon.Icon
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/dropdown",
        name: "Dropdown"
      }
    ]

  @default_games_list [
    %{label: "Game 1", value: "1", icon: "media_headphones"},
    %{label: "Game 2", value: "2", icon: "media_megaphone"},
    %{label: "Game 3", value: "3", icon: "other_frame"},
    %{label: "Game 4", value: "4", icon: "other_frame"},
    %{label: "Game 5", value: "5", icon: "other_frame"},
    %{label: "Game 6", value: "6", icon: "other_frame"},
    %{label: "Game 7", value: "7", icon: "other_frame"},
    %{label: "Game 8", value: "8", icon: "other_frame"},
    %{label: "Game 9", value: "9", icon: "other_frame"},
    %{label: "Game 10", value: "10", icon: "other_frame"}
  ]

  data(item_id, :string, default: "1")
  data(selected_game_ids, :list, default: ["1", "2"])
  data(selectable_game_options, :list, default: @default_games_list)
  data(selected_single_icons_option, :any, default: nil)

  data(selected_single_default_option, :map,
    default: %{label: "Game 3", value: "3", icon: "other_frame"}
  )

  data(selected_single_game_option, :any, default: nil)
  data(selectable_filtered_game_options, :list, default: @default_games_list)
  data(game_search, :string, default: %{value: ""})
  data(other_game_id, :string, default: "1")

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Dropdown</Heading>

        <p>
          Dropdowns showcase a list of options that allow users to make single or multiple selections. An option that's been selected can represent a corresponding value in forms or be used to filter/sort content.
        </p>
        <p class="mt-4">
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Components?node-id=15965%3A14977">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/dropdown_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/filterDropdown">React implementation</Link>
        </p>

        <TopToDown gap="gap-0">
          <ExampleAndCode title="SingleSelect with default value, md size" id="single_select_default">
            <:example>
              <div class="w-96">
                <SingleSelect
                  id="single-select-default"
                  options={@selectable_game_options}
                  selected_option={@selected_single_default_option}
                  size="md"
                  on_select="select_single_default"
                />
              </div>
            </:example>

            <:code>
              <#CodePreview>
          <SingleSelect
            id="single-select-default"
            {=@options}
            {=@selected_option}
            size="md"
            on_select="select_option"
          />
              </#CodePreview>
            </:code>

            <:state>@options = {inspect(@selectable_game_options, pretty: true)}<br>@selected_option = {inspect(@selected_single_default_option)}</:state>
          </ExampleAndCode>

          <ExampleAndCode title="SingleSelect with placeholder and icons, lg size" id="single_select_icons">
            <:example>
              <div class="w-96">
                <SingleSelect
                  id="single-select-icons"
                  options={option <- @selectable_game_options}
                  selected_option={@selected_single_icons_option}
                  size="lg"
                  on_select="select_single_icons"
                >
                  <SingleSelect.Item>
                    <LeftToRight gap="gap-2" centered>
                      <Icon name={option.icon} class="w-6 h-6" color="trunks-100" />
                      {option.label}
                    </LeftToRight>
                  </SingleSelect.Item>
                </SingleSelect>
              </div>
            </:example>

            <:code>
              <#CodePreview>
          <SingleSelect
            id="single-select-icons"
            options={option <- @options}
            selected_option={@selected_option}
            size="lg"
            on_select="select_option"
          >
            <SingleSelect.Item>
              <LeftToRight gap="gap-2" centered>
                <Icon name={option.icon} class="w-6 h-6" color="trunks-100" />
                {option.label}
              </LeftToRight>
            </SingleSelect.Item>
          </SingleSelect>
              </#CodePreview>
            </:code>

            <:state>@selected_option = {inspect(@selected_single_icons_option)}</:state>
          </ExampleAndCode>
        </TopToDown>

        <ExampleAndCode title="Using CheckboxMultiselect" class="mt-4" id="dropdown_1">
          <:example>
            <Dropdown>
              <div class="p-1 overflow-y-scroll max-h-48">
                <CheckboxMultiselect
                  on_select="handle_game_selection_changed"
                  values={@selected_game_ids}
                  options={@selectable_game_options}
                />
              </div>
            </Dropdown>
          </:example>

          <:code>
            <#CodePreview>
              <Dropdown>
                <CheckboxMultiselect
                  on_select="handle_game_selection_changed"
                  values={ @selected_game_ids }
                  options={ @selectable_game_options }
                />
              </Dropdown>
            </#CodePreview>
          </:code>

          <:state>
            @selected_game_ids = {inspect(@selected_game_ids)}
          </:state>
        </ExampleAndCode>

        <ExampleAndCode class="mt-4" id="dropdown_2">
          <:example>
            <Dropdown
              on_search_change="handle_search_changed"
              search_placeholder="Search for a name ..."
              search_name={:game_search}
            >
              <div class="p-1 overflow-y-scroll max-h-48">
                <CheckboxMultiselect
                  on_select="handle_game_selection_changed"
                  values={@selected_game_ids}
                  options={@selectable_filtered_game_options}
                />
              </div>
            </Dropdown>
          </:example>

          <:code>
            <#CodePreview>
        <Dropdown
          on_search_change="handle_search_changed"
          search_placeholder="Search for a name ..."
          search_name={ :game_search }
        >
          <div class="p-1 overflow-y-scroll max-h-48 bg-gohan-100">
            <CheckboxMultiselect
              on_select="handle_game_selection_changed"
              values={ @selected_game_ids }
              options={ @selectable_filtered_game_ptions }}
            />
          </div>
        </Dropdown>
        </#CodePreview>
          </:code>

          <:state>
            @selected_game_ids = {inspect(@selected_game_ids)}
            @game_search = {inspect(@game_search)}
          </:state>
        </ExampleAndCode>

        <ExampleAndCode class="mt-4" id="dropdown_4">
          <:example>
            <Dropdown
              on_search_change="handle_search_changed"
              search_placeholder="Search for a name ..."
              search_name={:game_search}
            >
              <SingeItemSelect
                on_change="handle_other_game_selected"
                class="max-h-48"
                value={@other_game_id}
                options={@selectable_filtered_game_options}
              />
            </Dropdown>
          </:example>

          <:code>
            <#CodePreview>
        <Dropdown
          on_search_change="handle_search_changed"
          search_placeholder="Search for a name ..."
          search_name={ :game_search }
        >
          <SingeItemSelect
            on_select="handle_other_game_selected"
            class="max-h-48"
            values={ @other_game_id }}
            options={ @selectable_filtered_game_ptions }}
          />
        </Dropdown>
        </#CodePreview>
          </:code>

          <:state>
            @other_game_id = {inspect(@other_game_id)}
            @game_search = {inspect(@game_search)}
          </:state>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event("select_single_icons", %{"option_value" => value}, socket) do
    options = socket.assigns.selectable_game_options
    selected_option = Enum.find(options, &(&1.value == value))
    {:noreply, assign(socket, selected_single_icons_option: selected_option)}
  end

  def handle_event("select_single_default", %{"option_value" => value}, socket) do
    options = socket.assigns.selectable_game_options
    selected_option = Enum.find(options, &(&1.value == value))
    {:noreply, assign(socket, selected_single_default_option: selected_option)}
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
