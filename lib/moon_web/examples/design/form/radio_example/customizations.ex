defmodule MoonWeb.Examples.Design.Form.RadioExample.Customizations do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Radio
  alias Moon.Design.Form.Radio.{Button, Indicator}

  data(value1, :string, default: "first")
  data(value2, :string, default: "second")
  data(value3, :string, default: "")

  def handle_event("changed" <> ind, %{"value" => value}, socket) do
    {:noreply, assign(socket, "value#{ind}": value)}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full flex flex-wrap items-center justify-around gap-4">
      <Radio value={@value1} on_change="changed1" class="flex gap-4">
        <Button value="first">
          <Indicator /> Option 1
        </Button>
        <Button value="second">
          <Indicator /> Option 2
        </Button>
      </Radio>

      <Radio value={@value2} on_change="changed2">
        <Button
          value="first"
          class="w-48 p-2 justify-between hover:bg-goku transition-colors rounded-moon-i-sm"
        >
          Button 1 <Indicator />
        </Button>
        <Button
          value="second"
          class="w-48 p-2 justify-between hover:bg-goku transition-colors rounded-moon-i-sm"
        >
          Button 2 <Indicator />
        </Button>
      </Radio>

      <Radio value={@value3} on_change="changed3">
        <Button value="first">
          <Indicator class="border-chichi" /> Button 1
        </Button>
        <Button value="second">
          <Indicator class="moon-checked:border-nappa after:bg-nappa" /> Button 2
        </Button>
      </Radio>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Radio
    alias Moon.Design.Form.Radio.{Button, Indicator}

    data(value1, :string, default: "first")
    data(value2, :string, default: "second")
    data(value3, :string, default: "")

    def handle_event("changed" <> ind, %{"value" => value}, socket) do
      {:noreply, assign(socket, "value\#{ind}": value)}
    end

    def render(assigns) do
      ~F\"""
      <div class="w-full flex flex-wrap items-center justify-around gap-4">
        <Radio value={@value1} on_change="changed1" class="flex gap-4">
          <Button value="first">
            <Indicator /> Button 1
          </Button>
          <Button value="second">
            <Indicator /> Button 2
          </Button>
        </Radio>

        <Radio value={@value2} on_change="changed2">
          <Button value="first" class="w-48 p-2 justify-between hover:bg-goku transition-colors rounded-moon-i-sm">
            Button 1 <Indicator />
          </Button>
          <Button value="second" class="w-48 p-2 justify-between hover:bg-goku transition-colors rounded-moon-i-sm">
            Button 2 <Indicator />
          </Button>
        </Radio>

        <Radio value={@value3} on_change="changed3">
          <Button value="first">
            <Indicator class="border-chichi" /> Button 1
          </Button>
          <Button value="second">
            <Indicator class="moon-checked:border-nappa after:bg-nappa" /> Button 2
          </Button>
        </Radio>
      </div>
      \"""
    end
    """
  end
end
