defmodule MoonWeb.Pages.Components.LabelPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Label
  alias Moon.Icons.GenericInfo
  alias Moon.Icons.ControlsClose
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
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
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'size',
        :type => 'xs | sm | md | lg | xl',
        :required => 'No',
        :default => 'md',
        :description => 'Size of Button'
      },
      %{
        :name => 'left_icon',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Asset name for the left icon'
      },
      %{
        :name => 'right_icon',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Asset name for the right icon'
      },
      %{
        :name => 'color',
        :type => 'string',
        :required => 'No',
        :default => 'gohan.100',
        :description => 'Asset name for the icon. Icon only and no text shown'
      },
      %{
        :name => 'background_color',
        :type => 'string',
        :required => 'No',
        :default => 'bulma.100',
        :description => 'Active state'
      },
      %{
        :name => 'is_uppercase',
        :type => 'boolean',
        :required => 'No',
        :default => 'true',
        :description => 'Letter case'
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Label">
        <p>
          Use tags to label, categorize, or organize items using keywords that describe them.
        </p>
        <p>
          Multiple or single tags can be used to categorize items.
        </p>
        <p>
          Use short labels for easy scanning. Use two words only if necessary to describe the status and differentiate it from other tags.
        </p>
        <p>
          Default text style: Uppercase
        </p>
        <p>
          Border radius: Interactive
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Colours" id="label_1">
        <:example>
          <Label color="gohan" background_color="piccolo">
            Active
          </Label>
          <Label color="krillin" background_color="trunks">
            Active
          </Label>
          <Label color="bulma" background_color="dodoria">
            Active
          </Label>
        </:example>

        <:code>{label_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="label_2">
        <:example>
          <Label size="xsmall">
            xsmall (default)
          </Label>
          <Label size="twoxsmall">
            twoxsmall
          </Label>
        </:example>

        <:code>{label_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Label with Icons" id="label_3">
        <:example>
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
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
          <div class="flex flex-wrap items-center justify-around gap-2 w-full">
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
        </:example>

        <:code>{label_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Letter cases" id="label_4">
        <:example>
          <Label>
            Uppercase (default)
          </Label>
          <Label is_uppercase={false}>
            Lowercase
          </Label>
        </:example>

        <:code>{label_4_code()}</:code>
      </ExampleAndCode>

      <PropsTable title="Label props" data={@props_info_array} />
    </Page>
    """
  end

  def label_1_code do
    """
      <Label color="gohan" background_color="piccolo">
        Active
      </Label>
      <Label color="krillin" background_color="trunks">
        Active
      </Label>
      <Label color="bulma" background_color="dodoria">
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
      <div class="flex flex-wrap items-center justify-around gap-2 w-full">
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
      <div class="flex flex-wrap items-center justify-around gap-2 w-full">
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
