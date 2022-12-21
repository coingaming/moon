defmodule Moon.Design.Tabs.Panel do
  @moduledoc false

  use Surface.Component, slot: "panels"

  prop(class, :css_class)
end
