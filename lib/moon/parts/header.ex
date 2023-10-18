defmodule Moon.Parts.Header do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Title slot"
  slot(title, required: true)
  @doc "Descrption slot"
  slot(description)
  @doc "Breadcrumbs slot"
  slot(breadcrumbs)
  @doc "ButtonGroup slot"
  slot(button_group)
  @doc "Left button slot for mobile view"
  slot(left_button)
  @doc "Right button slot for mobile view"
  slot(right_button)

  def render(assigns) do
    ~F"""
    <header
      {=@id}
      data-testid={@testid}
      class={merge(["w-full fixed top-0 bg-goku z-50 theme-moon-dark", @class])}
    >
      <div class="w-full p-4 lg:p-8 flex flex-row justify-between">
        {#if slot_assigned?(:description)}
          <div class="flex flex-col">
            <div class={
              "lg:mb-6": slot_assigned?(:breadcrumbs) || slot_assigned?(:title),
              "lg:mb-0 mb-6": slot_assigned?(:left_button) && !slot_assigned?(:breadcrumbs),
              "lg:mb-0 mb-6": slot_assigned?(:title) && !slot_assigned?(:breadcrumbs),
              "mb-6": slot_assigned?(:title) && slot_assigned?(:description),
              "mb-[4.5rem]": slot_assigned?(:right_button) && !slot_assigned?(:left_button)
            }>
              <#slot {@breadcrumbs} />
              <#slot {@left_button} />
            </div>
            <div class="flex flex-col">
              <#slot {@title} />
              <#slot {@description} />
            </div>
          </div>
          <div class="mb-6">
            <#slot {@button_group} />
            <#slot {@right_button} />
          </div>
        {#else}
          <div class="flex flex-row lg:flex-col flex-row justify-between lg:w-fit w-full items-center lg:items-start">
            <div class={
              "lg:mb-6": slot_assigned?(:breadcrumbs),
              "mb-0": slot_assigned?(:title) && !slot_assigned?(:breadcrumbs)
            }>
              <#slot {@breadcrumbs} />
              <#slot {@left_button} />
            </div>
            <#slot
              {@title}
              context_put={
                header_class: "text-moon-24 lg:text-moon-32",
                title_only: slot_assigned?(:title) && !slot_assigned?(:description)
              }
            />
            <div>
              <#slot {@right_button} />
            </div>
          </div>
          <#slot {@button_group} />
        {/if}
      </div>
    </header>
    """
  end
end
