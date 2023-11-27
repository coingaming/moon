defmodule MoonWeb.Examples.Design.MenuItemExample.ExpandCollapse do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.MenuItem
  alias Moon.Lego

  data(expanded0, :boolean, default: false)
  data(expanded1, :boolean, default: true)
  data(expanded2, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div class="flex justify-around w-full">
      <div class="w-56 bg-goku flex flex-col gap-2 rounded-moon-s-lg p-4">
        <MenuItem>Vision</MenuItem>
        <MenuItem>Getting started</MenuItem>
        <MenuItem>How to contribute?</MenuItem>
        <MenuItem>Colours</MenuItem>
        <MenuItem>Tokens</MenuItem>
        <MenuItem>Transform SVG</MenuItem>
        <MenuItem>Manifest</MenuItem>
        <MenuItem role="switch" is_selected={@expanded0} title="Tailwind" on_click="on_expand0" />
        {#if @expanded0}
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Accordion</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Avatar</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Breadcrumb</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Button</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <Lego.Title>
              Checkbox</Lego.Title>
          </MenuItem>
        {/if}
      </div>
      <div class="w-56 bg-goku flex flex-col gap-2 rounded-moon-s-lg p-4">
        <MenuItem>
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">B</p>
          </span>
          <Lego.Title>
            <p class="leading-6 text-moon-14 font-semibold">Bitcasino</p>
          </Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3" :on-click="on_expand1" :values={is_selected: !@expanded1}>
            <Lego.ChevronUpDown is_selected={@expanded1} />
          </span>
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">CX</p>
          </span>
          <Lego.Title>
            Customer...</Lego.Title>
        </MenuItem>
        {#if @expanded1}
          <MenuItem>
            <span class="w-6" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>Sub nested item</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>Sub nested item</Lego.Title>
          </MenuItem>
        {/if}
        <MenuItem>
          <span class="w-3" />
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">CX</p>
          </span>
          <Lego.Title>Quality...</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3" />
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">RG</p>
          </span>
          <Lego.Title>Responsible...</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3" :on-click="on_expand2" :values={is_selected: !@expanded2}>
            <Lego.ChevronUpDown is_selected={@expanded2} />
          </span>
          <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">RG</p>
          </span>
          <Lego.Title>Responsible...</Lego.Title>
        </MenuItem>
        {#if @expanded2}
          <MenuItem>
            <span class="w-6" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>Sub nested item</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-6" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>Sub nested item</Lego.Title>
          </MenuItem>
        {/if}
        <div class="flex flex-col gap-2 rounded-moon-s-lg">
          <MenuItem>
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">S</p>
            </span>
            <Lego.Title>
              <p class="leading-6 text-moon-14 font-semibold">Sportsbet</p>
            </Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">RG</p>
            </span>
            <Lego.Title>Customer...</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">CX</p>
            </span>
            <Lego.Title>Quality...</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">RG</p>
            </span>
            <Lego.Title>Responsible...</Lego.Title>
          </MenuItem>
        </div>
        <div class="flex flex-col gap-2 rounded-moon-s-lg">
          <MenuItem>
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">L</p>
            </span>
            <Lego.Title>
              <p class="leading-6 text-moon-14 font-semibold">Livecasino</p>
            </Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">RG</p>
            </span>
            <Lego.Title>Customer...</Lego.Title>
          </MenuItem>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("on_expand" <> number, params, socket) do
    {:noreply, assign(socket, :"expanded#{number}", Map.get(params, "is-selected") == "true")}
  end

  def code() do
    """
    alias Moon.Design.MenuItem
    alias Moon.Lego

    data(expanded0, :boolean, default: false)
    data(expanded1, :boolean, default: true)
    data(expanded2, :boolean, default: false)

    def render(assigns) do
      ~F\"""
      <div class="flex justify-around w-full">
        <div class="w-56 bg-goku flex flex-col gap-2 rounded-moon-s-lg p-4">
          <MenuItem>Vision</MenuItem>
          <MenuItem>Getting started</MenuItem>
          <MenuItem>How to contribute?</MenuItem>
          <MenuItem>Colours</MenuItem>
          <MenuItem>Tokens</MenuItem>
          <MenuItem>Transform SVG</MenuItem>
          <MenuItem>Manifest</MenuItem>
          <MenuItem role="switch" is_selected={@expanded0} title="Tailwind" on_click="on_expand0" />
          {#if @expanded0}
            <MenuItem>
              <span class="w-6" />
              <Lego.Title>
                Accordion</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-6" />
              <Lego.Title>
                Avatar</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-6" />
              <Lego.Title>
                Breadcrumb</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-6" />
              <Lego.Title>
                Button</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-6" />
              <Lego.Title>
                Checkbox</Lego.Title>
            </MenuItem>
          {/if}
        </div>
        <div class="w-56 bg-goku flex flex-col gap-2 rounded-moon-s-lg p-4">
          <MenuItem>
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">B</p>
            </span>
            <Lego.Title>
              <p class="leading-6 text-moon-14 font-semibold">Bitcasino</p>
            </Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" :on-click="on_expand1" :values={is_selected: !@expanded1}>
              <Lego.ChevronUpDown is_selected={@expanded1} />
            </span>
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">CX</p>
            </span>
            <Lego.Title>
              Customer...</Lego.Title>
          </MenuItem>
          {#if @expanded1}
            <MenuItem>
              <span class="w-6" />
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">S</p>
              </span>
              <Lego.Title>Sub nested item</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-6" />
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">S</p>
              </span>
              <Lego.Title>Sub nested item</Lego.Title>
            </MenuItem>
          {/if}
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">CX</p>
            </span>
            <Lego.Title>Quality...</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" />
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">RG</p>
            </span>
            <Lego.Title>Responsible...</Lego.Title>
          </MenuItem>
          <MenuItem>
            <span class="w-3" :on-click="on_expand2" :values={is_selected: !@expanded2}>
              <Lego.ChevronUpDown is_selected={@expanded2} />
            </span>
            <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
              <p class="leading-4 font-semibold text-moon-10">RG</p>
            </span>
            <Lego.Title>Responsible...</Lego.Title>
          </MenuItem>
          {#if @expanded2}
            <MenuItem>
              <span class="w-6" />
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">S</p>
              </span>
              <Lego.Title>Sub nested item</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-6" />
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">S</p>
              </span>
              <Lego.Title>Sub nested item</Lego.Title>
            </MenuItem>
          {/if}
          <div class="flex flex-col gap-2 rounded-moon-s-lg">
            <MenuItem>
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">S</p>
              </span>
              <Lego.Title>
                <p class="leading-6 text-moon-14 font-semibold">Sportsbet</p>
              </Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-3" />
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">RG</p>
              </span>
              <Lego.Title>Customer...</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-3" />
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">CX</p>
              </span>
              <Lego.Title>Quality...</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-3" />
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">RG</p>
              </span>
              <Lego.Title>Responsible...</Lego.Title>
            </MenuItem>
          </div>
          <div class="flex flex-col gap-2 rounded-moon-s-lg">
            <MenuItem>
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">L</p>
              </span>
              <Lego.Title>
                <p class="leading-6 text-moon-14 font-semibold">Livecasino</p>
              </Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-3" />
              <span class="bg-gohan w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">RG</p>
              </span>
              <Lego.Title>Customer...</Lego.Title>
            </MenuItem>
          </div>
        </div>
      </div>
      \"""
    end

    def handle_event("on_expand0" <> number, params, socket) do
      {:noreply, assign(socket, :"expanded0",  Map.has_key?(params, "is_selected"))}
    end

    def handle_event("on_expand1" <> number, params, socket) do
      {:noreply, assign(socket, :"expanded1",  Map.has_key?(params, "is_selected"))}
    end

    def handle_event("on_expand2" <> number, params, socket) do
      {:noreply, assign(socket, :"expanded2",  Map.has_key?(params, "is_selected"))}
    end
    """
  end
end
