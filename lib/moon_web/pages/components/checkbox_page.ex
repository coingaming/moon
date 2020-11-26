defmodule MoonWeb.Pages.Components.CheckboxPage do
  use MoonWeb, :live_view
  alias Moon.Components.Stack
  alias Moon.Components.Link
  alias Moon.Components.Checkbox
  alias Moon.Components.CodePreview

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    {:ok, assign(socket, theme_name: theme_name, active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <h1>Checkbox</h1>

    <p>
      Checkboxes offer users a 'yes' or 'no' choice. They can be used on their own, or as a multiple choice fieldset.
    </p>

    <Stack>
      <Checkbox>
        I confirm that I am at least 18 years of age, and accept the <Link href="#">Terms and Conditions</Link>.
      </Checkbox>

      <Checkbox>
        I agree to receive bonus & marketing emails.
      </Checkbox>
    </Stack>
    """
  end
end
