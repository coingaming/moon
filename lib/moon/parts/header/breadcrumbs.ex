defmodule Moon.Parts.Header.Breadcrumbs do
  @moduledoc false

  use Moon.StatelessComponent, slot: "breadcrumbs"

  alias Moon.Design.Breadcrumb

  prop(id, :string)
  prop(breadcrumbs, :list, default: [])

  def render(assigns) do
    ~F"""
    <Breadcrumb {=@id} {=@breadcrumbs} divider="controls_chevron_right_small" />
    """
  end
end
