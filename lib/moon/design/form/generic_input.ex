defmodule Moon.Design.Form.GenericInput do
  @moduledoc """
  A component for rendering input with any type, a copy of Surface.Components.Form.{EmailInput, TextInput, ...}


  ## Examples

  ```
  <GenericInput form="user" type="password" field="password" opts={autofocus: "autofocus"} />
  ```
  """

  use Surface.Components.Form.Input

  import Phoenix.HTML.Tag
  import Phoenix.HTML.Form

  import Surface.Components.Utils, only: [events_to_opts: 1]
  import Surface.Components.Form.Utils

  def render(assigns) do
    helper_opts = props_to_opts(assigns)
    attr_opts = props_to_attr_opts(assigns, [:value, class: get_default_class()])
    event_opts = events_to_opts(assigns)

    opts =
      assigns.opts
      |> Keyword.merge(helper_opts)
      |> Keyword.merge(attr_opts)
      |> Keyword.merge(event_opts)

    assigns = assign(assigns, opts: opts)

    ~F[{generic_input(assigns.type, @form, @field, @opts)}
]
  end

  # a copy of generic_input from Phoenix.HTML.Form bc it's also private
  defp generic_input(type, form, field, opts)
       when is_list(opts) and (is_atom(field) or is_binary(field)) do
    opts =
      opts
      |> Keyword.put_new(:type, type)
      |> Keyword.put_new(:id, input_id(form, field))
      |> Keyword.put_new(:name, input_name(form, field))
      |> Keyword.put_new(:value, input_value(form, field))
      |> Keyword.update!(:value, &maybe_html_escape/1)

    tag(:input, opts)
  end

  defp maybe_html_escape(nil), do: nil
  defp maybe_html_escape(value), do: Phoenix.HTML.html_escape(value)
end
