defmodule Moon.Design.Dropdown.BottomOptions do
  @moduledoc "Options list for the Dropdown component"

  # TODO: add panel position options, currently only bottom

  use Moon.StatelessComponent

  import Moon.Helpers.MakeList

  @doc "Value of the selected option(s)"
  prop(value, :any, from_context: :value)
  @doc "On option click event, in most cases got from context"
  prop(on_change, :event, from_context: :on_change)
  @doc "Click event, in most cases got from context"
  prop(on_close, :event, from_context: :close_me)
  @doc "If the optionlist is open, got from context"
  prop(is_open, :boolean, from_context: :is_open)

  @doc "Size of the options"
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  @doc "Additional CSS classes for the div"
  prop(class, :css_class)

  @doc "List of the options. Used when no "
  prop(titles, :list, default: [])
  prop(option_module, :atom, default: Moon.Design.Dropdown.Option)

  @doc "Data-testid attribute for div"
  prop(testid, :string)
  @doc "Id attribute for div"
  prop(id, :string)

  @doc """
  Experimental: makes BottomSheet behave as Modal on some screen widths,
  please reffer to https://tailwindcss.com/docs/screens
  """
  prop(as_dropdown_on, :string, values: ~w(sm md lg xl 2xl), from_context: :as_dropdown_on)

  slot(option)
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      class={merge([
        "fixed inset-x-0 w-full z-[99999] bottom-0 rounded-t-xl shadow-moon-lg box-border bg-gohan shadow-moon-lg overflow-y-auto focus:outline-none",
        dropdown_classes(@as_dropdown_on),
        @class,
        hidden: !@is_open,
        "flex flex-col absolute z-[99] p-1 my-2 w-full top-full rounded-moon-s-md bottom-auto":
          !@as_dropdown_on
      ])}
      {=@id}
      data-testid={@testid}
      :on-click-away={@on_close}
      role="listbox"
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

  defp dropdown_classes(nil), do: []

  defp dropdown_classes(size) do
    ~w(absolute z-[99] bottom-auto rounded-moon-s-md my-2 shadow-moon-lg box-border top-full)
    |> Enum.map(&"#{size}:#{&1}")
  end
end
