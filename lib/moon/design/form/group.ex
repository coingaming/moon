defmodule Moon.Design.Form.Group do
  @moduledoc false

  use Moon.StatelessComponent

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  prop(orientation, :string, values!: ~w(horizontal vertical), default: "vertical")

  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div class={merge([
      "flex",
      @orientation == "horizontal" && "flex-row" || "flex-col",
      @class
    ])} {=@id} data-testid={@testid}>
      <#slot context_put={class: [
        @orientation == "vertical"
          &&
            "first:rounded-bl-none first:rounded-br-none first:input-bbb-hidden "
            <> "last:rounded-tl-none last:rounded-tr-none last:input-tbb-hidden"

          ||
            ~w(flex-1 basis-1/2)
            ++ ~w(first:rtl:rounded-bl-none first:rtl:rounded-tl-none first:rtl:input-lsb-hidden
              first:ltr:rounded-br-none first:ltr:rounded-tr-none first:ltr:input-rsb-hidden)
            ++ ~w(last:rtl:rounded-tr-none last:rtl:rounded-br-none last:rtl:input-rsb-hidden
              last:ltr:rounded-tl-none last:ltr:rounded-bl-none last:ltr:input-lsb-hidden)
      ]} />
    </div>
    """
  end

end
