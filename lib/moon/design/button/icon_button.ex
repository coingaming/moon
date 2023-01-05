defmodule Moon.Design.Button.IconButton do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon
  alias Moon.Components.Loader
  alias Moon.Design.Button.Utils

  prop(variant, :string,
    values: ["primary", "secondary", "tertiary", "ghost"],
    default: "primary"
  )

  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "md")
  prop(disabled, :boolean)
  prop(animation, :string, values: ~w(progress success error pulse))
  prop(class, :css_class)
  prop(no_hover_bg, :boolean, default: false)

  prop(icon_only, :string)

  prop(type, :string, default: "button")
  prop(form, :string)
  prop(testid, :string)
  prop(on_click, :event)
  prop(value_name, :string)
  prop(value, :any)
  prop(values, :keyword, default: [])

  def render(assigns) do
    ~F"""
    <button
      class={
        "flex row justify-center items-center gap-2 relative overflow-hidden active:scale-90 transition-all font-semibold",
        @class,
        Utils.get_icon_button_size_classes(@size),
        "text-goten bg-piccolo": @variant in ["primary"],
        "border border-solid bg-transparent text-bulma border-trunks hover:border-bulma":
          @variant in ["secondary"],
        "bg-hit text-goten": @variant in ["tertiary"],
        "bg-none text-trunks hover:text-bulma": @variant in ["ghost"],
        "opacity-30": @disabled,
        "anim-pulse animate-[pulse2_1.5s_infinite]": @animation == "pulse",
        "bg-chi-chi text-goten animate-[error_0.82s_cubic-bezier(0.36,0.07,0.19,0.97)_1_both] anim-error":
          @animation == "error"
      }
      disabled={@disabled}
      type={@type}
      form={@form}
      data-size={@size}
      data-testid={@testid}
      :on-click={@on_click}
      :values={@values}
      {...phx_val_tag(@value_name || (@value && "click_value") || nil, @value)}
    >
      <span
        :if={@animation in ["success", "progress"]}
        class="flex absolute top-1/2 left-1/2 translate-y-[-50%] translate-x-[-50%] content-center justify-center"
      >
        {#if @animation == "progress"}
          <Loader color="currentColor" size="sm" />
        {#elseif @animation == "success"}
          <Icon name="generic_check_alternative" color="currentColor" class={Utils.icon_class(@size)} />
        {/if}
      </span>
      <span class={
        "flex justify-center items-center",
        "opacity-0": @animation in ["success", "progress"]
      }>
        <Icon name={@icon_only} class={Utils.icon_class(@size)} />
      </span>
      <span :if={!@no_hover_bg} class="block absolute inset-0 bg-transparent hover:bg-primary-hover" />
    </button>
    """
  end

  defp phx_val_tag(nil, _), do: []

  defp phx_val_tag(name, value) do
    # credo:disable-for-next-line Credo.Check.Warning.UnsafeToAtom
    key = String.to_atom("phx-value-#{name}")
    [{key, value}]
  end
end
