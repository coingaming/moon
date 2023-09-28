defmodule Moon.Design.Button do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.AsComponent
  alias Moon.Design.Button.Utils
  alias Moon.Icon
  alias Moon.Design.Loader

  @doc "Visual/Logical variant of button."
  prop(variant, :string,
    values: ["fill", "outline", "ghost", "primary", "secondary", "tertiary"],
    default: "fill"
  )

  @doc "Size of button"
  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "md")
  @doc "Rendered HTML element"
  prop(as, :string, values!: ~w(a button), default: "button")
  @doc "A href attribute when prop as=\"a\""
  prop(href, :string)
  @doc "Full width button"
  prop(full_width, :boolean)
  @doc "Disabled button"
  prop(disabled, :boolean)
  @doc "Animation of button"
  prop(animation, :string, values: ~w(progress success error pulse))
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes for hover background"
  prop(hover_bg_class, :css_class)
  @doc "Type attribute for DOM element"
  prop(type, :string, default: "button")
  @doc "Form attribute for DOM element"
  prop(form, :string)
  @doc "On click event"
  prop(on_click, :event)
  @doc "list of additional values to associate with the DOM element"
  prop(values, :keyword, default: [])
  @doc "Value attribute for DOM element"
  prop(value, :string)
  @doc "Left icon"
  prop(left_icon, :string)
  @doc "Right icon"
  prop(right_icon, :string)
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional attributes for DOM element"
  prop(attrs, :keyword, default: [])
  @doc "Aria label attribute for DOM element"
  prop(aria_label, :string)
  @doc "Target attribute for DOM element"
  prop(target, :string)
  @doc "Rel attribute for DOM element"
  prop(rel, :string)
  @doc "Inner content of the component"
  slot(default)
  @doc "Right icon slot"
  slot(right_icon_slot)
  @doc "Left icon slot"
  slot(left_icon_slot)

  def render(assigns) do
    ~F"""
    <AsComponent
      {=@as}
      {=@href}
      {=@id}
      class={merge([
        [
          "flex row justify-center items-center relative overflow-hidden active:scale-90 transition-all duration-200 font-semibold group z-0",
          "whitespace-nowrap select-none",
          Utils.get_button_size_classes(@size),
          "#{Utils.get_no_icon_padding(@size)}": !@right_icon && !@left_icon,
          "#{Utils.get_right_icon_paddings(@size)}": @right_icon && !@full_width,
          "#{Utils.get_left_icon_paddings(@size)}": @left_icon && !@full_width,
          "#{Utils.get_full_width_padding(@size)}": @full_width,
          "w-full": @full_width,
          "text-goten bg-piccolo": @variant in ["primary", "fill"],
          "border border-solid bg-transparent text-bulma border-trunks hover:border-bulma":
            @variant in ["secondary", "outline"],
          "bg-hit text-goten": @variant in ["tertiary"],
          "bg-none text-trunks hover:text-bulma": @variant in ["ghost"],
          "opacity-60 cursor-not-allowed active:transform-none": @disabled,
          "anim-pulse animate-[pulse2_1.5s_infinite]": @animation == "pulse",
          "bg-chichi text-goten animate-[error_0.82s_cubic-bezier(0.36,0.07,0.19,0.97)_1_both] anim-error":
            @animation == "error"
        ],
        @class
      ])}
      on_click={@on_click}
      testid={@testid}
      {=@aria_label}
      {=@values}
      {=@value}
      {=@target}
      {=@rel}
      attrs={[
        disabled: @disabled,
        type: @type,
        form: @form,
        "data-size": @size
      ] ++ @attrs}
    >
      {#if @animation}
        {animation_content(assigns)}
        <span class={"flex gap-2 items-center", "opacity-0": @animation in ["success", "progress"]}>
          {content(assigns)}
        </span>
      {#else}
        {content(assigns)}
      {/if}
      <span class={merge(hover_overlay_classes() ++ [@hover_bg_class])} />
    </AsComponent>
    """
  end

  defp animation_content(assigns) do
    ~F"""
    <span
      :if={@animation in ["success", "progress"]}
      class="flex absolute top-1/2 left-1/2 translate-y-[-50%] translate-x-[-50%] content-center justify-center"
    >
      {#if @animation == "progress"}
        <Loader color="currentColor" size={if @size == "xs", do: "2xs", else: "xs"} />
      {#elseif @animation == "success"}
        <Icon name="generic_check_alternative" color="currentColor" class={Utils.icon_class(@size)} />
      {/if}
    </span>
    """
  end

  defp content(assigns) do
    ~F"""
    {#if slot_assigned?(:left_icon_slot)}
      <#slot {@left_icon_slot} />
    {#else}
      <Icon
        name={@left_icon}
        class={
          Utils.icon_class(@size),
          "#{Utils.left_icon_horizontal_position(@size)}": @full_width
        }
        :if={@left_icon}
      />
    {/if}
    <#slot />
    {#if slot_assigned?(:right_icon_slot)}
      <#slot {@right_icon_slot} />
    {#else}
      <Icon
        name={@right_icon}
        class={
          Utils.icon_class(@size),
          "#{Utils.right_icon_horizontal_position(@size)}": @full_width
        }
        :if={@right_icon}
      />
    {/if}
    """
  end

  defp hover_overlay_classes() do
    [
      "block absolute inset-0 pointer-events-none bg-transparent transition-[background-color_0.2s_ease-in-out z-[-1] group-hover:bg-heles"
    ]
  end
end
