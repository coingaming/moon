defmodule MoonWeb.Pages.Components.TextInput.TextInputPage2 do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Components.TextInput2
  alias Moon.Components.Heading
  alias Moon.Autolayouts.LeftToRight

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

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Text Input</Heading>

        <ExampleAndCode id="input_020" title="Sizes">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2 label="Medium (Default: md)" placeholder="Placeholder"/>
              <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder"/>
              <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder"/>
            </LeftToRight>
          </:example>

          <:code>{text_input_020_code()}</:code>
        </ExampleAndCode>

        <Heading size={32} class="mt-16 mb-4">Text Input Types</Heading>

        <ExampleAndCode id="input_010" title="Number">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2
                type="number"
                size="md"
                label="Medium (Default: md)"
                placeholder="e.g. 1234"
              />
              <TextInput2
                type="number"
                size="lg"
                label="Large (lg)"
                placeholder="e.g. 1234"
              />
              <TextInput2
                type="number"
                size="xl"
                label="Xlarge (xl)"
                placeholder="e.g. 1234"
              />
            </LeftToRight>
          </:example>

          <:code>{text_input_010_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_009" title="Date">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2
                type="date"
                size="md"
                label="Medium (Default: md)"
                placeholder="Placeholder"
              />
              <TextInput2
                type="date"
                size="lg"
                label="Large (lg)"
                placeholder="Placeholder"
              />
              <TextInput2
                type="date"
                size="xl"
                label="Xlarge (xl)"
                placeholder="Placeholder"
              />
            </LeftToRight>
          </:example>

          <:code>{text_input_009_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_008" title="Time">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2
                type="time"
                size="md"
                label="Medium (Default: md)"
                placeholder="Placeholder"
              />
              <TextInput2
                type="time"
                size="lg"
                label="Large (lg)"
                placeholder="Placeholder"
              />
              <TextInput2
                type="time"
                size="xl"
                label="Xlarge (xl)"
                placeholder="Placeholder"
              />
            </LeftToRight>
          </:example>

          <:code>{text_input_008_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_007" title="Date Time">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2
                type="datetime-local"
                size="md"
                label="Medium (Default: md)"
                placeholder="Placeholder"
              />
              <TextInput2
                type="datetime-local"
                size="lg"
                label="Large (lg)"
                placeholder="Placeholder"
              />
              <TextInput2
                type="datetime-local"
                size="xl"
                label="Xlarge (xl)"
                placeholder="Placeholder"
              />
            </LeftToRight>
          </:example>

          <:code>{text_input_007_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_006" title="Email">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2
                type="email"
                size="md"
                label="Medium (Default: md)"
                placeholder="e.g. jake.weary@sportsbet.io"
              />
              <TextInput2
                type="email"
                size="lg"
                label="Large (lg)"
                placeholder="e.g. jake.weary@sportsbet.io"
              />
              <TextInput2
                type="email"
                size="xl"
                label="Xlarge (xl)"
                placeholder="e.g. jake.weary@sportsbet.io"
              />
            </LeftToRight>
          </:example>

          <:code>{text_input_006_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_005" title="Password TODO">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              TODO
            </LeftToRight>
          </:example>

          <:code>{text_input_006_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_004" title="Search">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2
                type="email"
                size="md"
                label="Medium (Default: md)"
                placeholder="e.g. jake.weary@sportsbet.io"
              />
              <TextInput2
                type="email"
                size="lg"
                label="Large (lg)"
                placeholder="e.g. jake.weary@sportsbet.io"
              />
              <TextInput2
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

        <ExampleAndCode id="input_10" title="Hint Text">
          <:example>
            <TextInput2>
              <:hint_text_slot>Informative message holder</:hint_text_slot>
            </TextInput2>
          </:example>

          <:code>{text_input_10_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_20" title="Disabled">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2 label="Medium (Default: md)" placeholder="Placeholder" disabled/>
              <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder" disabled/>
              <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder" disabled/>
            </LeftToRight>
          </:example>

          <:code>{text_input_20_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_30" title="Error">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2 label="Medium (Default: md)" placeholder="Placeholder" is_error/>
              <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder" is_error/>
              <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder" is_error/>
            </LeftToRight>
          </:example>

          <:code>{text_input_30_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_40" title="Readonly">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2 label="Medium (Default: md)" value="Read only text" placeholder="Placeholder" readonly/>
              <TextInput2 size="lg" label="Large (lg)" value="Read only text" placeholder="Placeholder" readonly/>
              <TextInput2 size="xl" label="Xlarge (xl)" value="Read only text" placeholder="Placeholder" readonly/>
            </LeftToRight>
          </:example>

          <:code>{text_input_40_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_50" title="Size RTL">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2 label="Medium (Default: md)" placeholder="Placeholder" dir="rtl"/>
              <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder" dir="rtl"/>
              <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder" dir="rtl"/>
            </LeftToRight>
          </:example>

          <:code>{text_input_50_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode id="input_60" title="Without label">
          <:example>
            <LeftToRight class="justify-between w-full items-end">
              <TextInput2 label="Medium (Default: md)" placeholder="Placeholder" dir="rtl"/>
              <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder" dir="rtl"/>
              <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder" dir="rtl"/>
            </LeftToRight>
          </:example>

          <:code>{text_input_60_code()}</:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def text_input_020_code do
    """
    <TextInput2 label="Medium (Default: md)" />
    <TextInput2 size="lg" label="Large (lg)" />
    <TextInput2 size="xl" label="Xlarge (xl)" />
    """
  end

  def text_input_010_code do
    """
    <TextInput2
      type="number"
      size="md"
      label="Medium (Default: md)"
      placeholder="e.g. 1234"
    />
    <TextInput2
      type="number"
      size="lg"
      label="Large (lg)"
      placeholder="e.g. 1234"
    />
    <TextInput2
      type="number"
      size="xl"
      label="Xlarge (xl)"
      placeholder="e.g. 1234"
    />
    """
  end

  def text_input_009_code do
    """
    <TextInput2
      type="date"
      size="md"
      label="Medium (Default: md)"
      placeholder="Placeholder"
    />
    <TextInput2
      type="date"
      size="lg"
      label="Large (lg)"
      placeholder="Placeholder"
    />
    <TextInput2
      type="date"
      size="xl"
      label="Xlarge (xl)"
      placeholder="Placeholder"
    />
    """
  end

  def text_input_008_code do
    """
    <TextInput2
      type="time"
      size="md"
      label="Medium (Default: md)"
      placeholder="Placeholder"
    />
    <TextInput2
      type="time"
      size="lg"
      label="Large (lg)"
      placeholder="Placeholder"
    />
    <TextInput2
      type="time"
      size="xl"
      label="Xlarge (xl)"
      placeholder="Placeholder"
    />
    """
  end

  def text_input_007_code do
    """
    <TextInput2
      type="datetime-local"
      size="md"
      label="Medium (Default: md)"
      placeholder="Placeholder"
    />
    <TextInput2
      type="datetime-local"
      size="lg"
      label="Large (lg)"
      placeholder="Placeholder"
    />
    <TextInput2
      type="datetime-local"
      size="xl"
      label="Xlarge (xl)"
      placeholder="Placeholder"
    />
    """
  end

  def text_input_006_code do
    """
    <TextInput2
      type="email"
      size="md"
      label="Medium (Default: md)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    <TextInput2
      type="email"
      size="lg"
      label="Large (lg)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    <TextInput2
      type="email"
      size="xl"
      label="Xlarge (xl)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    """
  end

  def text_input_005_code do
    """
    """
  end

  def text_input_004_code do
    """
    <TextInput2
      type="email"
      size="md"
      label="Medium (Default: md)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    <TextInput2
      type="email"
      size="lg"
      label="Large (lg)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    <TextInput2
      type="email"
      size="xl"
      label="Xlarge (xl)"
      placeholder="e.g. jake.weary@sportsbet.io"
    />
    """
  end

  def text_input_10_code do
    """
    <TextInput2>
      <:hint_text_slot>Informative message holder</:hint_text_slot>
    </TextInput2>
    """
  end

  def text_input_20_code do
    """
    <TextInput2 label="Medium (Default: md)" placeholder="Placeholder" disabled/>
    <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder" disabled/>
    <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder" disabled/>
    """
  end

  def text_input_30_code do
    """
    <TextInput2 label="Medium (Default: md)" placeholder="Placeholder" is_error/>
    <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder" is_error/>
    <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder" is_error/>
    """
  end

  def text_input_40_code do
    """
    <TextInput2 label="Medium (Default: md)" placeholder="Placeholder" readonly/>
    <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder" readonly/>
    <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder" readonly/>
    """
  end

  def text_input_50_code do
    """
    <TextInput2 label="Medium (Default: md)" placeholder="Placeholder" dir="rtl"/>
    <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder" dir="rtl"/>
    <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder" dir="rtl"/>
    """
  end

  def text_input_60_code do
    """
    <TextInput2 label="Medium (Default: md)" placeholder="Placeholder" dir="rtl"/>
    <TextInput2 size="lg" label="Large (lg)" placeholder="Placeholder" dir="rtl"/>
    <TextInput2 size="xl" label="Xlarge (xl)" placeholder="Placeholder" dir="rtl"/>
    """
  end
end
