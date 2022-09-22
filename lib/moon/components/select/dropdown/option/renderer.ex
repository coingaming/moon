defmodule Moon.Components.Select.Dropdown.Option.Renderer do
  @moduledoc false
  use Moon.StatelessComponent

  alias Phoenix.LiveView.JS

  prop class, :css_class
  prop select_id, :string
  prop value, :any
  prop select_value, :any
  prop is_multi, :boolean
  prop is_selected, :boolean
  prop left_icon, :any
  prop right_icon, :any

  slot default, args: [:is_selected]

  def render(assigns) do
    ~F"""
    <li
      role="option"
      :on-click={JS.dispatch("moon:update-select",
        detail: %{
          value: @value,
          selected: !@is_selected
        },
        to: "##{@select_id}"
      )
      |> JS.push("close", target: "##{@select_id}")
    }
    >
      <#slot :args={is_selected: @is_selected} />
    </li>
    """
  end
end
