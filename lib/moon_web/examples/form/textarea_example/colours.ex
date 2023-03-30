defmodule MoonWeb.Examples.Form.TextareaExample.Colours do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Textarea

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap md:flex-nowrap items-center justify-around gap-2 w-full">
      <Textarea placeholder="Custom text colours" class="text-krillin placeholder:text-whis" rows={1} />
      <Textarea
        placeholder="Custom border colours"
        class="outline-chichi hover:outline-piccolo focus:outline-krillin"
        rows={1}
      />
      <Textarea placeholder="Custom background colour" class="bg-roshi-10" rows={1} />
    </div>
    <div class="flex flex-wrap md:flex-nowrap items-center justify-around gap-2 w-full">
      <Textarea placeholder="Resize vertically" class="resize-y" rows={3} />
      <Textarea placeholder="Resize horizontally" class="resize-x" rows={3} />
      <Textarea placeholder="Resize vertically and horizontally" class="resize" rows={3} />
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Textarea

    ...

    <div class="flex flex-wrap md:flex-nowrap items-center justify-around gap-2 w-full">
      <Textarea placeholder="Custom text colours" class="text-krillin placeholder:text-whis" rows={1} />
      <Textarea
        placeholder="Custom border colours"
        class="outline-chichi hover:outline-piccolo focus:outline-krillin"
        rows={1}
      />
      <Textarea placeholder="Custom background colour" class="bg-roshi-10" rows={1} />
    </div>
    <div class="flex flex-wrap md:flex-nowrap items-center justify-around gap-2 w-full">
      <Textarea placeholder="Resize vertically" class="resize-y" rows={3} />
      <Textarea placeholder="Resize horizontally" class="resize-x" rows={3} />
      <Textarea placeholder="Resize vertically and horizontally" class="resize" rows={3} />
    </div>
    """
  end
end
