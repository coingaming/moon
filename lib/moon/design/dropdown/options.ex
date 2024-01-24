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
  @doc "List of the options. Used when no option slot is given "
  prop(titles, :list, default: [])
  @doc "Option module"
  prop(option_module, :atom, default: Moon.Design.Dropdown.Option)
  @doc "Data-testid attribute for div"
  prop(testid, :string)
  @doc "Id attribute for div"
  prop(id, :string)
  @doc "Max visible options without scrolling"
  prop(max_visible_options, :integer, values!: [3, 5, 7], default: 7)

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
        [hidden: !@is_open, "p-0": slot_assigned?(:header) || slot_assigned?(:footer)],
        get_config(:default_class),
        get_max_h_classes(@max_visible_options, get_options(assigns), @size),
        @class
      ])}
      {=@id}
      data-testid={@testid}
      data-options-length={get_options(assigns) |> length}
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
      <#slot context_put={
        size: @size,
        on_click: @on_change,
        values: @values
      } />
      <#slot {@footer} />
    </div>
    """
  end

  defp get_options(assigns), do: assigns[:option] || assigns[:titles]

  defp get_max_h_classes(max_length, list, "sm") when is_list(list) and is_integer(max_length) do
    case max_length do
      x when length(list) < x ->
        []

      3 ->
        ~w(dropdown-options-scrollable border-r-transparent border-r-4 overflow-y-scroll max-h-scrollable-dropdown-sm-3)

      5 ->
        ~w(dropdown-options-scrollable border-r-transparent border-r-4 overflow-y-scroll max-h-scrollable-dropdown-sm-5)

      _ ->
        ~w(dropdown-options-scrollable border-r-transparent border-r-4 overflow-y-scroll max-h-scrollable-dropdown-sm-7)
    end
  end

  defp get_max_h_classes(max_length, list, "md") when is_list(list) and is_integer(max_length) do
    case max_length do
      x when length(list) < x ->
        []

      3 ->
        ~w(dropdown-options-scrollable border-r-transparent border-r-4 overflow-y-scroll max-h-scrollable-dropdown-md-3)

      5 ->
        ~w(dropdown-options-scrollable border-r-transparent border-r-4 overflow-y-scroll max-h-scrollable-dropdown-md-5)

      _ ->
        ~w(dropdown-options-scrollable border-r-transparent border-r-4 overflow-y-scroll max-h-scrollable-dropdown-md-7)
    end
  end

  defp get_max_h_classes(max_length, list, "lg") when is_list(list) and is_integer(max_length) do
    case max_length do
      x when length(list) < x ->
        []

      3 ->
        ~w(dropdown-options-scrollable border-r-transparent border-r-4 overflow-y-scroll max-h-scrollable-dropdown-lg-3)

      5 ->
        ~w(dropdown-options-scrollable border-r-transparent border-r-4 overflow-y-scroll max-h-scrollable-dropdown-lg-5)

      _ ->
        ~w(dropdown-options-scrollable border-r-transparent border-r-4 overflow-y-scroll max-h-scrollable-dropdown-lg-7)
    end
  end

  defp get_max_h_classes(_, _, _), do: []
end
