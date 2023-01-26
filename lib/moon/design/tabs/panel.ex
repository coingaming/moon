defmodule Moon.Design.Tabs.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "panels"

  prop(class, :css_class)
end
