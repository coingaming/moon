defmodule Moon.Components.Link do
  use Moon.StatelessComponent

  prop(to, :any)
  prop(secondary, :boolean)
  prop(disabled, :boolean)
  prop(optional, :boolean)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/components/link")}

    <a
      class={"moon-link #{@class}"}
      data-phx-link="patch"
      data-phx-link-state="push"
      href={@to}
      data-secondary={@secondary && "true"}
      data-optional={@optional && "true"}
      data-disabled={@disabled && "true"}
    ><#slot /></a>
    """
  end
end

# Routes.live_path(@socket, MyLive, @page + 1)
