defmodule MoonWeb.Pages.Components.DropdownPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Heading
  alias Moon.Components.CodePreview
  alias Moon.Components.Dropdown
  alias Moon.Components.Dropdown.Item
  alias Moon.Components.Dropdown.CheckboxItem
  alias Moon.Components.Link
  alias Moon.Components.Checkbox
  alias Moon.Components.TextInput

  data(item_id, :string, default: "1")

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <Heading size=32 class="mb-8">Dropdown</Heading>

    <p>
      Dropdowns showcase a list of options that allow users to make single or multiple selections. An option that’s been selected can represent a corresponding value in forms or be used to filter/sort content.
    </p>
    <p class="mt-4">
      <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Components?node-id=15965%3A14977">Figma design</Link>
    </p>
    <p class="mt-4">
      <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/dropdown_page.ex">Sourcecode of this page</Link>
    </p>

    <ExampleAndCode class="mt-4">
      <template slot="example">
        <Dropdown>
          <Item click="select" item_id="1">List item</Item>
          <Item click="select" item_id="2">List item</Item>
          <Item click="select" item_id="3">List item</Item>
          <Item click="select" item_id="4">List item</Item>
          <Item click="select" item_id="5">List item</Item>
        </Dropdown>
      </template>

      <template slot="code">
        <#CodePreview>
          <Dropdown>
            <Item click="select" item_id="1">List item</Item>
            <Item click="select" item_id="2">List item</Item>
            <Item click="select" item_id="3">List item</Item>
            <Item click="select" item_id="4">List item</Item>
            <Item click="select" item_id="5">List item</Item>
          </Dropdown>
        </#CodePreview>
      </template>
    </ExampleAndCode>

    <ExampleAndCode class="mt-4">
      <template slot="example">
        <Dropdown>
          <CheckboxItem click="select" item_id="1" checked={{ @item_id == "1" }}>List item</CheckboxItem>
          <CheckboxItem click="select" item_id="2" checked={{ @item_id == "2" }}>List item</CheckboxItem>
          <CheckboxItem click="select" item_id="3" checked={{ @item_id == "3" }}>List item</CheckboxItem>
          <CheckboxItem click="select" item_id="4" checked={{ @item_id == "4" }}>List item</CheckboxItem>
          <CheckboxItem click="select" item_id="5" checked={{ @item_id == "5" }}>List item</CheckboxItem>
        </Dropdown>
      </template>

      <template slot="code">
        <#CodePreview>
          <Dropdown>
            <CheckboxItem click="select" item_id="1" checked={{ @item_id == "1" }}>List item</CheckboxItem>
            <CheckboxItem click="select" item_id="2" checked={{ @item_id == "2" }}>List item</CheckboxItem>
            <CheckboxItem click="select" item_id="3" checked={{ @item_id == "3" }}>List item</CheckboxItem>
            <CheckboxItem click="select" item_id="4" checked={{ @item_id == "4" }}>List item</CheckboxItem>
            <CheckboxItem click="select" item_id="5" checked={{ @item_id == "5" }}>List item</CheckboxItem>
          </Dropdown>
        </#CodePreview>
      </template>
    </ExampleAndCode>
    """
  end

  def handle_event("select", %{"item_id" => item_id}, socket) do
    {:noreply, assign(socket, item_id: item_id)}
  end
end
