defmodule Moon.Components.Select.SingleSelect.Value do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias __MODULE__.SelectedValue

  prop select_id, :string
  prop class, :any
  prop options, :any
  prop value, :any
  prop label, :string
  prop size, :string
  prop placeholder, :string

  def render(assigns) do
    ~F"""
    {#if @value && @value != ""}
      <SelectedValue
        {=@select_id}
        option={SelectHelpers.get_option(@options, @value)}
        {=@size}
        {=@label}
      />
    {#elseif @size in ~w(large xlarge)}
      <div class="text-trunks-100 text-moon-14">
        {@label}
      </div>
    {#else}
    {/if}
    """
  end
end
