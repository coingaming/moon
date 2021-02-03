defmodule Moon.Components.Button do
  use Moon.StatelessComponent

  prop(href, :string)

  prop(variant, :string, values: ["primary", "secondary", "tertiary", "highlight", "default"])

  prop(on_click, :string)

  prop(size, :string, values: ["xsmall", "small", "medium", "large"])
  prop(mock_state, :string, values: ["active", "focus", "hover"])
  prop(full_width, :boolean)
  prop(progress, :boolean)
  prop(oops, :boolean)
  prop(success, :boolean)
  prop(pulse, :boolean)
  prop(disabled, :boolean)

  prop(to, :string)
  prop(as, :string)
  prop(active_class_name, :string)
  prop(active_style, :string)
  prop(exact, :boolean)
  prop(string, :boolean)
  prop(is_active, :boolean)
  prop(location, :string)
  prop(style, :string)
  prop(class, :string)

  slot(default)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/button" }}

    <button
      class="moon-button {{ @class }}"
      disabled={{ @disabled }}
      data-mock-state={{ @mock_state }}
      data-variant={{ @variant }}
      data-size={{ @size }}
      phx-click={{ @on_click }}
    >
      <slot />
    </button>
    """
  end

  # def render(assigns) do
  #   ~H"""
  #   <button
  #     class="moon-button"
  #     disabled={{ @disabled }}
  #     data-mock-state={{ @mock_state }}
  #     data-variant={{ @variant }}
  #     data-size={{ @size }}
  #     phx-click={{ @on_click }}
  #     phx-hook="AssetHook"
  #     data-assets={{ asset_hook @socket, "js/components/button" }}
  #   >
  #     <slot />
  #   </button>
  #   """
  # end
end
