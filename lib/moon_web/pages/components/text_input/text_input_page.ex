defmodule MoonWeb.Pages.Components.TextInputPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Components.TextInput
  alias Moon.Components.Heading
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Form
  alias Moon.Components.Button
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Components.Field
  alias Moon.Components.ErrorTag
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/text_input",
        name: "Text Input"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'type',
        :type =>
          'date | datetime-local | email | number | password | search | tel | text | url | time | url',
        :required => 'false',
        :default => 'text',
        :description => 'Different types of input'
      },
      %{
        :name => 'size',
        :type => 'medium | large | xlarge',
        :required => '-',
        :default => 'medium',
        :description => 'Size variant (currently only medium | large, with large as default)'
      },
      %{
        :name => 'label',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'Required for medium size only'
      },
      %{
        :name => 'placeholder',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Placeholder for input'
      },
      %{
        :name => 'field',
        :type => 'atom',
        :required => 'true',
        :default => '-',
        :description => 'Field value for underlying pheonix text input component'
      },
      %{
        :name => 'hint_text',
        :type => 'slot',
        :required => 'false',
        :default => '-',
        :description => 'Informative or error message under input'
      },
      %{
        :name => 'error',
        :type => 'boolean',
        :required => 'false',
        :default => '-',
        :description => 'Set error state for input'
      },
      %{
        :name => 'show_password_text',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'Only for input type password. Text for toggle button: show/hide password'
      },
      %{
        :name => 'background_color',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Background color'
      },
      %{
        :name => 'id',
        :type => 'string',
        :required => 'false | required (for password type)',
        :default => '-',
        :description => 'Unique id'
      },
      %{
        :name => 'use_error_tag',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description =>
          'Whether to use ErrorTag in place of the Hint text to show error messages. Requires the component to be inside Form and Field components'
      }
    ]

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Text Input</Heading>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode id="input_020" title="Sizes">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput label="Medium (Default: md)" placeholder="Placeholder" />
                <TextInput size="lg" label="Large (lg)" placeholder="Placeholder" />
                <TextInput size="xl" label="Xlarge (xl)" placeholder="Placeholder" />
              </LeftToRight>
            </:example>

            <:code>{text_input_020_code()}</:code>
          </ExampleAndCode>

          <Heading size={32} class="mt-16 mb-4">Text Input Types</Heading>

          <ExampleAndCode id="input_010" title="Number">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput type="number" size="md" label="Medium (Default: md)" placeholder="e.g. 1234" />
                <TextInput type="number" size="lg" label="Large (lg)" placeholder="e.g. 1234" />
                <TextInput type="number" size="xl" label="Xlarge (xl)" placeholder="e.g. 1234" />
              </LeftToRight>
            </:example>

            <:code>{text_input_010_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_009" title="Date">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput type="date" size="md" label="Medium (Default: md)" placeholder="Placeholder" />
                <TextInput type="date" size="lg" label="Large (lg)" placeholder="Placeholder" />
                <TextInput type="date" size="xl" label="Xlarge (xl)" placeholder="Placeholder" />
              </LeftToRight>
            </:example>

            <:code>{text_input_009_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_008" title="Time">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput type="time" size="md" label="Medium (Default: md)" placeholder="Placeholder" />
                <TextInput type="time" size="lg" label="Large (lg)" placeholder="Placeholder" />
                <TextInput type="time" size="xl" label="Xlarge (xl)" placeholder="Placeholder" />
              </LeftToRight>
            </:example>

            <:code>{text_input_008_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_007" title="Date Time">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput
                  type="datetime-local"
                  size="md"
                  label="Medium (Default: md)"
                  placeholder="Placeholder"
                />
                <TextInput type="datetime-local" size="lg" label="Large (lg)" placeholder="Placeholder" />
                <TextInput type="datetime-local" size="xl" label="Xlarge (xl)" placeholder="Placeholder" />
              </LeftToRight>
            </:example>

            <:code>{text_input_007_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_006" title="Email">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput
                  type="email"
                  size="md"
                  label="Medium (Default: md)"
                  placeholder="e.g. jake.weary@sportsbet.io"
                />
                <TextInput type="email" size="lg" label="Large (lg)" placeholder="e.g. jake.weary@sportsbet.io" />
                <TextInput
                  type="email"
                  size="xl"
                  label="Xlarge (xl)"
                  placeholder="e.g. jake.weary@sportsbet.io"
                />
              </LeftToRight>
            </:example>

            <:code>{text_input_006_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_005" title="Password">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput
                  id="txt_password_1"
                  type="password"
                  size="md"
                  label="Medium (Default: md)"
                  placeholder="Password"
                />
                <TextInput
                  id="txt_password_2"
                  type="password"
                  size="lg"
                  label="Large (lg)"
                  placeholder="Password"
                />
                <TextInput
                  id="txt_password_3"
                  type="password"
                  size="xl"
                  label="Xlarge (xl)"
                  placeholder="Password"
                />
              </LeftToRight>
            </:example>

            <:code>{text_input_005_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_004" title="Search">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput
                  type="email"
                  size="md"
                  label="Medium (Default: md)"
                  placeholder="e.g. jake.weary@sportsbet.io"
                />
                <TextInput type="email" size="lg" label="Large (lg)" placeholder="e.g. jake.weary@sportsbet.io" />
                <TextInput
                  type="email"
                  size="xl"
                  label="Xlarge (xl)"
                  placeholder="e.g. jake.weary@sportsbet.io"
                />
              </LeftToRight>
            </:example>

            <:code>{text_input_004_code()}</:code>
          </ExampleAndCode>

          <Heading size={32} class="mt-16 mb-4">Text input attributes</Heading>

          <ExampleAndCode id="input_20" title="Disabled">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput label="Medium (Default: md)" placeholder="Placeholder" disabled />
                <TextInput size="lg" label="Large (lg)" placeholder="Placeholder" disabled />
                <TextInput size="xl" label="Xlarge (xl)" placeholder="Placeholder" disabled />
              </LeftToRight>
            </:example>

            <:code>{text_input_20_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_30" title="Error">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput label="Medium (Default: md)" placeholder="Placeholder" is_error>
                  <:hint_text_slot>Informative message holder</:hint_text_slot>
                </TextInput>
                <TextInput size="lg" label="Large (lg)" placeholder="Placeholder" is_error>
                  <:hint_text_slot>Informative message holder</:hint_text_slot>
                </TextInput>
                <TextInput size="xl" label="Xlarge (xl)" placeholder="Placeholder" is_error>
                  <:hint_text_slot>Informative message holder</:hint_text_slot>
                </TextInput>
              </LeftToRight>
            </:example>

            <:code>{text_input_30_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_40" title="Readonly">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput
                  label="Medium (Default: md)"
                  value="Read only text"
                  placeholder="Placeholder"
                  readonly
                />
                <TextInput
                  size="lg"
                  label="Large (lg)"
                  value="Read only text"
                  placeholder="Placeholder"
                  readonly
                />
                <TextInput
                  size="xl"
                  label="Xlarge (xl)"
                  value="Read only text"
                  placeholder="Placeholder"
                  readonly
                />
              </LeftToRight>
            </:example>

            <:code>{text_input_40_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_50" title="Size RTL">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput label="Medium (Default: md)" placeholder="Placeholder" dir="rtl" />
                <TextInput size="lg" label="Large (lg)" placeholder="Placeholder" dir="rtl" />
                <TextInput size="xl" label="Xlarge (xl)" placeholder="Placeholder" dir="rtl" />
              </LeftToRight>
            </:example>

            <:code>{text_input_50_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_60" title="Without label">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput placeholder="Placeholder" dir="rtl" />
                <TextInput size="lg" placeholder="Placeholder" dir="rtl" />
                <TextInput size="xl" placeholder="Placeholder" dir="rtl" />
              </LeftToRight>
            </:example>

            <:code>{text_input_60_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_70" title="Hint Text">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput placeholder="Placeholder" label="Medium (Default: md)">
                  <:hint_text_slot>Informative message holder</:hint_text_slot>
                </TextInput>
                <TextInput size="lg" placeholder="Placeholder" label="Large (lg)">
                  <:hint_text_slot>Informative message holder</:hint_text_slot>
                </TextInput>
                <TextInput size="xl" placeholder="Placeholder" label="XLarge (xl)">
                  <:hint_text_slot>Informative message holder</:hint_text_slot>
                </TextInput>
              </LeftToRight>
            </:example>

            <:code>{text_input_70_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_80" title="Input with background color">
            <:example>
              <LeftToRight class="justify-between w-full items-end">
                <TextInput placeholder="Placeholder" label="Medium (Default: md)" background_color="goku-100">
                  <:hint_text_slot>Informative message holder</:hint_text_slot>
                </TextInput>
                <TextInput size="lg" placeholder="Placeholder" label="Large (lg)" background_color="goku-100">
                  <:hint_text_slot>Informative message holder</:hint_text_slot>
                </TextInput>
                <TextInput size="xl" placeholder="Placeholder" label="XLarge (xl)" background_color="goku-100">
                  <:hint_text_slot>Informative message holder</:hint_text_slot>
                </TextInput>
              </LeftToRight>
            </:example>

            <:code>{text_input_70_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode id="input_90" title="Form example">
            <:example>
              <Form
                for={@user_changeset}
                change="register_form_update"
                submit="register_form_submit"
                autocomplete="off"
              >
                <TopToDown>
                  <Field name={:username}>
                    <TextInput label="Username" placeholder="Username" />
                    <ErrorTag />
                  </Field>
                  <Field name={:email}>
                    <TextInput
                      label="Email"
                      placeholder="Email"
                      type="email"
                      disabled={!get_has_valid_username(@user_changeset)}
                    />
                    <ErrorTag />
                  </Field>
                  <Field name={:password}>
                    <TextInput id="password" label="Password" placeholder="Password" type="password" use_error_tag />
                  </Field>
                  <div class="pt-4">
                    <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
                  </div>
                </TopToDown>
              </Form>
            </:example>

            <:code>{text_input_90_code()}</:code>

            <:state>{text_input_90_state(assigns)}</:state>
          </ExampleAndCode>
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-moon-20 font-normal my-4">TabLink Props Tabs</div>
          <Table items={@props_info_array}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type" :let={item: item}>
              {item.type}
            </Column>
            <Column name="required" label="Required" :let={item: item}>
              {item.required}
            </Column>
            <Column name="default" label="Default" :let={item: item}>
              {item.default}
            </Column>
            <Column name="description" label="Description" :let={item: item}>
              {item.description}
            </Column>
          </Table>
        </div>
      </TopToDown>
    </Page>
    """
  end

  def text_input_020_code do
    """
    <TextInput label="Medium (Default: md)" />
    <TextInput size="lg" label="Large (lg)" />
    <TextInput size="xl" label="Xlarge (xl)" />
    """
  end

  def text_input_010_code do
    """
    <TextInput
      type="number"
      size="md"
      label="Medium (Default: md)"
      placeholder="e.g. 1234"
    />
    <TextInput
      type="number"
      size="lg"
      label="Large (lg)"
      placeholder="e.g. 1234"
    />
    <TextInput
      type="number"
      size="xl"
      label="Xlarge (xl)"
      placeholder="e.g. 1234"
    />
    """
  end

  def text_input_009_code do
    """
    <TextInput
      type="date"
      size="md"
      label="Medium (Default: md)"
      placeholder="Placeholder"
    />
    <TextInput
      type="date"
      size="lg"
      label="Large (lg)"
      placeholder="Placeholder"
    />
    <TextInput
      type="date"
      size="xl"
      label="Xlarge (xl)"
      placeholder="Placeholder"
    />
    """
  end

  def text_input_008_code do
    """
    <TextInput
      type="time"
      size="md"
      label="Medium (Default: md)"
      placeholder="Placeholder"
    />
    <TextInput
      type="time"
      size="lg"
      label="Large (lg)"
      placeholder="Placeholder"
    />
    <TextInput
      type="time"
      size="xl"
      label="Xlarge (xl)"
      placeholder="Placeholder"
    />
    """
  end

  def text_input_007_code do
    """
    <TextInput
      type="datetime-local"
      size="md"
      label="Medium (Default: md)"
      placeholder="Placeholder"
    />
    <TextInput
      type="datetime-local"
      size="lg"
      label="Large (lg)"
      placeholder="Placeholder"
    />
    <TextInput
      type="datetime-local"
      size="xl"
      label="Xlarge (xl)"
      placeholder="Placeholder"
    />
    """
  end

  def text_input_006_code do
    """
    <TextInput
      type="email"
      size="md"
      label="Medium (Default: md)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    <TextInput
      type="email"
      size="lg"
      label="Large (lg)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    <TextInput
      type="email"
      size="xl"
      label="Xlarge (xl)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    """
  end

  def text_input_005_code do
    """
    <TextInput
      id="txt_password_1"
      type="password"
      size="md"
      label="Medium (Default: md)"
      placeholder="Password"
    />
    <TextInput
      id="txt_password_2"
      type="password"
      size="lg"
      label="Large (lg)"
      placeholder="Password"
    />
    <TextInput
      id="txt_password_3"
      type="password"
      size="xl"
      label="Xlarge (xl)"
      placeholder="Password"
    />
    """
  end

  def text_input_004_code do
    """
    <TextInput
      type="email"
      size="md"
      label="Medium (Default: md)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    <TextInput
      type="email"
      size="lg"
      label="Large (lg)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    <TextInput
      type="email"
      size="xl"
      label="Xlarge (xl)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    """
  end

  def text_input_20_code do
    """
    <TextInput label="Medium (Default: md)" placeholder="Placeholder" disabled/>
    <TextInput size="lg" label="Large (lg)" placeholder="Placeholder" disabled/>
    <TextInput size="xl" label="Xlarge (xl)" placeholder="Placeholder" disabled/>
    """
  end

  def text_input_30_code do
    """
    <TextInput label="Medium (Default: md)" placeholder="Placeholder" is_error>
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput>
    <TextInput size="lg" label="Large (lg)" placeholder="Placeholder" is_error>
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput>
      <TextInput size="xl" label="Xlarge (xl)" placeholder="Placeholder" is_error>
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput>
    """
  end

  def text_input_40_code do
    """
    <TextInput label="Medium (Default: md)" placeholder="Placeholder" readonly/>
    <TextInput size="lg" label="Large (lg)" placeholder="Placeholder" readonly/>
    <TextInput size="xl" label="Xlarge (xl)" placeholder="Placeholder" readonly/>
    """
  end

  def text_input_50_code do
    """
    <TextInput label="Medium (Default: md)" placeholder="Placeholder" dir="rtl"/>
    <TextInput size="lg" label="Large (lg)" placeholder="Placeholder" dir="rtl"/>
    <TextInput size="xl" label="Xlarge (xl)" placeholder="Placeholder" dir="rtl"/>
    """
  end

  def text_input_60_code do
    """
    <TextInput (Default: md)" placeholder="Placeholder" dir="rtl"/>
    <TextInput size="lg" placeholder="Placeholder" dir="rtl"/>
    <TextInput size="xl" placeholder="Placeholder" dir="rtl"/>
    """
  end

  def text_input_70_code do
    """
    <TextInput placeholder="Placeholder" label="Medium (Default: md)">
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput>
    <TextInput size="lg" placeholder="Placeholder" label="Large (lg)">
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput>
    <TextInput size="xl" placeholder="Placeholder" label="XLarge (xl)">
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput>
    """
  end

  def text_input_80_code do
    """
    <TextInput placeholder="Placeholder" label="Medium (Default: md)" background_color="goku-100">
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput>
    <TextInput size="lg" placeholder="Placeholder" label="Large (lg)" background_color="goku-100">
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput>
    <TextInput size="xl" placeholder="Placeholder" label="XLarge (xl)" background_color="goku-100">
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput>
    """
  end

  def text_input_90_code do
    """
    <Form
      for={@user_changeset}
      change="register_form_update"
      submit="register_form_submit"
      autocomplete="off"
    >
      <TopToDown>
        <Field name={:username}>
          <TextInput label="Username" placeholder="Username" />
          <ErrorTag />
        </Field>
        <Field name={:email}>
          <TextInput
            label="Email"
            placeholder="Email"
            type="email"
            disabled={!get_has_valid_username(@user_changeset)}
          />
          <ErrorTag />
        </Field>
        <Field name={:password}>
          <TextInput id="password" label="Password" placeholder="Password" type="password" use_error_tag/>
        </Field>
        <div class="pt-4">
          <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
        </div>
      </TopToDown>
    </Form>
    """
  end

  def text_input_90_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    @user = {inspect(@user, pretty: true)}
    """
  end

  def mount(params, _session, socket) do
    user = %User{}
    user_changeset = User.changeset(user, %{})

    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__,
       user: user,
       user_changeset: user_changeset
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def get_has_valid_username(user_changeset) do
    !Keyword.has_key?(user_changeset.errors, :username)
  end

  def handle_event("register_form_update", params, socket) do
    user_changeset = User.changeset(socket.assigns.user, params["user"])

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("register_form_submit", params, socket) do
    user_changeset =
      User.changeset(socket.assigns.user, params["user"]) |> Map.merge(%{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end
end
