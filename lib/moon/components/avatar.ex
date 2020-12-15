defmodule Moon.Components.Avatar do
  use Moon.StatelessComponent

  alias Moon.Assets.Icons.IconUser

  prop(image_url, :string)
  prop(name, :string)
  prop(color, :string)
  prop(background_color, :string)
  prop(size, :string, default: "medium", values: ["xsmall", "small", "medium", "large"])

  def style(assigns) do
    "background-image: url(#{assigns.image_url}); color: var(--color--#{assigns.color}); background-color: var(--color--#{
      assigns.background_color
    });"
  end

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/avatar" }}

    <div
      class="moon-avatar" style={{ style(assigns) }} data-size={{ @size }}>
      <span :if={{ @name && !@image_url }}>{{ @name }}</span>
      <IconUser color={{ @color }} :if={{ !@name && !@image_url }} />
    </div>
    """
  end
end
