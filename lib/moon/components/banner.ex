defmodule MoonComponents.Banner.Container do
  @moduledoc false

  use Moon.StatelessComponent

  prop is_mobile, :boolean, default: false
  prop has_buttons, :boolean, default: false

  slot default

  def render(assigns) do
    ~F"""
    <div class={
      "w-full bg-goten-100 rounded-moon-s-sm",
      get_container_padding(@is_mobile),
      get_container_display(@has_buttons, @is_mobile)
    }>
      <#slot />
    </div>
    """
  end

  defp get_container_padding(is_mobile) do
    if is_mobile do
      "p-4"
    else
      "p-6"
    end
  end

  defp get_container_display(has_buttons, is_mobile) do
    if has_buttons && !is_mobile do
      "flex flex-row justify-between"
    else
      "block"
    end
  end
end

defmodule MoonComponents.Banner.Body do
  @moduledoc false

  use Moon.StatelessComponent

  prop is_multiline, :boolean, default: true

  slot default

  def render(assigns) do
    ~F"""
    <div class={"items-center", get_body_classes(@is_multiline)}>
      <#slot />
    </div>
    """
  end

  defp get_body_classes(is_multiline) do
    if is_multiline do
      "grid grid-rows-[1fr_1fr]"
    else
      "flex gap-2"
    end
  end
end

defmodule MoonComponents.Banner.BodyContent do
  @moduledoc false

  use Moon.StatelessComponent

  prop is_multiline, :boolean, default: true

  slot default

  def render(assigns) do
    ~F"""
    <div class={"content-center align-middle", get_body_content_classes(@is_multiline)}>
      <#slot />
    </div>
    """
  end

  defp get_body_content_classes(is_multiline) do
    if is_multiline do
      "block"
    else
      "flex"
    end
  end
end

defmodule MoonComponents.Banner.BodyButtonContainer do
  @moduledoc false

  use Moon.StatelessComponent

  slot default

  def render(assigns) do
    ~F"""
    <div class="flex gap-2 items-center justify-end">
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.Banner do
  @moduledoc false

  use Moon.StatelessComponent

  alias MoonComponents.Banner.Container
  alias MoonComponents.Banner.Body
  alias MoonComponents.Banner.BodyContent
  alias MoonComponents.Banner.BodyButtonContainer

  prop description, :string, required: true
  prop title, :string
  prop is_multiline, :boolean, default: true
  prop is_mobile, :boolean, default: false

  slot icon_header_slot
  slot buttons_slot
  slot link_slot

  def render(assigns) do
    ~F"""
    <Container
      is_mobile={@is_mobile}
      has_buttons={slot_assigned?(:buttons_slot)}
    >
      <Body :if={!@is_multiline} is_multiline={@is_multiline}>
        <BodyContent is_multiline={@is_multiline}>{@description}</BodyContent>
        <BodyButtonContainer><#slot name="link_slot" /></BodyButtonContainer>
      </Body>
      <Body :if={@is_multiline} is_multiline={@is_multiline}>
        <div class="grid justify-end grid-cols-[4fr_1fr]">
          <div class="font-semibold">{@title}</div>
          <div :if={slot_assigned?(:icon_header_slot)} class="flex cursor-pointer justify-end">
            <#slot name="icon_header_slot" />
          </div>
        </div>
        <BodyContent is_multiline={@is_multiline}>{@description}</BodyContent>
      </Body>
      <BodyButtonContainer>
        <#slot name="buttons_slot" />
      </BodyButtonContainer>
    </Container>
    """
  end
end
