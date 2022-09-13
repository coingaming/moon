defmodule Moon.Components.Select.Dropdown.Footer do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.PullAside

  slot cancel
  slot clear
  slot confirm

  def render(assigns) do
    ~F"""
    <PullAside>
      <:left>
        {#if slot_assigned?(:clear)}
          <#slot name="clear" />
        {/if}
      </:left>
      <:right>
        <LeftToRight>
          {#if slot_assigned?(:cancel)}
            <#slot name="cancel" />
          {/if}
          {#if slot_assigned?(:confirm)}
            <#slot name="confirm" />
          {/if}
        </LeftToRight>
      </:right>
    </PullAside>
    """
  end
end
