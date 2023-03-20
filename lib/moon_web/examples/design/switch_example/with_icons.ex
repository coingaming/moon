defmodule MoonWeb.Examples.Design.SwitchExample.WithIcons do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.GenericCheckRounded
  alias Moon.Icons.GenericClose
  alias Moon.Design.Switch

  def render(assigns) do
    ~F"""
    <Switch size="2xs" id="switch_12">
      <:on_icon><GenericCheckRounded /></:on_icon>
      <:off_icon><GenericClose /></:off_icon>
    </Switch>
    <Switch size="xs" id="switch_13">
      <:on_icon><GenericCheckRounded /></:on_icon>
      <:off_icon><GenericClose /></:off_icon>
    </Switch>
    <Switch id="switch_14">
      <:on_icon><GenericCheckRounded /></:on_icon>
      <:off_icon><GenericClose /></:off_icon>
    </Switch>
    """
  end

  def code() do
    """
    alias Moon.Icons.GenericCheckRounded
    alias Moon.Icons.GenericClose
    alias Moon.Design.Switch

    ...

    <Switch size="2xs" id="switch_12">
      <:on_icon><GenericCheckRounded /></:on_icon>
      <:off_icon><GenericClose /></:off_icon>
    </Switch>
    <Switch size="xs" id="switch_13">
      <:on_icon><GenericCheckRounded /></:on_icon>
      <:off_icon><GenericClose /></:off_icon>
    </Switch>
    <Switch id="switch_14">
      <:on_icon><GenericCheckRounded /></:on_icon>
      <:off_icon><GenericClose /></:off_icon>
    </Switch>
    """
  end
end
