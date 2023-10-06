defmodule Moon.Parts.Sidebar.WideMenu do
  @moduledoc false

  use Moon.StatelessComponent, slot: "wide"

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "If is slim sidebar"
  prop(is_slim, :boolean, from_context: :is_slim)
  @doc "Default slot"
  slot(default)
  @doc "Top slot"
  slot(top)
  @doc "Bottom slot"
  slot(bottom)

  @doc "Logo slot"
  slot(slim)
  @doc "Menu slot"
  slot(generic)

  def render(assigns) do
    ~F"""
    <div class="flex flex-row h-full">
      <div class="flex flex-col w-[4.5rem] border-e h-full h-screen pt-6 pb-5 lg:pb-20 gap-6 px-3 lg:overflow-visible overflow-y-scroll">
        <#slot {@slim} />
      </div>
      <div class="flex flex-col h-full w-full h-screen pt-6 pb-5 lg:pb-20 gap-6 px-4 overflow-y-scroll">
        <#slot {@generic} />
      </div>
    </div>
    """
  end
end
