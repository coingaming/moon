defmodule MoonWeb.Examples.Design.SnackbarExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Snackbar
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Snackbar id="snackbar_default">
      <Snackbar.Trigger>
        <Button variant="secondary">Default</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>
    """
  end

  def code() do
    """
    alias Moon.Design.Snackbar
    alias Moon.Design.Button

    ...

    <Snackbar id="snackbar_default">
      <Snackbar.Trigger>
        <Button variant="secondary">Default</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>
    """
  end
end
