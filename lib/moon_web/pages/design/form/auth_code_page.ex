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
      <ComponentPageDescription is_in_progress title="AuthCode" image="facing/components/auth_code.png">
        <p>A one-time password (OTP) is an automatically generated numeric or alphanumeric string of characters that authenticates a user for a single transaction or login session.</p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        AuthCodeExample.Default,
        AuthCodeExample.CustomLength,
        AuthCodeExample.AllowedCharacters,
        AuthCodeExample.Placeholder,
        AuthCodeExample.Sizes,
        AuthCodeExample.ErrorState,
        AuthCodeExample.DisabledState,
        AuthCodeExample.WithForm
      ]} />

      <PropsTable title="AuthCode props" module={Moon.Design.Form.AuthCode} />
      <PropsTable title="AuthCode.Input props" module={Moon.Design.Form.AuthCode.Input} />
    </Page>
    """
  end

  defp component_anatomy do
    """
    <AuthCode>
      <AuthCode.Input />
    </AuthCode>
    """
  end
end
