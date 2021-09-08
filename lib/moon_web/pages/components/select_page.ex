defmodule MoonWeb.Pages.Components.SelectPage do
  use MoonWeb, :live_view
  alias Moon.Components.Select
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.Components.Footer
  alias MoonWeb.Components.ThemesSelect

  data(gender_options, :any)

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/select",
        name: "Select"
      }
    ]

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

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={56} class="mb-4">Select</Heading>
      <p>
        <Link to="https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=574%3A8496">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/select_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/select">React implementation</Link>
      </p>
      <p>
        <Heading size={20} class="mt-4">Select</Heading>
        A user-controlled menu of options for forms, navigation and more.
      </p>

      <ExampleAndCode title="Example" id="select_1">
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

      <ExampleAndCode title="With Label" id="select_2">
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

      <ExampleAndCode title="Disabled" id="select_3">
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
      <Footer />
      <ThemesSelect id="themes_select" theme_name={@theme_name} active_page={@active_page} />
    </TopToDown>
    """
  end
end
