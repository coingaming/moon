defmodule Moon.Components.CheckboxMultiselectV2 do
  use Moon.StatelessComponent

  alias Moon.Components.Checkbox

  prop options, :list, required: true  # [%{ label: :string, value: :string }, ...]
  prop values, :list, required: true   # [:string]

  prop on_select, :event

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    {#for option <- @options}
      <div
        :on-click={@on_select}
        phx-value-toggled_item_id={option.value}
        class="flex justify-between py-2 pl-4 pr-2 mx-1 hover:bg-hover rounded-sm"
      >
        {option.label}
        <Checkbox class="absolute right-0 pointer-events-none" checked={Enum.member?(@values, option.value)} />
      </div>
    {/for}
    """
  end
end
