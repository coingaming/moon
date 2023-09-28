defmodule MoonWeb.Examples.Design.SnackbarExample.AutoClose do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Snackbar
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Snackbar id="snackbar_16" timeout={1000}>
      <Snackbar.Trigger>
        <Button variant="outline">Close after 1 sec</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_17" timeout={3000}>
      <Snackbar.Trigger>
        <Button variant="outline">Close after 3 sec</Button>
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

    <Snackbar id="snackbar_16" timeout={1000}>
      <Snackbar.Trigger>
        <Button variant="outline">Close after 1 sec</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_17" timeout={3000}>
      <Snackbar.Trigger>
        <Button variant="outline">Close after 3 sec</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>
    """
  end
end
