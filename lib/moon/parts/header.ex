defmodule Moon.Parts.Header do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Title slot"
  slot(title)
  @doc "Descrption slot"
  slot(description)
  @doc "Breadcrumbs slot"
  slot(breadcrumbs)
  @doc "ButtonGroup slot"
  slot(button_group)

  def render(assigns) do
    ~F"""
    <header class="w-full fixed top-0 bg-goku z-50 theme-moon-dark">
      <div class="w-full p-8 flex flex-row justify-between">
        <div>
          <#slot {@breadcrumbs} />
          <div class="gap-3">
            <#slot {@title} />
            <#slot {@description} />
          </div>
        </div>
        <#slot {@button_group} />
      </div>
    </header>
    """
  end
end
