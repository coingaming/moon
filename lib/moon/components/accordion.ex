# https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=23452%3A7
defmodule Moon.Components.Accordion do
  @moduledoc false

  use Moon.StatelessComponent
  alias Phoenix.LiveView.JS
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.PullAside
  alias Moon.Icons.ControlsChevronUp

  prop(id, :string)
  prop(class, :css_class)
  prop(open_by_default, :boolean, default: false)
  prop(is_content_inside, :boolean, default: true)
  prop(is_content_overflow_hidden, :boolean, default: true)
  prop(with_button, :boolean, default: true)
  prop(disabled, :boolean, default: false)

  # we do add 2-letter sizes for consistence with Ract API, long sizes for backward compability & nice
  prop(size, :string,
    values!: ["small", "medium", "large", "xlarge", "sm", "md", "lg", "xl"],
    default: "md"
  )

  prop(pull_a_side_class, :css_class)
  prop(bg_color, :css_class, default: "bg-gohan-100")

  slot(title, required: true)
  slot(header_content)
  slot(content, required: true)

  def render(assigns) do
    ~F"""
    <div
      id={@id}
      aria-expanded={[if(@open_by_default, do: "true", else: "false")]}
      class={
        "w-full rounded-moon-s-sm h-max flex flex-col items-center p-4",
        @bg_color,
        get_padding(@size),
        @class
      }
    >
      <PullAside
        left_grow
        class={
          "w-full gap-3",
          "cursor-not-allowed opacity-30": @disabled,
          "cursor-pointer": !@disabled,
          "#{@pull_a_side_class}": @pull_a_side_class
        }
      >
        <:left>
          <div :on-click={toggle_content(@id, @disabled)} class="flex items-center grow">
            <h3 class={"font-semibold", font_class(@size)} aria-level={3}><#slot {@title} /></h3>
          </div>
        </:left>
        <:right>
          <div class={hidden: !@with_button}>
            <LeftToRight class="text-trunks-100">
              <#slot {@header_content} />
              <div
                :on-click={toggle_content(@id, @disabled)}
                aria-hidden="true"
                id={@id <> "-arrow"}
                class={
                  "transition-transform transition-200",
                  "rotate-90": !@open_by_default,
                  "rotate-180": @open_by_default
                }
              >
                <ControlsChevronUp font_size="1.5rem" />
              </div>
            </LeftToRight>
          </div>
        </:right>
      </PullAside>
      {#if @is_content_inside}
        <div
          id={@id <> "-content"}
          class={
            "w-full h-full",
            get_margin(@size),
            "overflow-hidden": @is_content_overflow_hidden,
            hidden: !@open_by_default
          }
        >
          <#slot {@content} />
        </div>
      {/if}
    </div>

    {#if !@is_content_inside}
      <div
        id={@id <> "-content"}
        class={
          "w-full h-full",
          get_margin(@size),
          "overflow-hidden": @is_content_overflow_hidden,
          hidden: !@open_by_default
        }
      >
        <#slot {@content} />
      </div>
    {/if}
    """
  end

  def toggle_content(id, disabled) do
    if !disabled do
      JS.toggle(to: "#" <> id <> "-content")
      |> JS.dispatch(
        "moon:update-accordion-aria",
        detail: %{
          accordion_id: id
        },
        to: "#" <> id
      )
      |> JS.remove_class(
        "rotate-90",
        to: "#" <> id <> "-arrow.rotate-90"
      )
      |> JS.add_class(
        "rotate-90",
        to: "#" <> id <> "-arrow:not(.rotate-90)"
      )
      |> JS.remove_class(
        "rotate-180",
        to: "#" <> id <> "-arrow.rotate-180"
      )
      |> JS.add_class(
        "rotate-180",
        to: "#" <> id <> "-arrow:not(.rotate-180)"
      )
    end
  end

  defp get_padding(size) do
    case size do
      "xlarge" -> "p-4"
      "xl" -> "p-4"
      "large" -> "p-3"
      "lg" -> "p-3"
      "medium" -> "py-2 pr-2 pl-3"
      "md" -> "py-2 pr-2 pl-3"
      _ -> "py-1 pr-1 pl-3"
    end
  end

  def get_margin(size) do
    case size do
      "xlarge" -> "mt-4"
      "xl" -> "mt-4"
      "large" -> "mt-3"
      "lg" -> "mt-3"
      _ -> "mt-2"
    end
  end

  defp font_class(size) do
    case size do
      "xlarge" -> "text-moon-16"
      "xl" -> "text-moon-16"
      _ -> "text-moon-14"
    end
  end
end
