defmodule MoonWeb.Pages.Components.LabelPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Label
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias Moon.Icons.GenericInfo
  alias Moon.Icons.ControlsClose
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/badge",
        name: "Label"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'size',
        :type => 'xsmall | small | medium | large | xlarge',
        :required => 'false',
        :default => 'medium',
        :description => 'Size of Button'
      },
      %{
        :name => 'left_icon',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Asset name for the left icon'
      },
      %{
        :name => 'right_icon',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Asset name for the right icon'
      },
      %{
        :name => 'color',
        :type => 'string',
        :required => 'false',
        :default => 'gohan.100',
        :description => 'Asset name for the icon. Icon only and no text shown'
      },
      %{
        :name => 'background_color',
        :type => 'string',
        :required => 'false',
        :default => 'bulma.100',
        :description => 'Active state'
      },
      %{
        :name => 'is_uppercase',
        :type => 'boolean',
        :required => 'false',
        :default => 'true',
        :description => 'Letter case'
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown gap={4}>
        <Heading size={56} class="mb-4">Label</Heading>
        <p>
          Small count and labeling component.
        </p>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode title="Colours" id="label_1">
            <:example>
              <div class="flex justify-around w-full items-center">
                <Label color="gohan-100" background_color="piccolo-100">
                  Active
                </Label>
                <Label color="krillin-100" background_color="trunks-100">
                  Active
                </Label>
                <Label color="bulma-100" background_color="dodoria-100">
                  Active
                </Label>
              </div>
            </:example>

            <:code>{label_1_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Sizes" id="label_2">
            <:example>
              <div class="flex justify-around w-full items-center">
                <Label size="xsmall">
                  xsmall (default)
                </Label>
                <Label size="twoxsmall">
                  twoxsmall
                </Label>
              </div>
            </:example>

            <:code>{label_2_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Label with Icons" id="label_3">
            <:example>
              <TopToDown gap={8}>
                <div class="flex justify-around w-full items-center">
                  <Label size="twoxsmall">
                    <:left_icon><ControlsClose class="h-3 w-3" /></:left_icon>
                    Left Icon
                  </Label>
                  <Label size="twoxsmall">
                    Right Icon
                    <:right_icon><ControlsClose class="h-3 w-3" /></:right_icon>
                  </Label>
                  <Label size="twoxsmall">
                    Both Icons
                    <:left_icon><ControlsClose class="h-3 w-3" /></:left_icon>
                    <:right_icon><ControlsClose class="h-3 w-3" /></:right_icon>
                  </Label>
                </div>
                <div class="flex justify-around w-full items-center">
                  <Label>
                    <:left_icon><GenericInfo class="h-6 w-6" /></:left_icon>
                    Left Icon
                  </Label>
                  <Label>
                    Right Icon
                    <:right_icon><GenericInfo class="h-6 w-6" /></:right_icon>
                  </Label>
                  <Label>
                    Both Icons
                    <:left_icon><GenericInfo class="h-6 w-6" /></:left_icon>
                    <:right_icon><GenericInfo class="h-6 w-6" /></:right_icon>
                  </Label>
                </div>
              </TopToDown>
            </:example>

            <:code>{label_3_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Letter cases" id="label_4">
            <:example>
              <div class="flex justify-around w-full items-center">
                <Label>
                  Uppercase (default)
                </Label>
                <Label is_uppercase={false}>
                  Lowercase
                </Label>
              </div>
            </:example>

            <:code>{label_4_code()}</:code>
          </ExampleAndCode>
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-moon-20 font-normal my-4">Props</div>
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

  def label_1_code do
    """
      <Label color="gohan-100" background_color="piccolo-100">
        Active
      </Label>
      <Label color="krillin-100" background_color="trunks-100">
        Active
      </Label>
      <Label color="bulma-100" background_color="dodoria-100">
        Active
      </Label>
    """
  end

  def label_2_code do
    """
      <Label size="xsmall">
        xsmall (default)
      </Label>
      <Label size="twoxsmall">
        twoxsmall
      </Label>
    """
  end

  def label_3_code do
    """
      <div class="flex justify-around w-full items-center">
        <Label size="twoxsmall">
          <:left_icon><ControlsClose class="h-3 w-3" /></:left_icon>
          Left Icon
        </Label>
        <Label size="twoxsmall">
          Right Icon
          <:right_icon><ControlsClose class="h-3 w-3" /></:right_icon>
        </Label>
        <Label size="twoxsmall">
          Both Icons
          <:left_icon><ControlsClose class="h-3 w-3" /></:left_icon>
          <:right_icon><ControlsClose class="h-3 w-3" /></:right_icon>
        </Label>
      </div>
      <div class="flex justify-around w-full items-center">
        <Label>
          <:left_icon><GenericInfo class="h-6 w-6" /></:left_icon>
          Left Icon
        </Label>
        <Label>
          Right Icon
          <:right_icon><GenericInfo class="h-6 w-6" /></:right_icon>
        </Label>
        <Label>
          Both Icons
          <:left_icon><GenericInfo class="h-6 w-6" /></:left_icon>
          <:right_icon><GenericInfo class="h-6 w-6" /></:right_icon>
        </Label>
      </div>
    """
  end

  def label_4_code do
    """
      <Label>
        Uppercase (default)
      </Label>
      <Label is_uppercase={false}>
        Lowercase
      </Label>
    """
  end
end
