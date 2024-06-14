defmodule Moon.Design.Form.Combobox.NoResults do
  use Moon.StatelessComponent, slot: "option"

  @doc "Label for the not found option"
  prop(not_found_label, :string, default: "Nothing found.")

  def render(assigns) do
    ~F"""
    <div class="relative cursor-default select-none py-2 px-4 text-trunks" role="none">
      {@not_found_label}
    </div>
    """
  end
end
