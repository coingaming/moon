defmodule MoonWeb.Components.ShowRoomPage.Wizard.Card do
  @moduledoc false

  use MoonWeb, :stateless_component

  slot(title)
  slot(description)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-4">
      <h3 class="text-moon-20 text-bulma font-grotesk"><#slot {@title} /></h3>
      <p class="text-moon-14 text-trunks"><#slot {@description} /></p>
      <#slot />
    </div>
    """
  end
end
