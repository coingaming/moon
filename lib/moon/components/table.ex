defmodule Moon.Components.Table do
  use Moon.StatelessComponent

  slot(default)
  prop class, :css_class

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <table class="table-auto moon-table {{ @class }}">
      <slot />
    </table>
    """
  end

  def get_row_class(i) do
    rem(i, 2) == 0 && "bg-gohan-100"
  end
end
