defmodule Moon.Components.Avatar do
  use Moon.StatelessComponent

  alias Moon.Assets.Icons.IconUser

  prop(image_url, :string)
  prop(name, :string)
  prop(color, :string)
  prop(background_color, :string)
  prop(size, :string, default: "medium", values: ["xsmall", "small", "medium", "large"])
  prop(class, :string)

  def style(assigns) do
    "background-image: url(#{assigns.image_url}); color: var(--color--#{assigns.color}); background-color: var(--color--#{
      assigns.background_color
    });"
  end

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/components/avatar")}

    <div
      class={
        "rounded-full bg-cover justify-center flex font-semibold items-center
          overflow-hidden uppercase #{@class}",
        "text-xs h-6 w-6": @size == "xsmall",
        "text-sm h-8 w-8": @size == "small",
        "text-base h-10 w-10": @size == "medium",
        "text-lg h-12 w-12": @size == "large"
      }
      style={style(assigns)}
      data-size={@size}
    >
      <span :if={@name && !@image_url}>{@name}</span>
      <IconUser color={@color} :if={!@name && !@image_url} />
    </div>
    """
  end
end
