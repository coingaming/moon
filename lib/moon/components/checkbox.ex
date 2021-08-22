defmodule Moon.Components.Checkbox do
  use Moon.StatelessComponent

  prop(on_click, :event)
  prop(checked, :boolean)
  prop(disabled, :boolean)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/components/checkbox")}

    <label class={"relative inline-flex items-center mt-3 #{@class}"}>
      <input
        type="checkbox"
        checked={@checked}
        disabled={@disabled}
        class="border disabled:text-hit-120  border-solid
               border-trunks-100 disabled:border-beerus-100 text-piccolo-100 cursor-pointer focus:ring-transparent
               whitespace-nowrap overflow-hidden"
      />
      <span class="ml-[var(--space--default)] text-trunks-100 cursor-pointer inline-block before:after:m-space-default
                after:m-space-default before:transition-duration-default
                after:before:transition-duration-default before:ease-linear after:ease-linear
                before:bg-goku-40 before:rounded-full before:opacity-0 before:transform-none
                after:bg-transparent after:transition-colors before:left-0 after:left-0
                transition before:transition-default after:transition-default
                before:ease-in after:ease-in before:w-[var(--space--default)] after:w-[var(--space--default)]
                before:h-[var(--space--default)] after:h-[var(--space--default)]
                before:absolute after:absolute">
        <#slot />
      </span>
    </label>
    """
  end
end
