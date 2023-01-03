defmodule Moon.Design.Tooltip do
  @moduledoc false

  use Moon.StatelessComponent

  prop(clicked_text, :string, default: nil)
  prop(text, :string, required: true)

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div class="relative inline-block" x-data="{ tooltip: false, timeout: null }">
      <#slot/>
      <#slot {@trigger}/>
    </div>
    """
  end
end
