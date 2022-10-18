defmodule Moon.Components.InputGroup.Error do
  @moduledoc false

  defstruct field: nil, message: nil
end

defmodule Moon.Components.InputGroup do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.InputGroup.Container
  alias Surface.Components.Form.Input.InputContext
  alias Moon.Components.ErrorTag
  alias Moon.Components.InputGroup.Error

  prop orientation, :string,
    default: "horizontal",
    values: ["horizontal", "vertical"]

  prop has_fields, :boolean, default: false
  prop included_fields, :list
  prop use_error_tag, :boolean, default: true

  slot default, required: true, args: [:group_class_fields]

  def render(assigns) do
    ~F"""
    <InputContext {=assigns} :let={form: form}>
      <Container orientation={@orientation} is_error={has_error(form, @included_fields)}>
        <#slot />
      </Container>
      <div
        class="inline-block mt-2 text-moon-12"
        :if={@use_error_tag && has_error(form, @included_fields)}
      >
        <ErrorTag :for={item <- get_errors(form, @included_fields)} field={item.field} />
      </div>
    </InputContext>
    """
  end

  defp get_errors(form, fields) do
    list =
      for field <- fields, Keyword.has_key?(form.errors, field) do
        found = Enum.at(Keyword.get_values(form.errors, field), 0)
        message = elem(found, 0)
        %Error{message: message, field: field}
      end

    list
  end

  defp has_error(form, fields) do
    Enum.count(get_errors(form, fields)) > 0
  end
end
