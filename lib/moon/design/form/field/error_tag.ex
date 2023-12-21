defmodule Moon.Design.Form.Field.ErrorTag do
  @moduledoc """
  copy of Surface.Components.Form.ErrorTag
  """

  use Surface.Component

  import Surface.Components.Form.ErrorTag, only: [translate_error: 1]

  @doc "An identifier for the form"
  prop form, :any, from_context: {Surface.Components.Form, :form}

  @doc "An identifier for the associated field"
  prop field, :any, from_context: {Surface.Components.Form.Field, :field}

  @doc """
  Classes to apply to each error tag <span>.

  This can also be set via config, for example:

  ```elixir
  config :surface, :components, [
    {Surface.Components.Form.ErrorTag, default_class: "invalid-feedback"}
  ]
  ```

  However, the prop overrides the config value if provided.
  """
  prop class, :css_class

  @doc """
  A function that takes one argument `{msg, opts}` and returns
  the translated error message as a string. If not provided, falls
  back to Phoenix's default implementation.

  This can also be set via config, for example:

  ```elixir
  config :surface, :components, [
    {Surface.Components.Form.ErrorTag, default_translator: {MyApp.Gettext, :translate_error}}
  ]
  ```
  """
  prop translator, :fun

  def render(assigns) do
    translate_error = assigns.translator || translator_from_config() || (&translate_error/1)
    class = assigns.class || get_config(:default_class)

    ~F"""
    <span :for={error <- Keyword.get_values(@form.errors || [], @field)} class={class}>{translate_error.(error)}</span>
    """
  end

  defp translator_from_config do
    case get_config(Surface.Components.Form.ErrorTag, :default_translator) do
      {module, function} -> &apply(module, function, [&1])
      nil -> nil
    end
  end
end
