defmodule Moon.Components.Stack do
  use Moon.StatelessComponent
  slot default
  prop class, :string
  prop space, :string, default: "default"

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/components/stack")}

    <div class={
      "#{@class}",
      "grid gap-[var(--space--default)]": @space == "default",
      "grid gap-[var(--space--xsmall)]": @space == "xsmall",
      "grid gap-[var(--space--small)]": @space == "small",
      "grid gap-[var(--space--medium)]": @space == "medium",
      "grid gap-[var(--space--large)]": @space == "large",
      "grid gap-[var(--space--xlarge)]": @space == "xlarge",
      "mt-[var(--space--default)]": @space == "default",
      "mt-[var(--space--xsmall)]": @space == "xmall",
      "mt-[var(--space--small)]": @space == "small",
      "mt-[var(--space--medium)]": @space == "medium",
      "mt-[var(--space--large)]": @space == "large",
      "mt-[var(--space--xlarge)]": @space == "xlarge"
    }>
      <#slot />
    </div>
    """
  end
end
