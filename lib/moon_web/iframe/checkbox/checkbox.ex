defmodule MoonWeb.Pages.Iframe.CheckboxCheckbox do
  use MoonWeb, :clean_view

  alias Moon.Components.Checkbox
  alias Moon.Components.CodePreview
  alias MoonWeb.Components.ExampleAndCode

  data state, :boolean, default: false

  def render(assigns) do
    ~F"""
      <ExampleAndCode id="button" title="Disabled">
      <:example>
        <div class="flex justify-around w-full items-center">
          <Checkbox click="change" checked={@state}>
            I agree to terms and services.
          </Checkbox>
        </div>
      </:example>
      <:code>
        <#CodePreview>
          # import
          alias Moon.Components.Checkbox

          # state
          data state, :boolean, default: false

          # render
          <Checkbox click="change" checked={@state}>
            I agree to terms and services.
          </Checkbox>

          # event handle
          def handle_event("change", _, socket) do
            {:noreply, update(socket, :state, &(!&1))}
          end
        </#CodePreview>
      </:code>
      </ExampleAndCode>
    """
  end

  def handle_event("change", _, socket) do
    {:noreply, update(socket, :state, &(!&1))}
  end
end
