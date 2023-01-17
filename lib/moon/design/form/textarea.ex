defmodule Moon.Design.Form.Textarea do
  @moduledoc false

  use Moon.StatelessComponent

  alias Surface.Components.Form.TextArea

  slot(default)

  prop(class, :css_class)
  prop(attrs, :map, default: %{})

  def render(assigns) do
    ~F"""
    <TextArea
      class={merge([
        "appearance-none resize-none w-full p-4 text-moon-16 text-bulma bg-gohan",
        "rounded-moon-s-sm placeholder:text-trunks outline outline-1 outline-offset-[-1px] outline-beerus",
        "transition-all focus:outline-2 focus:outline-offset-[-2px] focus:outline-piccolo hover:outline-1",
        "hover:outline-offset-[-1px] hover:outline-bulma/[0.12]",
        @class
      ])}
      {...@attrs}
    />
    """
  end
end
