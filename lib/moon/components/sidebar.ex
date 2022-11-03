defmodule Moon.Components.Sidebar do
  @moduledoc false

  use Moon.StatelessComponent

  slot full_logo
  slot short_logo
  slot menu

  prop open_width, :string, default: "14.5rem"
  prop background_color, :string, default: ""

  def render(assigns) do
    ~F"""
    <aside class="flex flex-col flex-shrink-0 w-80">
      <div x-cloak class="flex items-center p-5">
        <!-- Short logo -->
        <#slot {@short_logo} />
      </div>

      <div class="flex flex-col" style={"width: #{@open_width};"}>
        <div class={"relative flex flex-col h-screen #{@background_color}"}>
          <!-- Full logo -->
          <div class="flex items-center shrink-0 px-5">
            <#slot {@full_logo} />
          </div>

          <div class="flex-1 overflow-y-auto">
            <!-- Menu -->
            <#slot {@menu} />
          </div>
        </div>
      </div>
    </aside>
    """
  end
end
