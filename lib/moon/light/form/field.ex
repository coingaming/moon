defmodule Elixir.Moon.Light.Form.Field do
  @moduledoc false
  use Moon.Light.Component
  import Moon.Light
  import Phoenix.HTML.Form, only: [input_name: 2]
  attr(:id, :string, doc: "Id attribute for HTML tag", default: nil)
  attr(:testid, :string, doc: "Data-testid attribute for HTML tag", default: nil)
  attr(:class, :any, doc: "Additional Tailwind classes", default: nil)
  attr(:attrs, :map, default: %{}, doc: "Additional attributes")

  attr(:field, :atom,
    doc: "Name of the field, usually should be taken from context",
    default: nil
  )

  attr(:form, :any, doc: "Form info, usually should be taken from context", default: nil)
  attr(:for, :string, doc: "Atom or changeset to inform the form data", default: nil)
  attr(:size, :string, values: ~w(sm md lg xl), default: "md", doc: "Common moon size property")
  attr(:title, :string, doc: "Label for input field", default: nil)
  attr(:disabled, :boolean, default: false, doc: "Whether label has disabled state")
  attr(:is_horizontal, :boolean, doc: "Whether label is on side of input field", default: nil)
  attr(:on_click, Event, doc: "On click event for the label", default: nil)
  attr(:value, :string, doc: "Value of the input", default: nil)
  slot(:inner_block, doc: "Default slot")

  def label(assigns) do
    ~H"""
    <label
      for={@for || (@form && @field && Phoenix.HTML.Form.input_id(@form, @field))}
      id={@id}
      data-testid={@testid}
      phx-click={@on_click && @on_click.name}
      phx-target={@on_click && @on_click.target}
      phx-value-value={@value}
      class={
        merge([
          [
            "flex gap-2 cursor-pointer whitespace-nowrap pb-2 items-center leading-normal",
            (@size == "sm" && "text-moon-14") || "text-moon-16",
            "text-bulma opacity-60 cursor-not-allowed": @disabled,
            "font-medium pb-0 align-center": @is_horizontal
          ],
          @class
        ])
      }
      {@attrs}
    >
      <%= render_slot(@inner_block) || @title %>
    </label>
    """
  end

  attr(:testid, :string, doc: "Data-testid attribute for HTML tag", default: nil)
  attr(:id, :string, doc: "Id attribute for HTML tag", default: nil)
  attr(:class, :any, doc: "Additional Tailwind classes", default: nil)
  attr(:has_error_icon, :boolean, default: false, doc: "Whether error icon is shown")
  attr(:is_horizontal, :boolean, default: false, doc: "Whether label is on side of input field")
  attr(:title, :string, doc: "Hint text when default slot is not given", default: nil)
  slot(:inner_block, doc: "Default slot")

  def hint(assigns) do
    ~H"""
    <div
      data-testid={@testid}
      id={@id}
      class={
        merge([
          [
            "flex gap-1 items-center mt-2 text-moon-12 [&_svg]:text-moon-16",
            "col-end-3": @is_horizontal
          ],
          @class
        ])
      }
    >
      <%= if has_slot?(@inner_block)  do %>
        <%= render_slot(@inner_block) %>
      <% else %>
        <p><%= @title %></p>
      <% end %>
    </div>
    """
  end

  attr(:testid, :string, doc: "Data-testid attribute for HTML tag", default: nil)
  attr(:id, :string, doc: "Id attribute for HTML tag", default: nil)
  attr(:class, :any, doc: "Additional Tailwind classes", default: nil)
  attr(:has_error_icon, :boolean, default: false, doc: "Whether error icon is shown")
  attr(:is_horizontal, :boolean, default: false, doc: "Whether label is on side of input field")
  slot(:inner_block, doc: "Default slot")

  def error(assigns) do
    ~H"""
    <div
      data-testid={@testid}
      id={@id}
      class={
        merge([
          [
            "flex gap-1 items-center mt-2 text-moon-12 [&_svg]:text-moon-16 text-chichi",
            "col-end-3": @is_horizontal
          ],
          @class
        ])
      }
      role="alert"
    >
      <%= if has_slot?(@inner_block)  do %>
        <%= render_slot(@inner_block) %>
      <% else %>
        <.icon :if={@has_error_icon} name="generic_info" />
      <% end %>
      <.moon module={Surface.Components.Form.ErrorTag} />
    </div>
    """
  end
end
