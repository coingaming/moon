defmodule MoonWeb.Pages.Design.Form.TextareaPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Form.Textarea
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "#",
        name: "Form"
      },
      %{
        to: "/components/v2/form/textarea",
        name: "Textarea"
      }
    ]
  )

  data(textarea_props, :list,
    default: [
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'Additional classes for textarea tag'
      },
      %{
        :name => 'attrs',
        :type => 'map',
        :required => 'No',
        :default => '%{}',
        :description => 'Additional attributes for textarea tag'
      },
      %{
        :name => 'disabled',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Disabling textarea'
      },
      %{
        :name => 'placeholder',
        :type => 'string',
        :required => 'No',
        :default => '',
        :description => 'Placeholder for the textarea'
      }
    ]
  )

  data(addon_props, :list, default: [])

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Textarea"
        image="/moon/assets/images/facing/components/textarea.png"
      >
        <p>
          A form control for editing multi-line text.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="loader_1">
        <:example>
          <Textarea />
        </:example>

        <:code>{loader_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Disabled" id="loader_2">
        <:example>
          <Textarea disabled placeholder="Disabled" />
        </:example>

        <:code>{loader_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Colours" id="loader_3">
        <:example>
          <div class="flex flex-wrap md:flex-nowrap items-center justify-around gap-2 w-full">
            <Textarea placeholder="Custom text colours" class="text-krillin placeholder:text-whis" rows={1} />
            <Textarea
              placeholder="Custom border colours"
              class="outline-chichi hover:outline-piccolo focus:outline-krillin"
              rows={1}
            />
            <Textarea placeholder="Custom background colour" class="bg-roshi-10" rows={1} />
          </div>
          <div class="flex flex-wrap md:flex-nowrap items-center justify-around gap-2 w-full">
            <Textarea placeholder="Resize vertically" class="resize-y" rows={3} />
            <Textarea placeholder="Resize horizontally" class="resize-x" rows={3} />
            <Textarea placeholder="Resize vertically and horizontally" class="resize" rows={3} />
          </div>
        </:example>

        <:code>{loader_3_code()}</:code>
      </ExampleAndCode>

      <PropsTable title="Textarea props" data={@textarea_props} />
    </Page>
    """
  end

  def loader_1_code do
    """
    <Textarea />
    """
  end

  def loader_2_code do
    """
    <Textarea disabled placeholder="Disabled" />
    """
  end

  def loader_3_code do
    """
    <div class="flex flex-wrap md:flex-nowrap items-center justify-around gap-2 w-full">
      <Textarea
        placeholder="Custom text colours"
        class="text-krillin placeholder:text-whis"
        rows={1}
      />
      <Textarea
        placeholder="Custom border colours"
        class="outline-chichi hover:outline-piccolo focus:outline-krillin"
        rows={1}
      />
      <Textarea
        placeholder="Custom background colour"
        class="bg-roshi-10"
        rows={1}
      />
    </div>
    <div class="flex flex-wrap md:flex-nowrap items-center justify-around gap-2 w-full">
      <Textarea placeholder="Resize vertically" class="resize-y" rows={3} />
      <Textarea
        placeholder="Resize horizontally"
        class="resize-x"
        rows={3}
      />
      <Textarea
        placeholder="Resize vertically and horizontally"
        class="resize"
        rows={3}
      />
    </div>
    """
  end
end
