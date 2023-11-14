defmodule Moon.Parts.Avatar do
  @moduledoc false

  use Moon.StatelessComponent

  use Moon.Design.Avatar.Properties

  alias Moon.Design.Avatar
  alias Moon.Icon

  def render(assigns) do
    ~F"""
    <Avatar
      {=@id}
      {=@testid}
      class={merge(["rounded-full text-goku bg-cell overflow-visible", @class])}
      size="sm"
      {=@name}
      {=@image_url}
    >
      {#if slot_assigned?(:default)}
        <#slot />
      {#else}
        <span :if={@name && !@image_url}>{@name}</span>
        <Icon name="generic_user" class="text-moon-24" :if={!@name && !@image_url} />
      {/if}
      <#slot {@status} />
    </Avatar>
    """
  end
end
