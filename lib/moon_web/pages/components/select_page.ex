defmodule MoonWeb.Pages.Components.SelectPage do
  use Moon.LiveView
  alias Moon.Components.Select
  alias Moon.Components.CodePreview

  data gender_options, :any

  def mount(_params, _session, socket) do
    gender_options = [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]

    {:ok,
     assign(socket,
       gender_options: gender_options
     )}
  end

  def render(assigns) do
    ~H"""
    <p>
      <h1>Select</h1>
      A user-controlled menu of options for forms, navigation and more.

      <a href="https://design.sportsbet.io/components/select">https://design.sportsbet.io/components/select</a>

    </p>

    <Select
      label="Gender"
      field={{ :gender }}
      options={{ @gender_options }}
      prompt="Please select gender"
    />

    <#CodePreview>
      <Select
        label="Gender"
        field={{ :gender }}
        options={{ @gender_options }}
        prompt="Please select gender"
      />
    </#CodePreview>
    """
  end
end
