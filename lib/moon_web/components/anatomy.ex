defmodule MoonWeb.Components.Anatomy do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.PageSection

  prop(title, :any, default: "Anatomy")
  prop(class, :css_class)
  slot(default)

  def render(assigns) do
    ~F"""
    <PageSection {=@title}>
      <pre class={merge([
        "flex w-full p-4 bg-goku rounded-moon-s-sm overflow-scroll text-moon-14 text-bulma",
        @class
      ])}><#slot /></pre>
    </PageSection>
    """
  end
end
