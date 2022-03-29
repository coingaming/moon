defmodule MoonComponents.Caption do
  @moduledoc false

  use Moon.StatelessComponent

  prop text_align, :string
  prop color, :string, default: "bulma.100"

  def style(assigns) do
    "color: var(--color--#{assigns.color});"
  end

  def render(assigns) do
    ~F"""
    <span
      class={"uppercase font-semibold leading-4 text-[10px] tracking-[1px]"}
      style={style(assigns)}
    >
    </span>
    """
  end
end
