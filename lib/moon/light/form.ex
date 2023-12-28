defmodule Elixir.Moon.Light.Form do
  @moduledoc false
  use Moon.Light.Component

  import Moon.Helpers.Form
  import Phoenix.HTML.Form, only: [input_name: 2, input_id: 2, input_value: 2]
  import Moon.Helpers.MakeList, only: [make_list: 1]

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
  attr(:feedback_for, :string, default: nil)

  def field(assigns) do
    import Moon.Light.Form.Field

    ~H"""
    <div
      class={merge([["grid grid-cols-2": @is_horizontal], @class])}
      id={@id}
      data-testid={@testid}
      phx-feedback-for={@feedback_for || input_name(@form, @field)}
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

  attr(:field, :atom,
    doc: "Name of the field, usually should be taken from context",
    default: nil
  )

  attr(:form, :any, doc: "Form info, usually should be taken from context", default: nil)

  attr(:size, :string,
    values: ["sm", "md", "lg"],
    default: "md",
    doc: "Common moon size property"
  )

  attr(:error, :boolean,
    doc:
      "Some additional styling will be set to indicate the field is invalid. Generally should be set by Form.Field or Form.InsetField component",
    default: nil
  )

  attr(:type, :string,
    values: [
      "date",
      "month",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "time",
      "url"
    ],
    default: "text",
    doc: "HTML5 type of the input, please don't use checkbox or radio here"
  )

  attr(:placeholder, :string,
    default: " ",
    doc: "Text to be set as a HTML placeholder attribute - when input is empty"
  )

  attr(:class, :any, doc: "Additional classes for the <input> tag", default: nil)

  attr(:field_class, :any,
    doc: "Additional classes for the <input> tag in case of floating label or Group",
    default: nil
  )

  attr(:value, :string, doc: "Value of the input, don't use it inside the forms", default: nil)
  attr(:id, :string, doc: "Id to be given to the input tag", default: nil)
  attr(:testid, :string, doc: "Data-testid attribute value", default: nil)

  attr(:disabled, :boolean,
    doc:
      "HTML disabled attribute for the input & some additional classes. Generally should be set by Form.Field or Form.InsetField component",
    default: nil
  )

  attr(:readonly, :boolean,
    doc:
      "Readonly - some additional classes and behaviour. Generally should be set by Form.Field or Form.InsetField component",
    default: nil
  )

  attr(:autocomplete, :string,
    doc: "Autocomplete HTML attribute for the input, use \"off\" to disable",
    default: nil
  )

  attr(:opts, :any, default: %{}, doc: "Keyword | Map of additional attributes for the input")

  attr(:on_change, Event,
    doc: "On change event for the input - don't use it inside phoenix forms",
    default: nil
  )

  attr(:on_keyup, Event, doc: "On keyup event for the input", default: nil)
  attr(:on_focus, Event, doc: "On focus event for the input", default: nil)
  attr(:on_blur, Event, doc: "On blur event for the input", default: nil)

  def input(assigns) do
    ~H"""
    <input
      class={
        merge(
          input_classes(assigns) ++
            input_size_classes(assigns) ++
            [@field_class, get_config(:default_class), @class]
        )
      }
      type={@type}
      placeholder={@placeholder}
      value={@value || input_value(@form, @field)}
      id={@id || input_id(@form, @field)}
      name={input_name(@form, @field)}
      disabled={@disabled}
      readonly={@readonly}
      error={@error || has_error(@form, @field)}
      data-testid={@testid}
      autocomplete={@autocomplete}
      {@opts}
      phx-change={@on_change && @on_change.name}
      phx-keyup={@on_keyup && @on_keyup.name}
      phx-focus={@on_focus && @on_focus.name}
      phx-blur={@on_blur && @on_blur.name}
      phx-target={
        [@on_change, @on_keyup, @on_focus, @on_blur]
        |> Enum.find(%{}, &(&1 && &1.target))
        |> Map.get(:target)
      }
    />
    """
  end

  attr(:field, :atom,
    doc: "Name of the field, usually should be taken from context",
    default: nil
  )

  attr(:form, :any, doc: "Form info, usually should be taken from context", default: nil)

  attr(:options, :list,
    default: [],
    doc:
      "Options for select. Or list of keyword, either list of maps. Format: [%{key: shown_label, value: option_value, disabled: bool}], diisabled is optional"
  )

  attr(:value, :any,
    doc:
      "Selected option(s) value - do not use it inside the form, just for away-from-form components",
    default: nil
  )

  attr(:disabled, :boolean, doc: "Well, disabled", default: nil)
  attr(:size, :string, values: ~w(sm md lg), default: "md", doc: "Common moon size property")
  attr(:class, :any, doc: "Additional classes for the <select> tag", default: nil)

  attr(:field_class, :any,
    doc: "Additional classes for the <select> tag in case of floating label or Group",
    default: nil
  )

  attr(:prompt, :string, doc: "Some prompt to be shown on empty value", default: nil)
  attr(:id, :string, doc: "Id to be given to the select tag", default: nil)
  attr(:testid, :string, doc: "Data-testid attribute value", default: nil)

  attr(:error, :boolean,
    doc:
      "Some additional styling will be set to indicate the field is invalid. Generally should be set by Form.Field component",
    default: nil
  )

  attr(:is_multiple, :boolean,
    doc:
      "Experimental: If field does support multiselect, multiple attribute for select tag in HTML terms\n",
    default: nil
  )

  def select(assigns) do
    ~H"""
    <select
      multiple={@is_multiple}
      class={
        merge([
          "text-trunks flex justify-between w-full bg-goku border-0 duration-200 transition-shadow",
          "shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none focus:ring-0",
          "items-start text-ellipsis whitespace-nowrap overflow-hidden",
          "moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
          "invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
          [
            "py-0 px-4": !@is_multiple,
            "h-8 leading-8 rounded-moon-i-xs": @size == "sm",
            "h-10 leading-10 rounded-moon-i-sm": @size == "md",
            "h-12 leading-[3rem] rounded-moon-i-sm": @size == "lg",
            "cursor-not-allowed opacity-60": @disabled
          ],
          @field_class,
          get_config(:default_class),
          @class
        ])
      }
      name={input_name(@form, @field)}
      id={@id || input_id(@form, @field)}
      prompt={@prompt}
      disabled={@disabled}
      data-testid={@testid}
      error={@error || has_error(@form, @field)}
    >
      <option
        :for={option <- @options}
        value={option[:value]}
        selected={Enum.member?(make_list(@value), option[:value])}
        disabled={option[:disabled]}
      >
        <%= option[:key] %>
      </option>
    </select>
    """
  end
end
