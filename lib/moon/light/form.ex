defmodule Elixir.Moon.Light.Form do
  @moduledoc false
  use Moon.Light.Component

  alias Phoenix.LiveView.JS

  import Moon.Helpers.Form
  import Moon.Helpers.MakeList, only: [make_list: 1]

  attr(:field, Phoenix.HTML.FormField, required: true)
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
      phx-feedback-for={@feedback_for || @field.name}
    >
      <.label :if={@label} size={@size} title={@label} field={@field} />
      <%= render_slot(@inner_block, @field) %>
      <.hint :if={@hint} title={@hint} class={@hint_class} is_horizontal={@is_horizontal} />
      <.error
        :if={!@hide_errors && @field.errors != []}
        field={@field}
        class={@error_class}
        has_error_icon={@has_error_icon}
        is_horizontal={@is_horizontal}
      />
    </div>
    """
  end

  attr(:field, Phoenix.HTML.FormField, default: nil)

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
      value={(@field && @field.value) || @value}
      id={(@field && @field.id) || @id}
      name={@field && @field.name}
      error={(@field && length(@field.errors) > 0) || @error}
      disabled={@disabled}
      readonly={@readonly}
      data-testid={@testid}
      autocomplete={@autocomplete}
      {@opts}
      phx-change={Event.from(@on_change).name}
      phx-keyup={Event.from(@on_keyup).name}
      phx-focus={Event.from(@on_focus).name}
      phx-blur={Event.from(@on_blur).name}
      phx-target={[@on_change, @on_keyup, @on_focus, @on_blur] |> Event.find_target()}
    />
    """
  end

  attr(:field, Phoenix.HTML.FormField, default: nil)

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
      name={@field && @field.name <> ((@is_multiple && "[]") || "")}
      error={(@field && length(@field.errors) > 0) || @error}
      id={(@field && @field.id) || @id}
      prompt={@prompt}
      disabled={@disabled}
      data-testid={@testid}
    >
      <option
        :for={option <- @options}
        value={option[:value]}
        selected={Enum.member?(make_list((@field && @field.value) || @value), option[:value])}
        disabled={option[:disabled]}
      >
        <%= option[:key] %>
      </option>
    </select>
    """
  end

  attr(:field, Phoenix.HTML.FormField, default: nil)
  attr(:class, :any, default: nil)

  attr(:attrs, :map,
    default: %{},
    doc: "Attributes directly passed to textarea html tag. see Surface.Components.Form.TextArea"
  )

  attr(:rows, :string, default: nil)
  attr(:cols, :string, default: nil)
  attr(:disabled, :boolean, default: false)
  attr(:placeholder, :string, default: "")
  attr(:error, :boolean, default: nil)
  attr(:testid, :string, default: nil)
  attr(:id, :string, default: nil)
  attr(:value, :string, default: nil, doc: "Value for the textarea")
  attr(:on_change, :string, doc: "On change event for the input", default: nil)
  attr(:on_keyup, :string, doc: "On keyup event for the input", default: nil)
  attr(:on_focus, :string, doc: "On focus event for the input", default: nil)
  attr(:on_blur, :string, doc: "On blur event for the input", default: nil)
  attr(:target, :any, doc: "phx-target attribute", default: nil)

  def text_area(assigns) do
    ~H"""
    <textarea
      class={
        merge([
          "appearance-none resize-none w-full p-4 text-moon-16 text-bulma bg-goku border-0",
          "rounded-moon-s-sm placeholder:text-trunks transition-shadow",
          "before:box-border after:box-border",
          "shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none focus:ring-0",
          "moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
          "invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
          @disabled && "opacity-60 cursor-not-allowed",
          @class
        ])
      }
      rows={@rows}
      cols={@cols}
      disabled={@disabled}
      placeholder={@placeholder}
      data-testid={@testid}
      name={@field && @field.name}
      error={(@field && length(@field.errors) > 0) || @error}
      id={(@field && @field.id) || @id}
      {@attrs}
      phx-change={@on_change}
      phx-keyup={@on_keyup}
      phx-focus={@on_focus}
      phx-blur={@on_blur}
      phx-target={@target}
    ><%= @field && @field.value || @value %></textarea>
    """
  end

  attr(:field, Phoenix.HTML.FormField, required: true)
  attr(:label, :string, default: nil)
  attr(:disabled, :boolean, default: false)
  attr(:readonly, :boolean, default: false)
  attr(:size, :string, values: ["2xs", "xs", "sm"], default: "sm")
  attr(:on_bg_color, :any, default: "bg-piccolo")
  attr(:off_bg_color, :any, default: "bg-beerus")
  attr(:class, :any, default: nil)
  attr(:testid, :string, default: nil)
  attr(:id, :string, default: nil)
  slot(:on_icon, [])
  slot(:off_icon, [])

  def switch(assigns) do
    ~H"""
    <div>
      <input
        type="checkbox"
        name={@field.name}
        id={@field.id}
        class="hidden"
        disabled={@disabled}
        readonly={@readonly}
        checked={@field.value}
      />
      <Moon.Light.switch
        size={@size}
        on_bg_color={@on_bg_color}
        off_bg_color={@off_bg_color}
        disabled={@disabled || @readonly}
        class={@class}
        testid={@testid}
        id={@id}
        on_change={
          JS.dispatch("moon2:update-switch",
            detail: %{checked: !@field.value},
            to: "##{@field.id}"
          )
        }
        checked={@field.value}
      >
        <:on_icon><%= render_slot(@on_icon) %></:on_icon>
        <:off_icon><%= render_slot(@off_icon) %></:off_icon>
      </Moon.Light.switch>
      <%= @label %>
    </div>
    """
  end

  @doc "Checkbox to be rendered on form. Label is the root component. For rebdering outside the from please use Moon.Lego.Checkbox"
  attr(:field, Phoenix.HTML.FormField, required: true)
  attr(:label, :string, doc: "Label to be shown to user", default: nil)
  attr(:disabled, :boolean, doc: "If the field is disabled", default: nil)
  attr(:readonly, :boolean, doc: "If the field is read-only", default: nil)
  attr(:id, :string, doc: "Id to be given to the HTML tag", default: nil)
  attr(:testid, :string, doc: "Data-testid attribute value", default: nil)
  attr(:class, :any, doc: "Class to be given to the visible checkbox", default: nil)

  attr(:checkbox_label_class, :any,
    doc: "Additional Tailwind classes for checkbox label",
    default: nil
  )

  attr(:on_click, Event, doc: "On_click event for the checkbox", default: nil)

  attr(:checked_value, :any,
    default: true,
    doc: "The value to be sent when the checkbox is checked. Defaults to \"true\""
  )

  attr(:hidden_input, :boolean,
    default: true,
    doc:
      "Controls if this function will generate a hidden input to submit the unchecked value or not, defaults to \"true\"."
  )

  attr(:unchecked_value, :any,
    default: false,
    doc: "The value to be sent when the checkbox is unchecked, defaults to \"false\"."
  )

  attr(:is_multiple, :boolean,
    doc: "Adding [] to the field name for support multiple checkboxes with the same name",
    default: nil
  )

  attr(:size, :string, values: ~w(sm md lg), default: "md", doc: "Size of the label")
  slot(:inner_block, doc: "Inner content - put label here")

  def checkbox(assigns) do
    ~H"""
    <Elixir.Moon.Light.Form.Field.label
      size={@size}
      class={
        merge([
          [
            "relative inline-flex items-center select-none font-normal",
            "opacity-disabled": @disabled,
            "cursor-not-allowed select-none": @readonly || @disabled
          ],
          get_config(:default_label_class),
          @checkbox_label_class
        ])
      }
      field={@field}
    >
      <input type="checkbox"
        name={@field.name <> ((@is_multiple && "[]") || "")}
        id={@id || @field.id}
        class="opacity-0"
        phx-click={(!@readonly && !@disabled && @on_click) || nil}
        readonly={@readonly}
        disabled={@disabled || @readonly}
        data-testid={@testid}
        checked={@field.value == @checked_value}
      />
      <Elixir.Moon.Light.Lego.checkbox
        is_selected={@field.value == @checked_value}
        class={
          merge([
            "absolute top-1 ltr:left-0 rtl:right-0",
            get_config(:default_class),
            @class
          ])
        }
      />
      <%= render_slot(@inner_block) || @label %>
    </Elixir.Moon.Light.Form.Field.label>
    """
  end
end
