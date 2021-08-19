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

    <label class={"inline-flex items-center mt-3 #{@class}"}>
      <input
        type="checkbox"
        checked={@checked}
        disabled={@disabled}
        class="border disabled:text-hit-120 disabled:border-trunks-100 border-solid border-beerus-100 text-piccolo-100 focus:ring-transparent"
      />
      <span class="moon-checkbox-caption">
        <#slot />
      </span>
    </label>
    """
  end
end
