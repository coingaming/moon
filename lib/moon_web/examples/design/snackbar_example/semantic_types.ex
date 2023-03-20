defmodule MoonWeb.Examples.Design.SnackbarExample.SemanticTypes do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Snackbar
  alias Moon.Design.Button

  alias Moon.Icons.GenericInfo

  def render(assigns) do
    ~F"""
    <Snackbar id="snackbar_13">
      <Snackbar.Trigger>
        <Button variant="secondary">Success</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon class="bg-roshi-10 text-roshi">
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Header>Success</Snackbar.Header>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>

    <Snackbar id="snackbar_14">
      <Snackbar.Trigger>
        <Button variant="secondary">Warning</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon class="bg-krillin-10 text-krillin">
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Header>Warning</Snackbar.Header>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>

    <Snackbar id="snackbar_15">
      <Snackbar.Trigger>
        <Button variant="secondary">Error</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon class="bg-chichi-10 text-chichi">
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Header>Error</Snackbar.Header>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>
    """
  end

  def code() do
    """
    alias Moon.Design.Snackbar
    alias Moon.Design.Button

    alias Moon.Icons.GenericInfo

    ...

    <Snackbar id="snackbar_13">
      <Snackbar.Trigger>
        <Button variant="secondary">Success</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon class="bg-roshi-10 text-roshi">
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Header>Success</Snackbar.Header>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>

    <Snackbar id="snackbar_14">
      <Snackbar.Trigger>
        <Button variant="secondary">Warning</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon class="bg-krillin-10 text-krillin">
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Header>Warning</Snackbar.Header>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>

    <Snackbar id="snackbar_15">
      <Snackbar.Trigger>
        <Button variant="secondary">Error</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon class="bg-chichi-10 text-chichi">
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Header>Error</Snackbar.Header>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>
    """
  end
end
