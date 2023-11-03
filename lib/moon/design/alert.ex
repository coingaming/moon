defmodule Moon.Design.Alert do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Tailwind classes for customization"
  prop(class, :css_class)
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Defult content of Alert item"
  slot(default)
  @doc "Title of Alert item, see Alert.Title"
  slot(title)
  @doc "Message of Alert item, see Alert.Message"
  slot(message)
  @doc "Close button slot of Alert item, see Alert.Close"
  slot(close)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      role="alert"
      class={merge([
        "relative flex flex-col w-full gap-x-3 gap-y-1 p-4 rounded-moon-s-sm bg-goku",
        "text-moon-14 text-bulma",
        @class
      ])}
      data-testid={@testid}
    >
      <#slot />
      <#slot {@title} />
      <#slot {@message} />
      <#slot {@close} />
    </div>
    """
  end
end
