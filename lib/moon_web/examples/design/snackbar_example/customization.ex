defmodule MoonWeb.Examples.Design.SnackbarExample.Customization do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Snackbar
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Snackbar class="rounded-none" id="snackbar_18">
      <Snackbar.Trigger>
        <Button variant="outline">Border radius</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Custom border radius</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar class="bg-roshi" id="snackbar_19">
      <Snackbar.Trigger>
        <Button variant="outline">Background</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Custom background color</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar class="w-72" id="snackbar_20">
      <Snackbar.Trigger>
        <Button variant="outline">Width</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Custom width</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar class="theme-moon-light" id="snackbar_21">
      <Snackbar.Trigger>
        <Button variant="outline">Always light</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Applying light theme</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar class="theme-moon-dark" id="snackbar_22">
      <Snackbar.Trigger>
        <Button variant="outline">Always dark</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Applying dark theme</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_23">
      <Snackbar.Trigger>
        <Button variant="outline">Fonts</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message class="text-moon-24 text-chichi">Custom fonts</Snackbar.Message>
        <Snackbar.Message class="text-moon-12 font-medium">Even more custom fonts</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>
    """
  end

  def code() do
    """
    alias Moon.Design.Snackbar
    alias Moon.Design.Button

    ...

    <Snackbar class="rounded-none" id="snackbar_18">
      <Snackbar.Trigger>
        <Button variant="outline">Border radius</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Custom border radius</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar class="bg-roshi" id="snackbar_19">
      <Snackbar.Trigger>
        <Button variant="outline">Background</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Custom background color</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar class="w-72" id="snackbar_20">
      <Snackbar.Trigger>
        <Button variant="outline">Width</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Custom width</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar class="theme-moon-light" id="snackbar_21">
      <Snackbar.Trigger>
        <Button variant="outline">Always light</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Applying light theme</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar class="theme-moon-dark" id="snackbar_22">
      <Snackbar.Trigger>
        <Button variant="outline">Always dark</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Applying dark theme</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_23">
      <Snackbar.Trigger>
        <Button variant="outline">Fonts</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message class="text-moon-24 text-chichi">Custom fonts</Snackbar.Message>
        <Snackbar.Message class="text-moon-12 font-medium">Even more custom fonts</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>
    """
  end
end
