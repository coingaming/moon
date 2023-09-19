defmodule MoonWeb.Examples.Design.SnackbarExample.Options do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Snackbar
  alias Moon.Design.Button

  alias Moon.Icons.GenericInfo

  def render(assigns) do
    ~F"""
    <Snackbar id="snackbar_7">
      <Snackbar.Trigger>
        <Button variant="outline">Multi Line</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
        <Snackbar.Message>Snackbar the second line message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_8">
      <Snackbar.Trigger>
        <Button variant="outline">With header</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Header>Info</Snackbar.Header>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_9">
      <Snackbar.Trigger>
        <Button variant="outline">With Close</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>

    <Snackbar id="snackbar_10">
      <Snackbar.Trigger>
        <Button variant="outline">With Icon</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon>
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_11">
      <Snackbar.Trigger>
        <Button variant="outline">Multi Line with Icon</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon>
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
        <Snackbar.Message>Snackbar the second line message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_12">
      <Snackbar.Trigger>
        <Button variant="outline">With Close and Icon</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon>
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
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

    <Snackbar id="snackbar_7">
      <Snackbar.Trigger>
        <Button variant="outline">Multi Line</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
        <Snackbar.Message>Snackbar the second line message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_8">
      <Snackbar.Trigger>
        <Button variant="outline">With header</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Header>Info</Snackbar.Header>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_9">
      <Snackbar.Trigger>
        <Button variant="outline">With Close</Button>
      </Snackbar.Trigger>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>

    <Snackbar id="snackbar_10">
      <Snackbar.Trigger>
        <Button variant="outline">With Icon</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon>
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_11">
      <Snackbar.Trigger>
        <Button variant="outline">Multi Line with Icon</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon>
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
        <Snackbar.Message>Snackbar the second line message</Snackbar.Message>
      </Snackbar.Content>
    </Snackbar>

    <Snackbar id="snackbar_12">
      <Snackbar.Trigger>
        <Button variant="outline">With Close and Icon</Button>
      </Snackbar.Trigger>
      <Snackbar.Icon>
        <GenericInfo />
      </Snackbar.Icon>
      <Snackbar.Content>
        <Snackbar.Message>Snackbar message</Snackbar.Message>
      </Snackbar.Content>
      <Snackbar.Close />
    </Snackbar>
    """
  end
end
