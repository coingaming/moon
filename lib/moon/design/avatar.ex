defmodule Moon.Design.Avatar do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icon

  use Moon.Design.Avatar.Properties

  def style(assigns) do
    "background-image: url(#{assigns.image_url});"
  end

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={[
        merge([
          [
            "overflow-hidden uppercase font-medium flex items-center justify-center relative text-bulma bg-goku",
            set_border_radius(@size),
            "text-moon-10-caption h-6 w-6": @size == "xs",
            "text-moon-12 h-8 w-8": @size == "sm",
            "text-moon-14 h-10 w-10": @size == "md",
            "text-moon-16 h-12 w-12": @size == "lg",
            "text-moon-16 h-14 w-14": @size == "xl",
            "text-moon-20 h-16 w-16": @size == "2xl"
          ],
          get_config(:default_class),
          @class
        ]),
        "bg-cover"
      ]}
      style={style(assigns)}
      data-testid={@testid}
    >
      {#if slot_assigned?(:default)}
        <#slot />
      {#else}
        <span :if={@name && !@image_url}>{@name}</span>
        <Icon name="generic_user" class={set_icon_size(@size)} :if={!@name && !@image_url} />
      {/if}
      <#slot
        {@status}
        context_put={
          size: @size
        }
      />
    </div>
    """
  end

  defp set_icon_size(size) do
    cond do
      size == "xs" -> "text-moon-16"
      size == "2xl" -> "text-moon-32"
      true -> "text-moon-24"
    end
  end

  defp set_border_radius(size) do
    cond do
      size == "xs" ->
        "rounded-moon-i-xs"

      size == "2xl" ->
        "rounded-moon-i-md"

      true ->
        "rounded-moon-i-sm"
    end
  end
end
