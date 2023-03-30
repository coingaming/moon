defmodule MoonWeb.Examples.Design.ButtonExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button left_icon="generic_settings" button_gap="gap-1" size="xs">XS Button</Button>
    <Button left_icon="generic_settings" button_gap="gap-1" size="sm">SM Button</Button>
    <Button left_icon="generic_settings" size="md">MD Button is default</Button>
    <Button left_icon="generic_settings" size="lg">LG Button</Button>
    <Button left_icon="generic_settings" size="xl">XL Button</Button>
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button left_icon="generic_settings" button_gap="gap-1" size="xs">XS Button</Button>
    <Button left_icon="generic_settings" button_gap="gap-1" size="sm">SM Button</Button>
    <Button left_icon="generic_settings" size="md">MD Button is default</Button>
    <Button left_icon="generic_settings" size="lg">LG Button</Button>
    <Button left_icon="generic_settings" size="xl">XL Button</Button>
    """
  end
end
