defmodule MoonWeb.Pages.Components.Select.DropdownPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.Checkbox
  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.Heading
  alias Moon.Components.FieldLabel
  alias Moon.Components.RadioButton
  alias Moon.Components.Select.Dropdown
  alias Moon.Components.Select.Dropdown.Footer
  alias Moon.Components.ListItems.SingleLineItem
  alias Moon.Components.Tabs
  alias Moon.Components.Tabs.TabLink
  alias Moon.Components.Deprecated.TextInput
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

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

  def mount(params, _session, socket) do
    user_changeset = User.changeset(%User{})

    user_permissions = User.available_permissions()

    {:ok,
     assign(socket,
       user_changeset: user_changeset,
       radio_form_changeset: user_changeset,
       options: user_permissions,
       searchable_options: user_permissions,
       radio_options: user_permissions,
       theme_name: params["theme_name"] || "moon-design-light",
       tab_id: "1",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Dropdown</Heading>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode title="Dropdown options" id="dropdown-options-example">
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

          <ExampleAndCode title="Dropdown with icons" id="dropdown-icons-example">
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

          <ExampleAndCode title="Dropdown with search" id="dropdown-search-example">
            <:example>
              <Form for={@user_changeset} change="form_update" submit="form_submit">
                <Field name={:permissions}>
                  <FieldLabel>Permissions</FieldLabel>
                  <Dropdown id="dropdown-search-example-user-permissions" is_multi options={@searchable_options}>
                    <:option_filters>
                      <TextInput field={:option_filter} type="search" keyup="apply_filter" />
                    </:option_filters>
                    {#for option <- @searchable_options}
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
            <:code>{code_for_dropdown_search()}</:code>
            <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
          </ExampleAndCode>

          <ExampleAndCode title="Dropdown with search and footer" id="dropdown-search-footer-example">
            <:example>
              <Form for={@user_changeset} change="form_update" submit="form_submit">
                <Field name={:permissions}>
                  <FieldLabel>Permissions</FieldLabel>
                  <Dropdown
                    id="dropdown-search-footer-example-user-permissions"
                    options={@searchable_options}
                    is_multi
                  >
                    <:option_filters>
                      <TextInput field={:option_filter} type="search" keyup="apply_filter" />
                    </:option_filters>
                    {#for option <- @searchable_options}
                      <Dropdown.Option value={"#{option.value}"} :let={is_selected: is_selected}>
                        <SingleLineItem current={is_selected}>
                          <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                          {option.label}
                          <:right_icon><Moon.Icons.ControlsPlus /></:right_icon>
                        </SingleLineItem>
                      </Dropdown.Option>
                    {/for}
                    <:options_footer>
                      <Footer>
                        <:cancel>
                          <Button variant="fill" size="small">Cancel</Button>
                        </:cancel>
                        <:clear>
                          <Button variant="fill" size="small" on_click="clear_selections">Clear</Button>
                        </:clear>
                        <:confirm>
                          <Button variant="fill" size="small">Confirm</Button>
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

          <ExampleAndCode title="Dropdown with radio button" id="dropdown-radio-example">
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

          <ExampleAndCode title="Dropdown with checkbox" id="dropdown-checkbox-example">
            <:example>
              <Form for={@user_changeset} change="form_update" submit="form_submit">
                <Field name={:permissions}>
                  <FieldLabel>Permissions</FieldLabel>
                  <Dropdown id="dropdown-checkbox-example-user-permissions" options={@searchable_options} is_multi>
                    {#for option <- @searchable_options}
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

          <ExampleAndCode title="Dropdown with Tabs" id="dropdown-tabs-example">
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
        </Context>
      </TopToDown>
    </Page>
    """
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
        "apply_filter",
        %{
          "value" => value
        },
        socket
      ) do
    options = socket.assigns.options

    filtered_options =
      options
      |> Enum.filter(&String.contains?(String.downcase(&1.label), value))
      |> case do
        [] ->
          options

        filters ->
          filters
      end

    filtered_options = if value === "", do: options, else: filtered_options

    {:noreply, assign(socket, searchable_options: filtered_options)}
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

  def code_for_dropdown_search do
    """
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permission}>
        <FieldLabel>Permissions</FieldLabel>
        <Dropdown
          id="dropdown-search-example-user-permissions"
          options={@searchable_options}
          is_multi>
          <:option_filters>
            <TextInput field={:option_filter} type="search" keyup="apply_filter" />
          </:option_filters>
          {#for option <- @searchable_options}
            <Dropdown.Option value={"option.value"} :let={is_selected: is_selected}>
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


    NOTE:
      `<TextInput field={:option_filter} type="search" keyup="apply_filter" />`
      1. field={:option_filter} field attribute with field name should be added.
      2. keyup="apply_filter" an Options filter event should be applied to handle the Dropdown options search.

      For example: in the above Dropdown with search we do have an TextInput with keyup="apply_filter" event.

      ```
      def handle_event("apply_filter", params, socket) do
        ## Logic to filter Options ans assign to socket
        {:noreply, assign(socket)}
      end
      ```
    """
  end

  def code_for_dropdown_search_footer do
    """
      <Form for={@user_changeset} change="form_update" submit="form_submit">
        <Field name={:permission}>
          <FieldLabel>Permissions</FieldLabel>
          <Dropdown
            id="dropdown-search-footer-example-user-permissions"
            options={@searchable_options}
            is_multi>
            <:option_filters>
              <TextInput field={:option_filter} type="search" keyup="apply_filter" />
            </:option_filters>
            {#for option <- @searchable_options}
              <Dropdown.Option value="option.value" :let={is_selected: is_selected}>
                <SingleLineItem current={is_selected}>
                  <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                  {option.label}
                  <:right_icon><Moon.Icons.ControlsPlus /></:right_icon>
                </SingleLineItem>
              </Dropdown.Option>
            {/for}
            <:options_footer>
              <Footer>
                <:cancel>
                  <Button variant="fill" size="small">Cancel</Button>
                </:cancel>
                <:clear>
                  <Button variant="fill" size="small">Clear</Button>
                </:clear>
                <:confirm>
                  <Button variant="fill" size="small">Confirm</Button>
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
