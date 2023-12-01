defmodule Moon.Design.Table.Input do
  @moduledoc "Input styled to use inside the tables"

  use Moon.StatelessComponent

  @doc "Data-testid attribute for html tag"
  prop(testid, :string)
  @doc "Id attribute for html tag"
  prop(id, :string)
  @doc "Additional CSS classes for the html tag"
  prop(class, :css_class)

  @doc "Text to be shown when no value given"
  prop(placeholder, :string)
  @doc "Value to be shown"
  prop(value, :string)
  @doc "If the item should be marked as disabled"
  prop(disabled, :boolean)

  prop(values, :any, default: %{})

  @doc "Keyword | Map of additional attributes for the input"
  prop(opts, :any, default: %{})

  @doc "On change event for the input"
  prop(on_change, :event)
  @doc "On keyup event for the input"
  prop(on_keyup, :event)
  @doc "On focus event for the input"
  prop(on_focus, :event)
  @doc "On blur event for the input"
  prop(on_blur, :event)

  def render(assigns) do
    ~F"""
    <input
      {=@value}
      {=@id}
      {=@placeholder}
      data-testid={@testid}
      {=@disabled}
      autocomplete="off"
      class={merge([
        "block w-full max-w-full py-0 px-1 m-0 appearance-none text-bulma transition-shadow box-border relative z-[2]",
        "bg-transparent hover:bg-heles focus:shadow-input-cell-focus focus:outline-none focus:bg-heles",
        "focus-visible::shadow-input-cell-focus focus-visible::outline-none focus-visible::bg-heles rounded-moon-i-xs",
        "rtl:[&:not([disabled])]:[&:not([readonly])]:[&:not([readonly])]:hover:rounded-moon-i-xs",
        "rtl:[&:not([disabled])]:[&:not([readonly])]:focus:rounded-moon-i-xs rtl:invalid:rounded-moon-i-xs",
        "ltr:[&:not([disabled])]:[&:not([readonly])]:hover:rounded-moon-i-xs ltr:[&:not([disabled])]:[&:not([readonly])]:focus:rounded-moon-i-xs",
        "ltr:invalid:rounded-moon-i-xs before:box-border after:box-border placeholder:text-trunks placeholder:opacity-100",
        "placeholder:transition-opacity placeholder:delay-75 read-only:outline-0 read-only:border-none",
        "read-only:cursor-not-allowed read-only:hover:shadow-input read-only:focus:shadow-input",
        "read-only:focus-visible:shadow-input input-dt-shared invalid:shadow-input-err invalid:hover:shadow-input-err",
        "invalid:focus:shadow-input-err invalid:focus-visible:shadow-input-err",
        @class
      ])}
      :on-change={@on_change}
      :on-keyup={@on_keyup}
      :on-focus={@on_focus}
      :on-blur={@on_blur}
      {...@opts}
      :values={@values}
    />
    """
  end
end
