defmodule Moon.Parts.Table.Column do
  @moduledoc false

  use Moon.StatelessComponent, slot: "cols"

  @doc "Is used for sorting"
  prop(name, :string)
  @doc "The title of the column"
  prop(label, :string)
  @doc "The is the column sortable"
  prop(sortable, :boolean, default: false)
  @doc "Can be used for adding any class to both th & td tags"
  prop(width, :css_class, default: "text-moon-16 text-trunks py-4 px-4 font-normal h-16")
  @doc "Simple additional css class, will be added to td tag only"
  prop(class, :css_class,
    default:
      "text-moon-18 text-bulma py-4 px-4 first:rounded-l-moon-s-none last:rounded-r-moon-s-none border-y-[0.5px] border-beerus font-dm-sans"
  )
end
