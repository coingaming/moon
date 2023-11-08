defmodule Moon.Parts.Button do
  @moduledoc false

  use Moon.StatelessComponent

  use Moon.Design.Button.Properties

  alias Moon.Design.Button

  @doc "Background tailwind class(es)"
  prop(bg_class, :css_class, default: "bg-popo")

  def render(assigns) do
    ~F"""
    <Button
      {=@as}
      {=@variant}
      {=@size}
      {=@full_width}
      {=@disabled}
      {=@animation}
      {=@type}
      {=@form}
      {=@hover_bg_class}
      {=@left_icon}
      {=@right_icon}
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
      class={"rounded-full", @bg_class, @class}
    >
      <#slot {@left_icon_slot} />
      <#slot />
      <#slot {@right_icon_slot} />
    </Button>
    """
  end
end
