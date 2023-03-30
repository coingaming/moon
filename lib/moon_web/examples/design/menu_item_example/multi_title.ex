defmodule MoonWeb.Examples.Design.MenuItemExample.MultiTitle do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.MenuItem
  alias Moon.Components.Lego

  alias Moon.Icons.{SportBadminton, ControlsChevronRight}

  data(selected0, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div class="flex justify-around w-full">
      <div class="w-56">
        <MenuItem>
          <span class="px-2">
            <ControlsChevronRight class="text-[1.5rem]" />
          </span>
          <Lego.MultiTitle title="Your value">
            Lorem Ipsum is simply dummy text of the printing and typesetting industry
          </Lego.MultiTitle>
          <span class="text-moon-12 text-trunks">Meta</span>
        </MenuItem>
      </div>
      <div class="w-56">
        <MenuItem role="checkbox" on_click="on_select0" is_selected={@selected0}>
          <span class="px-2">
            <SportBadminton class="text-[1.5rem]" />
          </span>
          <Lego.MultiTitle title="Your value">
            Lorem Ipsum is simply dummy text of the printing and typesetting industry
          </Lego.MultiTitle>
          <Lego.Checkbox />
        </MenuItem>
      </div>
    </div>
    """
  end

  def handle_event("on_select" <> number, params, socket) do
    {:noreply, assign(socket, :"selected#{number}", Map.get(params, "is-selected") == "true")}
  end

  def code() do
    """
    alias Moon.Design.MenuItem
    alias Moon.Components.Lego

    alias Moon.Icons.{SportBadminton, ControlsChevronRight}

    data(selected0, :boolean, default: false)

    def render(assigns) do
      ~F\"""
      <div class="flex justify-around w-full">
        <div class="w-56">
          <MenuItem>
            <span class="px-2">
              <ControlsChevronRight class="text-[1.5rem]" />
            </span>
            <Lego.MultiTitle title="Your value">
              Lorem Ipsum is simply dummy text of the printing and typesetting industry
            </Lego.MultiTitle>
            <span class="text-moon-12 text-trunks">Meta</span>
          </MenuItem>
        </div>
        <div class="w-56">
          <MenuItem role="checkbox" on_click="on_select0" is_selected={@selected0}>
            <span class="px-2">
              <SportBadminton class="text-[1.5rem]" />
            </span>
            <Lego.MultiTitle title="Your value">
              Lorem Ipsum is simply dummy text of the printing and typesetting industry
            </Lego.MultiTitle>
            <Lego.Checkbox />
          </MenuItem>
        </div>
      </div>
      \"""
    end

    def handle_event("selected0, params, socket) do
      {:noreply, assign(socket, :selected0, Map.has_key?(params, "is_selected"))}
    end

    # please note that text property is used when no slot is given, e.g. flowing lines are equal
    # <Lego.MultiTitle title="Your value" text="Lorem Ipsum Dolor" />
    # <Lego.MultiTitle title="Your value">Lorem Ipsum Dolor</Lego.MultiTitle>
    """
  end
end
