defmodule MoonWeb.Components.IconItem do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Chip
  alias Moon.Design.Tooltip
  alias Moon.Icon

  prop(name, :string)
  prop(click, :event)
  prop(value, :string)

  def render(assigns) do
    ~F"""
    <Tooltip>
      <Tooltip.Trigger>
        <Chip
          variant="ghost"
          class="px-0 py-0 text-bulma w-10 flex items-center justify-center"
          aria_label={@name}
        >
          <Icon name={@name} class="text-moon-24" />
        </Chip>
      </Tooltip.Trigger>
      <Tooltip.Content>
        {@name}
        <Tooltip.Arrow />
      </Tooltip.Content>
    </Tooltip>
    """
  end
end
