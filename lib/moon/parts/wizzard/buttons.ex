defmodule Moon.Parts.Wizard.Buttons do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Parts.Button

  alias Moon.Parts.Wizard

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Additional Tailwind classes for container"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "On save event, button is appeared if set & wizard is completed"
  prop(on_save, :event)
  @doc "Next button click event"
  prop(on_next, :event, from_context: :on_next)
  @doc "Previous button click event"
  prop(on_prev, :event, from_context: :on_prev)
  @doc "Cancel button click event, button is appeared if set"
  prop(on_cancel, :event)

  @doc "Values for a button to be sent on server by those events"
  prop(values, :map, from_context: :button_values)

  @doc "Additional buttons etc."
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-testid={@testid}
      class={merge(["absolute w-3/4 md:w-2/3 end-0 bottom-0 px-4 md:px-8 flex justify-between", @class])}
    >
      <#slot>
        <Wizard.ButtonsBlock class="md:inline hidden">
          <Button.White
            :if={@on_cancel}
            {=@values}
            on_click={@on_cancel}
            class="min-w-[7.5rem] justify-self-start"
          >Cancel</Button.White>
        </Wizard.ButtonsBlock>

        <Wizard.ButtonsBlock class="justify-center md:justify-end">
          <Button.White
            :if={@on_prev}
            {=@values}
            on_click={@on_prev}
            class="min-w-[5.5rem] md:min-w-[7.5rem]"
            disabled={@values[:selected] <= 0}
          >Previous</Button.White>

          <Button
            :if={@on_next && @values[:selected] < @values[:total] - 1}
            {=@values}
            on_click={@on_next}
            class="min-w-[5.5rem] md:min-w-[7.5rem]"
          >Next</Button>

          <Button
            :if={@on_save && @values[:selected] >= @values[:total] - 1}
            {=@values}
            on_click={@on_save}
            class="min-w-[5.5rem] md:min-w-[7.5rem]"
          >Save</Button>
        </Wizard.ButtonsBlock>
      </#slot>
    </div>
    """
  end
end
