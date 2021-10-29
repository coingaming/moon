defmodule Moon.Components.Avatar do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon

  prop image_url, :string
  prop name, :string
  prop color, :string, default: "gohan-100", values: Moon.colors()
  prop background_color, :string, default: "piccolo-100", values: Moon.colors()
  prop size, :string, default: "medium", values: ["xsmall", "small", "medium", "large"]
  prop class, :string

  def style(assigns) do
    "background-image: url(#{assigns.image_url}); color: var(--color--#{assigns.color}); background-color: var(--color--#{assigns.background_color});"
  end

  def render(assigns) do
    ~F"""
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
      <Icon name="generic_user" color={@color} class={icon_class(@size)} :if={!@name && !@image_url} />
    </div>
    """
  end

  defp icon_class("xsmall"), do: "h-4 w-4"
  defp icon_class("small"), do: "h-5 w-5"
  defp icon_class("medium"), do: "h-6 w-6"
  defp icon_class("large"), do: "h-7 w-7"
end
