defmodule MoonWeb.Examples.Design.SnackbarExample.Queue do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Snackbar
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Snackbar id="snackbar_24" in_queue>
      <Snackbar.Trigger>
        <Button variant="secondary">Queue Snackbar</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Number 1 Snackbar</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>

    <Snackbar id="snackbar_242" in_queue>
      <Snackbar.Trigger>
        <Button variant="secondary">Queue Snackbar</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Number 2 Snackbar</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>

    <Snackbar id="snackbar_243" in_queue>
      <Snackbar.Trigger>
        <Button variant="secondary">Queue Snackbar</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Number 3 Snackbar</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>
    """
  end

  def code() do
    """
    alias Moon.Design.Snackbar
    alias Moon.Design.Button

    ...

    <Snackbar id="snackbar_24" in_queue>
      <Snackbar.Trigger>
        <Button variant="secondary">Queue Snackbar</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Number 1 Snackbar
        </Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>
    """
  end
end
