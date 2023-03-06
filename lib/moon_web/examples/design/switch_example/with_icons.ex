defmodule MoonWeb.Examples.Design.SwitchExample.WithIcons do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.GenericCheckRounded
  alias Moon.Icons.GenericClose
  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
    <Switch size="2xs">
      <:on_icon><GenericCheckRounded /></:on_icon>
      <:off_icon><GenericClose /></:off_icon>
    </Switch>
    <Switch size="xs">
      <:on_icon><GenericCheckRounded /></:on_icon>
      <:off_icon><GenericClose /></:off_icon>
    </Switch>
    <Switch>
      <:on_icon><GenericCheckRounded /></:on_icon>
      <:off_icon><GenericClose /></:off_icon>
    </Switch>
    """
  end

  def code() do
    """
    alias Moon.Design.Switch

    ...


    """
  end
end
