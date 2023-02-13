defmodule MoonWeb.Examples.Design.SnackbarExample.Positions do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Snackbar
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Snackbar position="top-left" id="snackbar_1">
      <Snackbar.Trigger>
        <Button variant="secondary">Top left</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar at top-left screen corner</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar position="top-center" id="snackbar_2">
      <Snackbar.Trigger>
        <Button variant="secondary">Top center</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar at top-center screen edge</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar position="top-right" id="snackbar_3">
      <Snackbar.Trigger>
        <Button variant="secondary">Top right</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar at top-right screen corner</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar position="bottom-left" id="snackbar_4">
      <Snackbar.Trigger>
        <Button variant="secondary">Bottom left</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar at bottom-left screen corner</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar position="bottom-center" id="snackbar_5">
      <Snackbar.Trigger>
        <Button variant="secondary">Bottom center</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar at bottom-center screen edge</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar position="bottom-right" id="snackbar_6">
      <Snackbar.Trigger>
        <Button variant="secondary">Bottom right</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar at bottom-right screen corner</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>
    """
  end

  def code() do
    """
    alias Moon.Design.Snackbar
    alias Moon.Design.Button

    ...

    """
  end
end
