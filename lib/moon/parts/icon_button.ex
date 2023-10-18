defmodule Moon.Parts.IconButton do
  @moduledoc false

  use Moon.StatelessComponent

  use Moon.Design.Button.IconButtonProperties

  alias Moon.Design.Button.IconButton

  @doc "Background tailwind class(es)"
  prop(bg_class, :css_class, default: "bg-popo")

  def render(assigns) do
    ~F"""
    <IconButton
      {=@as}
      {=@variant}
      {=@size}
      {=@disabled}
      {=@animation}
      {=@icon}
      {=@type}
      {=@form}
      {=@hover_bg_class}
      {=@href}
      {=@id}
      {=@on_click}
      {=@testid}
      {=@aria_label}
      {=@values}
      {=@value}
      {=@target}
      {=@rel}
      {=@attrs}
      class={"rounded-moon-s-xx rounded-full", @bg_class, @class}
    >
      <#slot />
    </IconButton>
    """
  end
end
