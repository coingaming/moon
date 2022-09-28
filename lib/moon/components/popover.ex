defmodule Moon.Components.Popover do
  @moduledoc false

  use Moon.StatelessComponent

  prop class, :css_class
  prop inline_class, :boolean
  prop show, :boolean

  prop placement, :string,
    values: [
      "top-start",
      "top",
      "top-end",
      "right-start",
      "right",
      "right-end",
      "bottom-start",
      "bottom",
      "bottom-end",
      "left-start",
      "left",
      "left-end"
    ],
    default: "bottom-start"

  prop on_close, :event

  prop testid, :string

  slot default, required: true
  slot content, required: true

  def render(assigns) do
    classes = wrapper_classes(assigns.placement)

    ~F"""
    <div
      data-testid={@testid}
    >
      <#slot />
      {#if true}
        <div class="origin-top-right fixed left-0 top-4 rounded-md shadow-lg" :on-click-away={@on_close}>
          <#slot name="content" />
        </div>
      {/if}
    </div>
    """
  end

  defp wrapper_classes("top-start"),
    do: %{
      outer: "absolute top-0 left-0",
      inner: "-translate-y-full pb-2"
    }

  defp wrapper_classes("top"),
    do: %{
      outer: "absolute left-0 top-0 right-0 flex flex-col items-center",
      inner: "-translate-y-full pb-2"
    }

  defp wrapper_classes("top-end"),
    do: %{
      outer: "absolute top-0 right-0",
      inner: "-translate-y-full pb-2"
    }

  defp wrapper_classes("right-start"),
    do: %{
      outer: "absolute left-0 top-0 right-0",
      inner: "translate-x-full pl-2"
    }

  defp wrapper_classes("right"),
    do: %{
      outer: "absolute left-0 top-0 right-0",
      inner: "translate-x-full -translate-y-1/2 pl-2"
    }

  defp wrapper_classes("right-end"),
    do: %{
      outer: "absolute left-0 bottom-0 right-0",
      inner: "translate-x-full pl-2"
    }

  defp wrapper_classes("bottom-start"),
    do: %{
      outer: "absolute left-0 bottom-0",
      inner: "translate-y-full pt-2"
    }

  defp wrapper_classes("bottom"),
    do: %{
      outer: "absolute left-0 bottom-0 right-0 flex flex-col items-center",
      inner: "translate-y-full pt-2"
    }

  defp wrapper_classes("bottom-end"),
    do: %{
      outer: "absolute right-0 bottom-0",
      inner: "translate-y-full pt-2"
    }

  defp wrapper_classes("left-start"),
    do: %{
      outer: "absolute left-0 top-0 right-0",
      inner: "absolute -translate-x-full pr-2"
    }

  defp wrapper_classes("left"),
    do: %{
      outer: "absolute left-0 bottom-0 right-0",
      inner: "absolute -translate-x-full -translate-y-1/2 pr-2"
    }

  defp wrapper_classes("left-end"),
    do: %{
      outer: "absolute left-0 bottom-0 right-0",
      inner: "absolute -translate-x-full -translate-y-full pr-2"
    }
end
