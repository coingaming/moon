defmodule MoonWeb.Pages.Design.Form.AuthCodePage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.Form.AuthCodeExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "#",
        name: "Form"
      },
      %{
        to: "/components/v2/form/auth_code",
        name: "AuthCode"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="AuthCode" image="facing/components/auth_code.png">
        <p>A one-time password (OTP) is an automatically generated numeric or alphanumeric string of characters that authenticates a user for a single transaction or login session.</p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        AuthCodeExample.Default,
        AuthCodeExample.AllowedCharacters,
        AuthCodeExample.CustomLength,
        AuthCodeExample.ErrorState,
        AuthCodeExample.DisabledState,
        AuthCodeExample.HintMessage,
        AuthCodeExample.Placeholder,
        AuthCodeExample.Password,
        AuthCodeExample.DifferentGaps,
        AuthCodeExample.WithForm
      ]} />

      <PropsTable module={Moon.Design.Form.AuthCode} />
      <PropsTable module={Moon.Design.Form.AuthCode.Input} />
      <PropsTable module={Moon.Design.Form.AuthCode.Hint} />
    </Page>
    """
  end

  defp component_anatomy do
    """
    <AuthCode>
      <AuthCode.Input />
      <AuthCode.Hint>...</AuthCode.Hint>
    </AuthCode>
    """
  end
end
