defmodule Moon.Components.Switch do
  use Moon.StatelessComponent

  prop checked, :boolean, default: false
  prop size, :string, values: ["small", "medium", "large"], default: "medium"
  prop action, :string, default: "Toggle Setting"
  prop on_change, :event

  def render(assigns) do
    ~H"""
    <button
      type="button"
      aria-pressed="false"
      class={{
        "relative inline-flex flex-shrink-0 transition-colors duration-200 ease-in-out border-transparent rounded-full cursor-pointer focus:outline-none focus:ring-2 focus:ring-offset-2",
        "bg-piccolo-100": @checked,
        "bg-gohan-40": !@checked,
        "border-2 w-7": @size == "small",
        "border-4 w-10": @size == "medium",
        "border-4 w-14": @size == "large"
      }}
      :on-click={{ @on_change }}
    >
      <span class="sr-only">{{ @action }}</span>
      <span
        aria-hidden="true"
        class={{
          "inline-block transition duration-200 ease-in-out transform translate-x-0 bg-goten-100 rounded-full shadow pointer-events-none ring-0",
          "w-3 h-3": @size == "small",
          "w-4 h-4": @size == "medium",
          "w-6 h-6": @size == "large",
          "translate-x-3": @size == "small" and @checked,
          "translate-x-4": @size == "medium" and @checked,
          "translate-x-6": @size == "large" and @checked
        }}
      ></span>
    </button>
    """
  end
end
