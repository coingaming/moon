defmodule Moon.Design.Modal.Panel do
  @moduledoc false
  use Moon.StatelessComponent

  alias Moon.Autolayouts.PullAside

  prop(close, :event)
  prop(class, :css_class)

  slot(title)
  slot(content)
  slot(footer)
  slot(controls_close)

  prop(title_divider, :boolean)
  prop(footer_divider, :boolean)

  def render(assigns) do
    ~F"""
    <div class={merge([
      [
        "w-full max-w-sm inline-block transform rounded-xl bg-gohan align-middle shadow-moon-lg transition-all"
      ],
      @class
    ])}>
      <PullAside class={"pt-5 pb-4 px-6 relative", "border-b-2 border-beerus": @title_divider}>
        <:left>
          {#if slot_assigned?(:title)}
            <div class={merge([
              ["text-moon-18 text-bulma font-semibold"],
              @class
            ])}>
              <#slot {@title} />
            </div>
          {/if}
        </:left>
        <:right>
          {#if slot_assigned?(:controls_close)}
            <div class={merge([["absolute top-5 right-5 cursor-pointer"], @class])} :on-click={@close}>
              <#slot {@controls_close} />
            </div>
          {/if}
        </:right>
      </PullAside>
      {#if slot_assigned?(:content)}
        <div class={merge([["p-4 text-moon-16 text-trunks"], @class])}>
          <#slot {@content} />
        </div>
      {/if}
      {#if slot_assigned?(:footer)}
        <div class={merge([["p-4", "border-t-2 border-beerus": @footer_divider], @class])}>
          <#slot {@footer} />
        </div>
      {/if}
    </div>
    """
  end
end
