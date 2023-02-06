defmodule MoonWeb.Examples.Design.DropdownExample.OptionLayouts do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Components.Chip
  alias Moon.Components.Lego

  alias Moon.Icons.{
    OtherWater,
    OtherLightning,
    OtherMoon,
    OtherSun
  }

  data(values, :list, default: ["1", "4"])

  def handle_event("on_change", %{"value" => value}, socket) do
    {:noreply,
     assign(socket,
       values:
         (Enum.member?(socket.assigns.values, value) &&
            Enum.filter(socket.assigns.values, &(&1 != value))) || [value | socket.assigns.values]
     )}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full flex justify-around">
      <Dropdown id="dropdown-options-01" class="w-auto">
        <Dropdown.Trigger>
          <Chip>sort by</Chip>
        </Dropdown.Trigger>
        <Dropdown.Option>
          <Lego.Title><OtherLightning class="text-[1.5rem]" />Option 1</Lego.Title>
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title><OtherWater class="text-[1.5rem]" />Option 2</Lego.Title>
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title><OtherSun class="text-[1.5rem]" />Option 3</Lego.Title>
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title><OtherMoon class="text-[1.5rem]" />Option 4</Lego.Title>
        </Dropdown.Option>
      </Dropdown>

      <Dropdown id="dropdown-options-02" class="w-72">
        <Dropdown.Trigger>
          <Chip>Select language</Chip>
        </Dropdown.Trigger>
        <Dropdown.Option>
          <Lego.Title>Mandarin Chinese</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>English</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Spanish</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Hindi</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Bengali</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Portuguese</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
      </Dropdown>

      <Dropdown id="dropdown-options-03" on_change="on_change" value={@values}>
        <Dropdown.Trigger>
          <Chip>Select countries</Chip>
        </Dropdown.Trigger>
        <Dropdown.Option>
          <Lego.Title>Australia</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Canada</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>China</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Germany</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Hungary</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Japan</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
      </Dropdown>
    </div>
    """
  end

  def code() do
    """
    data(values, :list, default: ["1", "4"])

    def handle_event("on_change", %{"value" => value}, socket) do
      {:noreply,
       assign(socket,
         values:
           (Enum.member?(socket.assigns.values, value) &&
              Enum.filter(socket.assigns.values, &(&1 != value))) || [value | socket.assigns.values]
       )}
    end

    ...

    <div class="w-full flex justify-around">
      <Dropdown id="dropdown-options-01" class="w-auto">
        <Dropdown.Trigger>
          <Chip>sort by</Chip>
        </Dropdown.Trigger>
        <Dropdown.Option>
          <Lego.Title><OtherLightning class="text-[1.5rem]" />Option 1</Lego.Title>
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title><OtherWater class="text-[1.5rem]" />Option 2</Lego.Title>
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title><OtherSun class="text-[1.5rem]" />Option 3</Lego.Title>
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title><OtherMoon class="text-[1.5rem]" />Option 4</Lego.Title>
        </Dropdown.Option>
      </Dropdown>

      <Dropdown id="dropdown-options-02" class="w-72">
        <Dropdown.Trigger>
          <Chip>Select language</Chip>
        </Dropdown.Trigger>
        <Dropdown.Option>
          <Lego.Title>Mandarin Chinese</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>English</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Spanish</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Hindi</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Bengali</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Portuguese</Lego.Title>
          <Lego.Radio />
        </Dropdown.Option>
      </Dropdown>

      <Dropdown id="dropdown-options-03" on_change="on_change" value={@values}>
        <Dropdown.Trigger>
          <Chip>Select countries</Chip>
        </Dropdown.Trigger>
        <Dropdown.Option>
          <Lego.Title>Australia</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Canada</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>China</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Germany</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Hungary</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
        <Dropdown.Option>
          <Lego.Title>Japan</Lego.Title>
          <Lego.Checkbox />
        </Dropdown.Option>
      </Dropdown>
    </div>
    """
  end
end
