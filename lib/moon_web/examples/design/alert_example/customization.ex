defmodule MoonWeb.Examples.Design.AlertExample.Customization do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.OtherFrame
  alias Moon.Design.Alert

  def render(assigns) do
    ~F"""
    <Alert>
      <Alert.Message>
        <OtherFrame class="text-moon-24 text-roshi" />
        Generic style with coloured icon
      </Alert.Message>
      <Alert.Close />
    </Alert>
    <Alert class="bg-transparent outline outline-1 outline-offset-[-1px] outline-roshi">
      <Alert.Message class="text-roshi">
        <OtherFrame class="text-moon-24" />
        Outline style
      </Alert.Message>
      <Alert.Close />
    </Alert>
    <Alert class="bg-roshi-10">
      <Alert.Message class="text-roshi">
        <OtherFrame class="text-moon-24" />
        Colourful style
      </Alert.Message>
      <Alert.Close />
    </Alert>
    """
  end

  def code() do
    """
    alias Moon.Icons.OtherFrame
    alias Moon.Design.Alert

    ...

    <Alert>
      <Alert.Message>
        <OtherFrame class="text-moon-24 text-roshi" />
        Generic style with coloured icon
      </Alert.Message>
      <Alert.Close />
    </Alert>
    <Alert class="bg-transparent outline outline-1 outline-offset-[-1px] outline-roshi">
      <Alert.Message class="text-roshi">
        <OtherFrame class="text-moon-24" />
        Outline style
      </Alert.Message>
      <Alert.Close />
    </Alert>
    <Alert class="bg-roshi-10">
      <Alert.Message class="text-roshi">
        <OtherFrame class="text-moon-24" />
        Colourful style
      </Alert.Message>
      <Alert.Close />
    </Alert>
    """
  end
end
