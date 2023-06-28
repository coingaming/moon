defmodule Moon.Design.Search do
  @moduledoc "Textinput with search options. Renders as a Moon.Design.Dropdown. Is designed for usage outside of the forms"

  use Moon.StatelessComponent

  alias Moon.Design.Dropdown
  alias __MODULE__

  import Moon.Helpers.Form, only: [input_classes_light: 1]

  @doc "... format: [%{key: shown_label, value: option_value, disabled: bool}], diisabled is optional"
  prop(options, :list, required: true)
  @doc "Well, disabled"
  prop(disabled, :boolean)
  @doc "Some prompt to be shown on empty value"
  prop(prompt, :string)
  @doc "Id of the component"
  prop(id, :string, required: true)
  @doc "Common moon size property"
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  @doc "Additional classes for the <select> tag"
  prop(class, :css_class, from_context: :class)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "Some additional styling will be set to indicate field is iinvalid"
  prop(error, :boolean, from_context: :error)
  @doc "Should dropdown be open"
  prop(is_open, :boolean)
  @doc "Filtering value for the options, appears in input"
  prop(filter, :string)

  @doc "On key up event for the input - use it for filter options"
  prop(on_keyup, :event)
  @doc "Event that fires when smth is chosen from the dropdown menu"
  prop(on_change, :event)

  @doc "Option for custom stylings - use it to show icons or anything else"
  slot(default)
  @doc "Trigger element for the dropdown, default is Dropdown.Select"
  slot(trigger)
  @doc "Slot used for rendering single option. option[:key] will be used if not given"
  slot(option)

  def render(assigns) do
    ~F"""
    <div {=@id} class={merge(["w-full", @class])} data-testid={@testid}>
      <Dropdown id={"#{@id}-dropdown"} {=@is_open} hook="Combobox">
        <:trigger :let={is_open: is_open}>
          <#slot {@trigger, is_open: is_open}>
            <Dropdown.Input
              placeholder={@prompt}
              {=@size}
              {=is_open}
              {=@error}
              {=@disabled}
              {=@on_keyup}
              value={@filter}
              class={
                "ps-[2.5rem]",
                input_classes_light(assigns),
                "rounded-bl-none rounded-br-none": is_open
              }
            >
              <Search.Icon />
              <Search.Button on_click={@on_keyup} />
            </Dropdown.Input>
          </#slot>
        </:trigger>
        <#slot {@default}>
          <Dropdown.Options {=@on_change} class="pt-0 mt-0 rounded-tl-none rounded-tr-none">
            <Dropdown.Option :for={option <- @options} {=@size} disabled={option[:disabled]}>
              <#slot {@option, option: option}>{option[:key]}</#slot>
            </Dropdown.Option>
          </Dropdown.Options>
        </#slot>
      </Dropdown>
    </div>
    """
  end
end
