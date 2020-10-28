defmodule Moon.Components.Form do
  use Moon.StatelessComponent

  property(for, :any)
  property(change, :string)
  property(submit, :string)
  property(autocomplete, :string, default: "on", values: ["on", "off"])

  def render(assigns) do
    ~H"""
    <Surface.Components.Form for={{ @for }} change={{ @change }} submit={{ @submit }} opts={{ autocomplete: @autocomplete }}>
      <slot />
    </Surface.Components.Form>
    """
  end
end
