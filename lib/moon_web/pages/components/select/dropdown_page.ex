defmodule MoonWeb.Pages.Components.Select.DropdownPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Button
  alias Moon.Components.Checkbox
  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.FieldLabel
  alias Moon.Components.RadioButton
  alias Moon.Components.Select.Dropdown
  alias Moon.Components.Select.Dropdown.Footer
  alias Moon.Components.ListItems.SingleLineItem
  alias Moon.Components.Tabs
  alias Moon.Components.Tabs.TabLink
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias MoonWeb.Components.ComponentPageDescription

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/select/dropdown",
        name: "Multi Select"
      }
    ]

  data search_string, :string, default: ""

  def mount(params, _session, socket) do
    user_changeset = User.changeset(%User{})

    user_permissions = User.available_permissions()
    user_permissions_with_left_icon = User.available_permissions_with_left_icon()

    {:ok,
     assign(socket,
       user_changeset: user_changeset,
       radio_form_changeset: user_changeset,
       options: user_permissions,
       searched_options: user_permissions,
       options_with_left_icon: user_permissions_with_left_icon,
       searched_options_with_left_icon: user_permissions_with_left_icon,
       search_string: "",
       radio_options: user_permissions,
       theme_name: params["theme_name"] || "moon-design-light",
       tab_id: "1",
       active_page: __MODULE__,
       selected: []
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <ComponentPageDescription title="Dropdown">
        <p>Dropdown</p>
      </ComponentPageDescription>

      <ExampleAndCode title="Options" id="dropdown-options-example">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <FieldLabel>Permissions</FieldLabel>
              <Dropdown id="dropdown-options-example-user-permissions" options={@options} is_multi />
            </Field>
          </Form>
        </:example>
        <:code>{code_for_dropdown()}</:code>
        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="With icons" id="dropdown-icons-example">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <FieldLabel>Permissions</FieldLabel>
              <Dropdown id="dropdown-icons-example-user-permissions" is_multi options={@options}>
                {#for option <- @options}
                  <Dropdown.Option value={"#{option.value}"} :let={is_selected: is_selected}>
                    <SingleLineItem current={is_selected}>
                      <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                      {option.label}
                      <:right_icon><Moon.Icons.ControlsPlus /></:right_icon>
                    </SingleLineItem>
                  </Dropdown.Option>
                {/for}
              </Dropdown>
            </Field>
          </Form>
        </:example>
        <:code>{code_for_dropdown()}</:code>
        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="With search and footer (markup)" id="search_and_footer_markup">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <FieldLabel>Permissions</FieldLabel>
              <Dropdown
                id="random-id-38943"
                available_options={@options}
                options={@searched_options}
                on_search_change="update_search"
                search_string={@search_string}
                is_multi
              >
                {#for option <- @searched_options}
                  <Dropdown.Option value={"#{option.value}"} :let={is_selected: is_selected}>
                    <SingleLineItem current={is_selected}>
                      <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                      {option.label}
                      <:right_icon>
                        <Checkbox
                          id={"random-id-38943_#{option.value}"}
                          field={:user_permissions_options_checked}
                          checked={is_selected}
                        />
                      </:right_icon>
                    </SingleLineItem>
                  </Dropdown.Option>
                {/for}
                <:options_footer>
                  <Footer>
                    <:cancel>
                      <Button variant="secondary" size="small">Cancel</Button>
                    </:cancel>
                    <:clear>
                      <Button variant="ghost" size="small" on_click="clear_selections">Clear</Button>
                    </:clear>
                    <:confirm>
                      <Button variant="primary" size="small">Confirm</Button>
                    </:confirm>
                  </Footer>
                </:options_footer>
              </Dropdown>
            </Field>
          </Form>
        </:example>
        <:code>{code_for_dropdown_search_footer()}</:code>
        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
      </ExampleAndCode>

      <ExampleAndCode
        title="With search and footer (data + atom form)"
        id="with_search_and_footer_data_changeset"
      >
        <:example>
          <Form
            id="search_and_footer_data_dropdown-for"
            for={:selected_params}
            change="update_selected"
            submit="apply"
          >
            <Field name={:selected}>
              <Dropdown
                id="search_and_footer_data_dropdown-for-dropdown"
                available_options={@options_with_left_icon}
                options={@searched_options_with_left_icon}
                value={@selected}
                on_search_change="update_search"
                search_string={@search_string}
                with="checkbox"
                is_multi
              >
                <:options_footer>
                  <Footer>
                    <:cancel>
                      <Button variant="secondary" size="small">Cancel</Button>
                    </:cancel>
                    <:clear>
                      <Button variant="ghost" size="small" on_click="clear_selections">Clear</Button>
                    </:clear>
                    <:confirm>
                      <Button variant="primary" size="small">Confirm</Button>
                    </:confirm>
                  </Footer>
                </:options_footer>
              </Dropdown>
            </Field>
          </Form>
        </:example>
        <:code>{code_for_dropdown_search_footer()}</:code>
        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
      </ExampleAndCode>

      <ExampleAndCode
        title="With search and footer (data + changeset form)"
        id="with_search_and_footer_data_changeset"
      >
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <FieldLabel>Permissions</FieldLabel>
              <Dropdown
                id="search_and_footer_data_dropdown"
                available_options={@options_with_left_icon}
                options={@searched_options_with_left_icon}
                on_search_change="update_search"
                search_string={@search_string}
                with="checkbox"
                is_multi
              >
                <:options_footer>
                  <Footer>
                    <:cancel>
                      <Button variant="secondary" size="small">Cancel</Button>
                    </:cancel>
                    <:clear>
                      <Button variant="ghost" size="small" on_click="clear_selections">Clear</Button>
                    </:clear>
                    <:confirm>
                      <Button variant="primary" size="small">Confirm</Button>
                    </:confirm>
                  </Footer>
                </:options_footer>
              </Dropdown>
            </Field>
          </Form>
        </:example>
        <:code>{code_for_dropdown_search_footer()}</:code>
        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="With radio button" id="dropdown-radio-example">
        <:example>
          <Form for={@radio_form_changeset} change="form_radio_update" submit="form_submit">
            <Field name={:permissions}>
              <FieldLabel>Permissions</FieldLabel>
              <Dropdown id="dropdown-radio-example-user-permissions" options={@radio_options} is_multi>
                {#for option <- @radio_options}
                  <Dropdown.Option value={"#{option.value}"} :let={is_selected: is_selected}>
                    <SingleLineItem current={is_selected}>
                      <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                      {option.label}
                      <:right_icon>
                        <RadioButton field={:user_options_selected} value={option.value} checked={is_selected} />
                      </:right_icon>
                    </SingleLineItem>
                  </Dropdown.Option>
                {/for}
              </Dropdown>
            </Field>
          </Form>
        </:example>
        <:code>{code_for_dropdown_radio_button()}</:code>
        <:state>@radio_form_changeset = {inspect(@radio_form_changeset, pretty: true)}}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="With checkbox" id="dropdown-checkbox-example">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <FieldLabel>Permissions</FieldLabel>
              <Dropdown
                id="dropdown-checkbox-example-user-permissions"
                available_options={@options}
                options={@searched_options}
                is_multi
              >
                {#for option <- @searched_options}
                  <Dropdown.Option value={"#{option.value}"} :let={is_selected: is_selected}>
                    <SingleLineItem current={is_selected}>
                      <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                      {option.label}
                      <:right_icon>
                        <Checkbox
                          id={"user_permissions_#{option.value}"}
                          field={:user_permissions_options_checked}
                          checked={is_selected}
                        />
                      </:right_icon>
                    </SingleLineItem>
                  </Dropdown.Option>
                {/for}
              </Dropdown>
            </Field>
          </Form>
        </:example>
        <:code>{code_for_dropdown_checkbox()}</:code>
        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="With Tabs" id="dropdown-tabs-example">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <FieldLabel>Permissions</FieldLabel>
              <Dropdown id="dropdown-tabs-example-user-permissions" options={@options} is_multi>
                <:options_tabs>
                  <Tabs>
                    <TabLink active={@tab_id == "1"} on_click="clicked_tab" item_id="1">Link 1</TabLink>
                    <TabLink active={@tab_id == "2"} on_click="clicked_tab" item_id="2">Link 2</TabLink>
                    <TabLink active={@tab_id == "3"} on_click="clicked_tab" item_id="3">Link 3</TabLink>
                    <TabLink active={@tab_id == "4"} on_click="clicked_tab" item_id="4">Link 4</TabLink>
                  </Tabs>
                </:options_tabs>
              </Dropdown>
            </Field>
          </Form>
        </:example>
        <:code>{code_for_dropdown_tabs()}</:code>
        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
      </ExampleAndCode>
    </Page>
    """
  end

  def handle_event("update_selected", params, socket) do
    %{"selected_params" => selected_params} = params
    selected = selected_params["selected"] || []
    {:noreply, assign(socket, selected: selected)}
  end

  def handle_event(
        "form_update",
        params,
        socket
      ) do
    user_params = params["user"] || %{permissions: []}
    user_changeset = User.changeset(%User{}, user_params)

    {:noreply, assign(socket, user_changeset: user_changeset, latest_params: user_params)}
  end

  def handle_event(
        "form_submit",
        %{
          "user" => user_params
        },
        socket
      ) do
    user_changeset = User.changeset(%User{}, user_params)

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("form_radio_update", params, socket) do
    user_params = params["user"] || %{"permissions" => []}

    last_selected_options =
      if Map.has_key?(socket.assigns, :latest_params),
        do: socket.assigns.latest_params,
        else: %{"permissions" => []}

    radio_drop_down_values =
      MapSet.difference(
        MapSet.new(user_params["permissions"]),
        MapSet.new(last_selected_options["permissions"])
      )

    user_params = %{"permissions" => MapSet.to_list(radio_drop_down_values)}

    user_changeset = User.changeset(%User{}, user_params)

    {:noreply, assign(socket, radio_form_changeset: user_changeset, latest_params: user_params)}
  end

  def handle_event("clear_selections", _params, socket) do
    user_changeset = User.changeset(%User{}, %{"permissions" => []})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event(
        "update_search",
        %{"value" => search_string},
        socket
      ) do
    options = socket.assigns.options
    options_with_left_icon = socket.assigns.options_with_left_icon

    searched_options =
      options
      |> Enum.filter(&String.contains?(String.downcase(&1.label), String.downcase(search_string)))

    searched_options_with_left_icon =
      options_with_left_icon
      |> Enum.filter(&String.contains?(String.downcase(&1.label), String.downcase(search_string)))

    {:noreply,
     assign(socket,
       searched_options: searched_options,
       searched_options_with_left_icon: searched_options_with_left_icon,
       search_string: search_string
     )}
  end

  def handle_event("clicked_tab", %{"item_id" => tab_id}, socket) do
    {:noreply, assign(socket, tab_id: tab_id)}
  end

  def code_for_dropdown do
    """
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <FieldLabel>Permissions</FieldLabel>
        <Dropdown id="dropdown-options-example-user-permissions" options={User.available_permissions()} is_multi />
      </Field>
    </Form>
    """
  end

  def code_for_dropdown_search_footer do
    """
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <FieldLabel>Permissions</FieldLabel>
        <Dropdown
          id="random-id-38943"
          available_options={@options}
          options={@searched_options}
          on_search_change="update_search"
          search_string={@search_string}
          is_multi
        >
          {#for option <- @searched_options}
            <Dropdown.Option value={"\#{option.value}"} :let={is_selected: is_selected}>
              <SingleLineItem current={is_selected}>
                <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                {option.label}
                <:right_icon>
                  <Checkbox
                    id={"random-id-38943_\#{option.value}"}
                    field={:user_permissions_options_checked}
                    checked={is_selected}
                  />
                </:right_icon>
              </SingleLineItem>
            </Dropdown.Option>
          {/for}
          <:options_footer>
            <Footer>
              <:cancel>
                <Button variant="secondary" size="small">Cancel</Button>
              </:cancel>
              <:clear>
                <Button variant="ghost" size="small" on_click="clear_selections">Clear</Button>
              </:clear>
              <:confirm>
                <Button variant="primary" size="small">Confirm</Button>
              </:confirm>
            </Footer>
          </:options_footer>
        </Dropdown>
      </Field>
    </Form>
    """
  end

  def code_for_dropdown_radio_button do
    """
      <Form for={@user_changeset} change="form_update" submit="form_submit">
        <Field name={:permission}>
          <FieldLabel>Permissions</FieldLabel>
          <Dropdown
            id="dropdown-radio-example-user-permissions"
            options={@searchable_options}
         >
            <:option_filters>
              <TextInput field={:option_filter} type="search" keyup="apply_filter" />
            </:option_filters>
            {#for option <- @searchable_options}
              <Dropdown.Option value="option.value" :let={is_selected: is_selected}>
                <SingleLineItem current={is_selected}>
                  <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                  {option.label}
                  <:right_icon>
                    <RadioButton checked={is_selected} />
                  </:right_icon>
                </SingleLineItem>
              </Dropdown.Option>
            {/for}
          </Dropdown>
        </Field>
      </Form>
    """
  end

  def code_for_dropdown_checkbox do
    """
      <Form for={@user_changeset} change="form_update" submit="form_submit">
        <Field name={:permission}>
          <FieldLabel>Permissions</FieldLabel>
          <Dropdown
            id="dropdown-checkbox-example-user-permissions"
            options={@searchable_options}
            is_multi>
            {#for option <- @searchable_options}
              <Dropdown.Option value="option.value" :let={is_selected: is_selected}>
                <SingleLineItem current={is_selected}>
                  <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                  {option.label}
                  <:right_icon>
                    <Checkbox checked={is_selected}/>
                  </:right_icon>
                </SingleLineItem>
              </Dropdown.Option>
            {/for}
          </Dropdown>
        </Field>
      </Form>
    """
  end

  def code_for_dropdown_tabs do
    """
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permission}>
        <FieldLabel>Permissions</FieldLabel>
        <Dropdown
          id="dropdown-tabs-example-user-permissions"
          options={@options}>
          <:options_tabs>
            <Tabs>
              <TabLink active={@tab_id == "1"} on_click="clicked_tab" item_id="1">Link 1</TabLink>
              <TabLink active={@tab_id == "2"} on_click="clicked_tab" item_id="2">Link 2</TabLink>
              <TabLink active={@tab_id == "3"} on_click="clicked_tab" item_id="3">Link 3</TabLink>
              <TabLink active={@tab_id == "4"} on_click="clicked_tab" item_id="4">Link 4</TabLink>
            </Tabs>
          </:options_tabs>
        </Dropdown>
      </Field>
    </Form>
    """
  end
end
