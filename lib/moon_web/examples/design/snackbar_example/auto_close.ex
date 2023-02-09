defmodule MoonWeb.Examples.Design.SnackbarExample.AutoClose do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Phoenix.LiveView.JS

  alias Moon.Design.Snackbar
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Snackbar id="snackbar_16">
      <Snackbar.Trigger>
        <Button
          variant="secondary"
          on_click={JS.dispatch("moon:show-snackbar",
            detail: %{snackbar_id: "snackbar_16", position: "top-right", timeout: 1000}
          )}
        >Close after 1 sec</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_17">
      <Snackbar.Trigger>
        <Button
          variant="secondary"
          on_click={JS.dispatch("moon:show-snackbar",
            detail: %{snackbar_id: "snackbar_17", position: "top-right", timeout: 3000}
          )}
        >Close after 3 sec</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>
    """
  end

  def code() do
    """
    alias Phoenix.LiveView.JS

    alias Moon.Design.Snackbar
    alias Moon.Design.Button

    ...

    <Snackbar id="snackbar_16">
      <Snackbar.Trigger>
        <Button variant="secondary" on_click={JS.dispatch("moon:show-snackbar", detail: %{snackbar_id: "snackbar_16", position: "top-right", timeout: 1000})}>Close after 1 sec</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_17">
      <Snackbar.Trigger>
        <Button variant="secondary" on_click={JS.dispatch("moon:show-snackbar", detail: %{snackbar_id: "snackbar_17", position: "top-right", timeout: 3000})}>Close after 3 sec</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>
    """
  end
end
