# https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=23452%3A7
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
  prop is_content_inside, :boolean, default: true
  prop with_button, :boolean, default: true
  prop disable_open, :boolean, default: false
  slot title
  slot header_controls
  slot content

  def render(assigns) do
    ~F"""
    <div id={@id}>
      <div class={
        "rounded relative bg-gohan-100",
        @class
      }>
      <PullAside class="p-4" left_grow>
        <:left>
          <div :on-click={toggle_content(@id, @disable_open)}>
            <Heading class="cursor-pointer"><#slot name="title" /></Heading>
          </div>
        </:left>
        <:right>
          <div class={hidden: !@with_button}>
            <LeftToRight>
              <#slot name="header_controls" />
              <div
                :on-click={toggle_content(@id, @disable_open)}
                id={@id <> "-arrow"}
                class={
                  "rotate-0": !@open_by_default,
                  "rotate-180": @open_by_default
                }
              >
                <ControlsChevronUp font_size="1.25rem" class="text-piccolo-100 cursor-pointer" />
              </div>
            </LeftToRight>
          </div>
        </:right>
      </PullAside>
      {#if @is_content_inside }
      <div id={@id <> "-content"} class={"p-4", hidden: !@open_by_default}>
        <#slot name="content" />
      </div>
      {/if}
      </div>

      {#if !@is_content_inside }
      <div id={@id <> "-content"} class={"p-4 bg-transparent", hidden: !@open_by_default}>
        <#slot name="content" />
      </div>
      {/if}
    </div>
    """
  end

  def toggle_content(id, disable_open) do
    if !disable_open do
      JS.toggle(to: "#" <> id <> "-content")
      |> JS.remove_class(
        "rotate-0",
        to: "#" <> id <> "-arrow.rotate-0"
      )
      |> JS.add_class(
        "rotate-0",
        to: "#" <> id <> "-arrow:not(.rotate-0)"
      )
      |> JS.remove_class(
        "rotate-180",
        to: "#" <> id <> "-arrow.rotate-180"
      )
      |> JS.add_class(
        "rotate-180",
        to: "#" <> id <> "-arrow:not(.rotate-180)"
      )
    end
  end
end
