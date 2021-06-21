defmodule Moon.Components.Popover do
  use Moon.StatelessComponent

  slot trigger,
    required: true

  slot content,
    required: true

  prop id, :string,
    required: true

  prop placement, :string,
    required: true,
    values: [
      "top-start", "top", "top-end", "right-start", "right", "right-end",
      "bottom-start", "bottom", "bottom-end", "left-start", "left", "left-end"
    ]

  def render(assigns) do
    ~F"""
      { asset_import @socket, "js/tailwind" }
      { asset_import @socket, "js/popper" }

      <div
        id={@id}
        data-placement={@placement}
        phx-update="ignore"

        x-data="{ showContent: false }"
        x-init="() => createPopper($el.children[0], $el.children[1], {
          placement: $el.getAttribute('data-placement'),
          modifiers: [{
            name: 'offset',
            options: { offset: [0, 4] }
          }]
        })"
        x-on:click.away="showContent = false"
      >
        <div x-on:click="showContent = !showContent">
          <#slot name="trigger"/>
        </div>

        <div class="z-30 w-48" x-bind:class="{
          'invisible': !showContent,
          'pointer-events-none': !showContent
        }">
          <#slot name="content" />
        </div>
      </div>
    """
  end
end

defmodule Moon.Components.Popover.Trigger do
  use Surface.Component, slot: "trigger"
end

defmodule Moon.Components.Popover.Content do
  use Surface.Component, slot: "content"
end
