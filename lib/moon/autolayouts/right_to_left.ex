defmodule Moon.Autolayouts.RightToLeft do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default)
  prop(class, :css_class, default: nil)
  prop(gap, :css_class, default: "gap-2")
  prop(centered, :boolean, default: false)
  prop(dir, :string, values: ["ltr", "rtl"], default: "ltr")

  def render(assigns) do
    ~F"""
    <div class={"flex flex-row-reverse", @gap, @class, "items-center": @centered} {=@dir}>
      <#slot />
    </div>
    """
  end
end
