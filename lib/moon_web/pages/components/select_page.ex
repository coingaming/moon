defmodule MoonWeb.Pages.Components.SelectPage do
  use MoonWeb, :live_view
  alias Moon.Components.Select
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode

  data(gender_options, :any)

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    gender_options = [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]

    {:ok,
     assign(socket,
       gender_options: gender_options,
       theme_name: theme_name,
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Heading size={32}>Select</Heading>
      <p>
        <Link to="https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=574%3A8496">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/select_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/select">React implementation</Link>
      </p>
      <Heading size={24} class="mt-4" is_regular>Usage</Heading>
      <p>
        <Heading size={20} class="mt-4">Select</Heading>
        A user-controlled menu of options for forms, navigation and more.
      </p>

      <Heading size={16} class="mt-4">Example</Heading>
      <ExampleAndCode>
        <:example>
          <Select field={:gender} options={@gender_options} prompt="Please select gender" />
        </:example>

        <:code>
          <#CodePreview>
      <Select
        field={ :gender }
        options={ @gender_options }
        prompt="Please select gender"
      />
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={16} class="mt-4">With Label</Heading>
      <ExampleAndCode>
        <:example>
          <Select label="Gender" field={:gender} options={@gender_options} prompt="Please select gender" />
        </:example>

        <:code>
          <#CodePreview>
      <Select
        label="Gender"
        field={ :gender }
        options={ @gender_options }
        prompt="Please select gender"
      />
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={16} class="mt-4">Disabled</Heading>
      <ExampleAndCode>
        <:example>
          <Select
            disabled
            label="Gender"
            field={:gender}
            options={@gender_options}
            prompt="Please select gender"
          />
        </:example>

        <:code>
          <#CodePreview>
      <Select
        disabled={true}
        label="Gender"
        field={ :gender }
        options={ @gender_options }
        prompt="Please select gender"
      />
    </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
