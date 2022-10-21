defmodule Moon.Components.Datepicker.Buttons do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Button

  prop on_click, :event
  prop values, :keyword, default: []
  prop testid, :string

  def render(assigns) do
    ~F"""
    <div class="flex shrink-0 gap-x-2">
      <Button variant="tertiary" size="sm" on_click="toggle_picker">
        Discard
      </Button>

      <Button class="px-3 py-2 rounded" variant="primary" size="sm" {=@on_click} {=@values} {=@testid}>
        Apply
      </Button>
    </div>
    """
  end
end
