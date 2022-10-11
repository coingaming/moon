defmodule MoonWeb.Pages.Components.TypographyPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Typography"
      },
      %{
        to: "/typography",
        name: "Typography"
      }
    ]

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Typography">
        <p>Typography includes text, headings, and captions.</p>
      </ComponentPageDescription>

      <ExampleAndCode id="text_1" title="Text">
        <:example>
          <div class="flex flex-col gap-2 w-full">
            <p class="text-moon-9 transition-colors">Size 9</p>
            <p class="text-moon-10 transition-colors">Size 10</p>
            <p class="text-moon-12 transition-colors">Size 12</p>
            <p class="text-moon-14 transition-colors">Size 14</p>
            <p class="text-moon-16 transition-colors">Size 16</p>
            <p class="text-moon-18 transition-colors">Size 18</p>
            <p class="text-moon-20 transition-colors">Size 20</p>
            <p class="text-moon-24 transition-colors">Size 24</p>
            <p class="text-moon-32 transition-colors">Size 32</p>
            <p class="text-moon-48 transition-colors">Size 48</p>
            <p class="text-moon-56 transition-colors">Size 56</p>
            <p class="text-moon-64 transition-colors">Size 64</p>
            <p class="text-moon-72 transition-colors">Size 72</p>
          </div>
        </:example>
      <:code>{get_example_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode id="text_2" title="Heading">
        <:example>
          <div class="flex flex-col gap-2 w-full">
            <h3 class="text-moon-9 font-medium transition-colors">Size 9</h3>
            <h3 class="text-moon-10 font-medium transition-colors">Size 10</h3>
            <h3 class="text-moon-12 font-medium transition-colors">Size 12</h3>
            <h3 class="text-moon-14 font-medium transition-colors">Size 14</h3>
            <h3 class="text-moon-16 font-medium transition-colors">Size 16</h3>
            <h3 class="text-moon-18 font-medium transition-colors">Size 18</h3>
            <h3 class="text-moon-20 font-medium transition-colors">Size 20</h3>
            <h3 class="text-moon-24 font-medium transition-colors">Size 24</h3>
            <h3 class="text-moon-32 font-medium transition-colors">Size 32</h3>
            <h3 class="text-moon-48 font-medium transition-colors">Size 48</h3>
            <h3 class="text-moon-56 font-medium transition-colors">Size 56</h3>
            <h3 class="text-moon-64 font-medium transition-colors">Size 64</h3>
            <h3 class="text-moon-72 font-medium transition-colors">Size 72</h3>
          </div>
        </:example>
        <:code>{get_example_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode id="text_3" title="Caption">
        <:example>
          <div class="flex flex-col gap-2 w-full">
            <span class="text-moon-9-caption uppercase transition-colors">
              Size 9
            </span>
            <span class="text-moon-10-caption uppercase transition-colors">
              Size 10
            </span>
          </div>
        </:example>
        <:code>{get_example_3_code()}</:code>
      </ExampleAndCode>
    </Page>
    """
  end

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       direction: params["direction"] || "ltr",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def get_example_1_code() do
    """
    <div class="flex flex-col gap-2 w-full">
    <p class="text-moon-9 transition-colors">Size 9</p>
    <p class="text-moon-10 transition-colors">Size 10</p>
    <p class="text-moon-12 transition-colors">Size 12</p>
    <p class="text-moon-14 transition-colors">Size 14</p>
    <p class="text-moon-16 transition-colors">Size 16</p>
    <p class="text-moon-18 transition-colors">Size 18</p>
    <p class="text-moon-20 transition-colors">Size 20</p>
    <p class="text-moon-24 transition-colors">Size 24</p>
    <p class="text-moon-32 transition-colors">Size 32</p>
    <p class="text-moon-48 transition-colors">Size 48</p>
    <p class="text-moon-56 transition-colors">Size 56</p>
    <p class="text-moon-64 transition-colors">Size 64</p>
    <p class="text-moon-72 transition-colors">Size 72</p>
    </div>
    """
  end

  def get_example_2_code() do
    """
    <div class="flex flex-col gap-2 w-full">
      <h3 class="text-moon-9 font-medium transition-colors">Size 9</h3>
      <h3 class="text-moon-10 font-medium transition-colors">Size 10</h3>
      <h3 class="text-moon-12 font-medium transition-colors">Size 12</h3>
      <h3 class="text-moon-14 font-medium transition-colors">Size 14</h3>
      <h3 class="text-moon-16 font-medium transition-colors">Size 16</h3>
      <h3 class="text-moon-18 font-medium transition-colors">Size 18</h3>
      <h3 class="text-moon-20 font-medium transition-colors">Size 20</h3>
      <h3 class="text-moon-24 font-medium transition-colors">Size 24</h3>
      <h3 class="text-moon-32 font-medium transition-colors">Size 32</h3>
      <h3 class="text-moon-48 font-medium transition-colors">Size 48</h3>
      <h3 class="text-moon-56 font-medium transition-colors">Size 56</h3>
      <h3 class="text-moon-64 font-medium transition-colors">Size 64</h3>
      <h3 class="text-moon-72 font-medium transition-colors">Size 72</h3>
    </div>
    """
  end

  def get_example_3_code() do
    """
    <div class="flex flex-col gap-2 w-full">
      <span class="text-moon-9-caption uppercase transition-colors">
        Size 9
      </span>
      <span class="text-moon-10-caption uppercase transition-colors">
        Size 10
      </span>
    </div>
    """
  end
end
