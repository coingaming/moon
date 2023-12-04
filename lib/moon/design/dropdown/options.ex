defmodule Moon.Design.Dropdown.Options do
  @moduledoc "Options list for the Dropdown component"

  use Moon.StatelessComponent

  import Moon.Helpers.MakeList
  import Moon.Helpers.Positions

  @doc "Value of the selected option(s)"
  prop(value, :any, from_context: :value)
  @doc "On option click event, in most cases got from context"
  prop(on_change, :event, from_context: :on_change)
  @doc "If the optionlist is open, got from context"
  prop(is_open, :boolean, from_context: :is_open)

  @doc "Size of the options"
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  @doc "Additional CSS classes for the div"
  prop(class, :css_class)
  @doc "Specifies the position of the dropdown"
  prop(position, :string, values: position_list())
  @doc "Additional values to be passed"
  prop(values, :map, from_context: :values)

  @doc "List of the options. Used when no "
  prop(titles, :list, default: [])
  prop(option_module, :atom, default: Moon.Design.Dropdown.Option)

  @doc "Data-testid attribute for div"
  prop(testid, :string)
  @doc "Id attribute for div"
  prop(id, :string)

  slot(option)
  slot(default)
  slot(header)
  slot(footer)

  def render(assigns) do
    ~F"""
    <div
      class={merge([
        "flex flex-col absolute z-[99]",
        "p-1 rounded-moon-s-md box-border bg-goku shadow-moon-lg overflow-y-auto focus:outline-none",
        (@position && position_class(@position)) || "w-full top-full my-2",
        @class,
        hidden: !@is_open,
        "p-0": slot_assigned?(:header) || slot_assigned?(:footer)
      ])}
      {=@id}
      data-testid={@testid}
      role="listbox"
    >
      <#slot {@header} />
      {#if slot_assigned?(:option)}
        {#for {option, index} <- Enum.with_index(make_list(@option))}
          <#slot
            {option}
            context_put={
              is_selected: Enum.member?(make_list(@value), option.value || "#{index}"),
              size: @size,
              on_click: @on_change,
              value: index,
              values: @values
            }
          />
        {/for}
      {#else}
        <.moon
          :for={title <- @titles}
          module={@option_module}
          is_selected={Enum.member?(make_list(@value), title)}
          {=@size}
          on_click={@on_change}
          value={title}
          values={@values}
        >{title}</.moon>
      {/if}
      <#slot />
      <#slot {@footer} />
    </div>
    """
  end
end
