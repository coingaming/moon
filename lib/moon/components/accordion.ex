defmodule Moon.Components.Accordion do
  @moduledoc false

  use Moon.StatelessComponent
  alias Phoenix.LiveView.JS
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.PullAside
  alias Moon.Components.Heading
  alias Moon.Icons.ControlsChevronUp

  prop id, :string
  prop class, :css_class
  prop open_by_default, :boolean, default: false
  slot title
  slot header_controls
  slot content

  def render(assigns) do
    ~F"""
    <div id={@id} class={"bg-gohan-100 p-4 mb-2 rounded-xl relative", @class}>
      <PullAside class="py-4 px-6">
        <:left>
          <div :on-click={toggle_content(@id)}>
            <Heading class="cursor-pointer"><#slot name="title" /></Heading>
          </div>
        </:left>
        <:right>
          <LeftToRight>
            <#slot name="header_controls" />
            <div :on-click={toggle_content(@id)}>
              <ControlsChevronUp font_size="1.25rem" class="text-piccolo-100 cursor-pointer" />
            </div>
          </LeftToRight>
        </:right>
      </PullAside>
      <div id={@id <> "-content"} class={hidden: !@open_by_default}>
        <#slot name="content" />
      </div>
    </div>
    """
  end

  def toggle_content(id) do
    JS.toggle(to: "#" <> id <> "-content")
  end
end
