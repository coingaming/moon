defmodule Moon.Design.Dropdown.Options do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.MakeList
  import Moon.Helpers.Positions

  prop(value, :any, from_context: :value)
  prop(on_change, :event, from_context: :on_change)
  prop(is_open, :boolean, from_context: :is_open)

  prop(size, :string, values!: ~w(sm md lg), default: "md")
  prop(class, :css_class)
  prop(position, :string, values: position_list())

  prop(titles, :list, default: [])
  prop(option_module, :atom, default: Moon.Design.Dropdown.Option)

  prop(testid, :string)
  prop(id, :string)

  slot(option)
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      class={merge([
        "flex flex-col absolute z-[99]",
        "p-1 rounded-moon-s-md box-border bg-gohan shadow-moon-lg overflow-y-auto focus:outline-none",
        (@position && position_class(@position)) || "w-full top-full my-2",
        @class,
        hidden: !@is_open
      ])}
      {=@id}
      data-testid={@testid}
    >
      {#if slot_assigned?(:option)}
        {#for {option, index} <- Enum.with_index(make_list(@option))}
          <#slot
            {option}
            context_put={
              is_selected: Enum.member?(make_list(@value), option.value || "#{index}"),
              size: @size,
              on_click: @on_change,
              value: index
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
        >{title}</.moon>
      {/if}
      <#slot />
    </div>
    """
  end
end
