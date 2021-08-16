defmodule Moon.Components.TextInput.TextInputInternal do
  use Moon.StatelessComponent

  alias Surface.Components.Form.TextInput

  prop(field, :atom)

  prop(type, :string,
    default: "text",
    values: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "url",
      "time",
      "url"
    ]
  )

  prop(value, :string)
  prop(placeholder, :string)
  prop(error, :string)
  prop(rounded, :boolean)
  prop(disabled, :boolean)
  prop(required, :boolean)
  prop(left_icon, :string)
  prop(right_icon, :string)
  prop(class, :string)
  prop(on_focus, :event)
  prop(on_blur, :event)

  def render(assigns) do
    ~F"""
    <TextInput
      class={
        "w-full h-12 max-w-full px-4 bg-goku-100 hover:bg-goku-120 text-base leading-normal
                    text-color-bulma-100 box-border border border-solid border-beerus-100 rounded transition
                    ease-in placeholder-trunks-100 placeholder-opacity-100 disabled:opacity-50
                    disabled:cursor-not-allowed focus:border-piccolo-100 focus:outline-none
                    no-scrollbar invalid:shadow-none invalid:border-chi-chi-100 #{@class}",
        "pl-11": @left_icon,
        "pr-11": @right_icon,
        "border-chi-chi-100": @error
      }
      field={@field}
      opts={[
        placeholder: @placeholder,
        disabled: @disabled,
        required: @required
      ]}
      value={@value}
      focus={@on_focus}
      blur={@on_blur}
    />
    """
  end
end

defmodule Moon.Components.TextInput do
  use Moon.StatelessComponent

  alias __MODULE__.TextInputInternal
  alias Moon.Components.Label

  prop(field, :atom)
  prop(label, :string)

  prop(type, :string,
    default: "text",
    values: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "url",
      "time",
      "url"
    ]
  )

  prop(value, :string)
  prop(placeholder, :string)
  prop(error, :string)
  prop(rounded, :boolean)
  prop(disabled, :boolean)
  prop(required, :boolean)
  prop(class, :string)
  prop(on_focus, :event)
  prop(on_blur, :event)

  slot left_icon
  slot right_icon

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/components/text-input")}

    {#if @label}
      <Label text={@label}>
        <div class="mt-2 relative">
          <div
            :if={slot_assigned?(:left_icon)}
            class="absolute inset-y-0 left-0 pl-4 flex items-center text-trunks-100"
          >
            <#slot name="left_icon" />
          </div>

          <div
            :if={slot_assigned?(:right_icon)}
            class="absolute inset-y-0 right-0 pr-4 flex items-center text-trunks-100"
          >
            <#slot name="right_icon" />
          </div>

          <TextInputInternal
            {=@class}
            {=@field}
            {=@error}
            {=@placeholder}
            {=@disabled}
            {=@required}
            left_icon={slot_assigned?(:left_icon)}
            right_icon={slot_assigned?(:right_icon)}
            {=@value}
            {=@on_focus}
            {=@on_blur}
          />
        </div>
      </Label>
    {#else}
      <div class="relative">
        <div
          :if={slot_assigned?(:left_icon)}
          class="absolute inset-y-0 left-0 pl-4 flex items-center text-trunks-100"
        >
          <#slot name="left_icon" />
        </div>

        <div
          :if={slot_assigned?(:right_icon)}
          class="absolute inset-y-0 right-0 pr-4 flex items-center text-trunks-100"
        >
          <#slot name="right_icon" />
        </div>

        <TextInputInternal
          {=@class}
          {=@field}
          {=@error}
          {=@placeholder}
          {=@disabled}
          {=@required}
          left_icon={slot_assigned?(:left_icon)}
          right_icon={slot_assigned?(:right_icon)}
          {=@value}
          {=@on_focus}
          {=@on_blur}
          :if={!@label}
        />
      </div>
    {/if}
    """
  end
end
