defmodule MoonWeb.Components.ExampleAndCode do
  use MoonWeb, :stateless_component
  alias Moon.Components.Badge

  prop(class, :string)
  slot(example)
  slot(code)
  slot(state)
  prop(show_state, :boolean)

  def render(assigns) do
    ~H"""
    <div class="rounded-lg border border-gohan-100 p-0 {{ @class }} mb-8">
      <div class="grid grid-cols-1 sm:grid-cols-2">
        <div class="p-6">
          <slot name="example">
            Example not defined
          </slot>
        </div>
        <div class="border-l border-gohan-100">
          <slot name="code">
            Example code not defined
          </slot>
        </div>
      </div>
      <div class="p-6 border-t border-beerus-100" :if={{ @show_state }}>
        <Badge class="bg-piccolo-100 mb-3">State:</Badge>
        <pre class="text-xs break-all overflow-x-scroll w-full whitespace-pre-line" style="opacity: 0.5"><slot name="state" /></pre>
      </div>
    </div>
    """
  end
end
