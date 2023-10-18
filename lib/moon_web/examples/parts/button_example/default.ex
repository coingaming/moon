defmodule MoonWeb.Examples.Parts.ButtonExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Parts.Button
  alias Moon.Parts.IconButton

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Button>Button</Button>
      <Button.Gray>Button</Button.Gray>
      <Button.White>Button</Button.White>
      <Button.Success>Button</Button.Success>
      <Button.Warning>Button</Button.Warning>
      <Button.Error>Button</Button.Error>
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <IconButton icon="generic_settings" />
      <IconButton.Gray icon="generic_settings" />
      <IconButton.White icon="generic_settings" />
      <IconButton.Success icon="generic_settings" />
      <IconButton.Warning icon="generic_settings" />
      <IconButton.Error icon="generic_settings" />
    </div>
    """
  end

  def code() do
    """
    alias Moon.Parts.Button
    alias Moon.Parts.IconButton

    ...

    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Button>Button</Button>
      <Button.Gray>Button</Button.Gray>
      <Button.White>Button</Button.White>
      <Button.Success>Button</Button.Success>
      <Button.Warning>Button</Button.Warning>
      <Button.Error>Button</Button.Error>
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <IconButton icon="generic_settings" />
      <IconButton.Gray icon="generic_settings" />
      <IconButton.White icon="generic_settings" />
      <IconButton.Success icon="generic_settings" />
      <IconButton.Warning icon="generic_settings" />
      <IconButton.Error icon="generic_settings" />
    </div>
    """
  end
end
