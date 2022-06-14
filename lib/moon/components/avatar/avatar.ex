defmodule Moon.Components.Avatar do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon
  alias Moon.Components.Avatar.StatusOrigin

  prop image_url, :string
  prop name, :string
  prop color, :string, default: "gohan-100", values: Moon.colors()
  prop background_color, :string, default: "piccolo-100", values: Moon.colors()

  prop size, :string,
    default: "medium",
    values: ["xsmall", "small", "medium", "large", "xlarge", "twoxlarge"]

  prop class, :string

  prop is_status_active, :boolean, default: false

  prop status_origin, :struct, default: %StatusOrigin{vertical: "bottom", horizontal: "right"}

  def style(assigns) do
    "background-image: url(#{assigns.image_url}); color: var(--color--#{assigns.color}); background-color: var(--color--#{assigns.background_color});"
  end

  def render(assigns) do
    ~F"""
    <div
      class={
        "rounded-sm bg-cover justify-center flex font-semibold items-center
               overflow-hidden uppercase relative #{@class}",
        "text-moon-12 h-6 w-6": @size == "xsmall",
        "text-moon-14 h-8 w-8": @size == "small",
        "text-moon-16 h-10 w-10": @size == "medium",
        "text-moon-18 h-12 w-12": @size == "large",
        "text-moon-20 h-14 w-14": @size == "xlarge",
        "text-moon-24 h-16 w-16": @size == "twoxlarge"
      }
      style={style(assigns)}
      data-size={@size}
    >
      <span :if={@name && !@image_url}>{@name}</span>
      <Icon name="generic_user" color={@color} class={icon_class(@size)} :if={!@name && !@image_url} />
      <div
        :if={@status_origin && @is_status_active}
        class={
          "absolute border-solid color-beerus-100 rounded-full bg-roshi-100",
          "top-0": @status_origin.vertical == "top",
          "bottom-0": @status_origin.vertical == "bottom",
          "left-0": @status_origin.horizontal == "left",
          "right-0": @status_origin.horizontal == "right",
          "w-2 h-2 border": @size == "xsmall",
          "w-3 h-3 border-2": @size == "small" || @size == "medium",
          "w-4 h-4 border-2": @size == "large" || @size == "xlarge" || @size == "twoxlarge"
        }
      />
    </div>
    """
  end

  defp icon_class("xsmall"), do: "h-4 w-4"
  defp icon_class("small"), do: "h-5 w-5"
  defp icon_class("medium"), do: "h-6 w-6"
  defp icon_class("large"), do: "h-7 w-7"
  defp icon_class("xlarge"), do: "h-14 w-14"
  defp icon_class("twoxlarge"), do: "h-16 w-16"
end
