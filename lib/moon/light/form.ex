defmodule Elixir.Moon.Light.Form do
  @moduledoc false
  use Moon.Light.Component

  import Moon.Helpers.Form
  import Phoenix.HTML.Form, only: [input_name: 2]

  attr(:form, :any, doc: "Form, Surface-style", default: nil)
  attr(:field, :atom, doc: "Field, Surface-style", default: nil)
  attr(:size, :string, values: ~w(sm md lg), default: "md", doc: "Input size")
  attr(:label, :string, doc: "Label for input field", default: nil)
  attr(:hint, :string, doc: "Hint for input field", default: nil)
  attr(:hide_errors, :boolean, doc: "Whether error message is shown", default: nil)
  attr(:class, :any, doc: "Additional Tailwind classes", default: nil)
  attr(:error_class, :any, doc: "Additional Tailwind classes", default: nil)
  attr(:hint_class, :any, doc: "Additional Tailwind classes", default: nil)
  attr(:id, :string, doc: "id attribute for DOM element", default: nil)
  attr(:testid, :string, doc: "data-testid attribute for DOM element", default: nil)
  attr(:is_horizontal, :boolean, doc: "Whether label is on side of input field", default: nil)
  attr(:has_error_icon, :boolean, doc: "Whether error icon is shown", default: nil)
  slot(:inner_block, doc: "Inner content of the component")
  attr(:attrs, :map, default: nil)

  def field(assigns) do
    import Moon.Light.Form.Field

    ~H"""
    <div
      class={merge([["grid grid-cols-2": @is_horizontal], @class])}
      id={@id}
      data-testid={@testid}
      phx-feedback-for={@feedback_for || input_name(@form, @name)}
    >
      <.label :if={@label} size={@size} title={@label} />
      <%= render_slot(@inner_block) %>
      <.hint :if={@hint} title={@hint} class={@hint_class} is_horizontal={@is_horizontal} />
      <.error
        :if={!@hide_errors && !!@field && !!@form && has_error(@form, @field)}
        class={@error_class}
        has_error_icon={@has_error_icon}
        is_horizontal={@is_horizontal}
      />
    </div>
    """
  end
end
