defmodule Moon.Design.Dynamic do
  @moduledoc """
  Module for dynamic rendering state{full, less} Surface components with auto-defining
  TODO: fix it & make `{Moon.Design.Dynamic, propagate_context_to_slots: true},`
    For now it shows error: undefined function context_0/0
    try to obsolette context_put to fix it
  """

  use Moon.StatelessComponent

  alias Surface.Components.Dynamic.{LiveComponent, Component}

  import Moon.Helpers.MoonRender, only: [is_live: 1]

  prop(id, :string)

  @doc """
  The module of the component
  """
  prop module, :module, required: true

  @doc """
  The default slot
  """
  slot default

  def render(assigns) do
    ~F"""
    {#if is_live(@module)}
      <LiveComponent {=@id} {=@module}><#slot context_put={never_needed_var: 1} /></LiveComponent>
    {#else}
      <Component {=@module} function={:render}><#slot context_put={never_needed_var: 1} /></Component>
    {/if}
    """
  end
end
