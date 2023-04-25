defmodule Moon.Design.Form.Group do
  @moduledoc """
  Component for visual groupping Form.Input & Form.Select
  """

  use Moon.StatelessComponent

  @doc "id attribute for DOM element"
  prop(id, :string)
  @doc "data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "additional Tailwind classes"
  prop(class, :css_class)
  @doc "Group orientation"
  prop(orientation, :string, values!: ~w(horizontal vertical), default: "vertical")

  @doc "Inner content of the component"
  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div
      class={merge([
        "flex border-none bg-beerus rounded-moon-i-sm h-fit",
        (@orientation == "horizontal" && "flex-row") || "flex-col",
        @class
      ])}
      {=@id}
      data-testid={@testid}
    >
      <#slot context_put={
        class: [
          (@orientation == "vertical" &&
             [
               "not-last:rounded-bl-none not-last:rounded-br-none not-last:not(:moon-error)input-bbb-hidden",
               "not-first:rounded-tl-none not-first:rounded-tr-none not-first:not(:moon-error):input-tbb-hidden"
             ]) ||
            [
              "flex-1 basis-1/2",
              "not-last:rtl:rounded-bl-none not-last:rtl:rounded-tl-none not-last:rtl:not(:moon-error):input-lsb-hidden",
              "not-last:ltr:rounded-br-none not-last:ltr:rounded-tr-none not-last:ltr:not(:moon-error):input-rsb-hidden",
              "not-first:rtl:rounded-tr-none not-first:rtl:rounded-br-none not-first:rtl:not(:moon-error):input-rsb-hidden",
              "not-first:ltr:rounded-tl-none not-first:ltr:rounded-bl-none not-first:ltr:not(:moon-error):input-lsb-hidden"
            ]
        ]
      } />
    </div>
    """
  end
end
