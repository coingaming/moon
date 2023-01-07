defmodule Moon.Design.Accordion do
  @moduledoc false

  use Moon.StatefulComponent

  import Moon.Helpers.MergeClass

  prop(class, :css_class)
  prop(disabled, :boolean, default: false)

  prop(item_size, :string, values!: ["sm", "md", "lg", "xl"], default: "md")
  prop(is_content_outside, :boolean, default: false)

  prop(expanded, :list, default: [])
  prop(on_change, :event)
  prop(single_open, :boolean, default: false)

  slot(header, required: true)
  slot(content, required: true)

  def handle_event("on_change_default", _params = %{"value" => index}, socket) do
    # IO.puts("ON_CHANGE_ACCORDION ############ params = #{inspect(_params, pretty: true)}")
    index = String.to_integer(index)
    list = socket.assigns[:expanded]

    {:noreply,
     assign(socket,
       expanded:
         (Enum.member?(list, index) &&
            Enum.filter(list, &(&1 != index))) ||
           ((socket.assigns[:single_open] && [index]) || [index | list])
     )}
  end

  def render(assigns) do
    ~F"""
    <div class={merge(["flex w-full gap-2 flex-col", @class])}>
      {#for {head, index} <- Enum.with_index(make_list(@header))}
        <div class="w-full">
          <#slot
            {head}
            context_put={
              is_open: Enum.member?(@expanded, index),
              size: @item_size,
              on_change: @on_change || %{name: "on_change_default", target: @myself},
              index: index,
              is_content_outside: @is_content_outside
            }
          />
          {#if Enum.member?(@expanded, index) && slot_assigned?(:content) &&
              Enum.at(make_list(@content), index)}
            <#slot
              {Enum.at(make_list(@content), index)}
              context_put={size: @item_size, is_content_outside: @is_content_outside}
            />
          {/if}
        </div>
      {/for}
    </div>
    """
  end

  defp make_list(l) when is_list(l), do: l
  defp make_list(l), do: [l]
end
