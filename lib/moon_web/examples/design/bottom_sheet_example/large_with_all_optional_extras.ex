defmodule MoonWeb.Examples.Design.BottomSheetExample.LargeWithAllOptionalExtras do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Icons.MailEnvelope

  alias Moon.Design.Button
  alias Moon.Design.BottomSheet
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.Field

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Show it to me!</Button>
      <BottomSheet size="lg" has_shadow id="bottom_sheet_extras">
        <BottomSheet.Backdrop />
        <BottomSheet.Panel>
          <BottomSheet.Draghandle />
          <h3 class="p-4 border-b-2 border-beerus text-moon-18 text-bulma font-medium text-center mt-2">
            Forgot password?</h3>

          <p class="p-2 text-trunks">
            If you change your password, you will be unable to withdraw for 48
            hours due to security reasons.
          </p>
          <div class="p-2">
            <Field label="Username or email" field={:email}>
              <Input field={:email} type="email" />
            </Field>
          </div>
          <div class="p-2">
            <Button on_click="set_close" variant="tertiary" size="lg" full_width="true">
              Send
            </Button>
            <div class="p-2 mt-4 rounded-lg bg-goku">
              <h3 class="p-2 text-lg font-medium leading-6 border-b-2 text-bulma border-beerus">
                Need some help?
              </h3>
              <div class="flex mt-2">
                <MailEnvelope class="text-moon-48 text-bulma" />
                <div class="px-2">
                  <p class="font-medium text-bulma">Email us</p>
                  <p class="text-xs text-trunks">Contact us via email</p>
                </div>
              </div>
            </div>
          </div>
        </BottomSheet.Panel>
      </BottomSheet>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    BottomSheet.open("bottom_sheet_extras")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    BottomSheet.close("bottom_sheet_extras")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Icons.MailEnvelope

    alias Moon.Design.Button
    alias Moon.Design.BottomSheet
    alias Moon.Design.Form.Input
    alias Moon.Design.Form.Field

    def render(assigns) do
      ~F\"""
      <div>
        <Button on_click="set_open">Show it to me!</Button>
        <BottomSheet size="lg" has_shadow id="bottom_sheet_extras">
          <BottomSheet.Backdrop />
          <BottomSheet.Panel>
            <BottomSheet.Draghandle />
            <h3 class="p-4 border-b-2 border-beerus text-moon-18 text-bulma font-medium text-center mt-2">
              Forgot password?</h3>

            <p class="p-2 text-trunks">
              If you change your password, you will be unable to withdraw for 48
              hours due to security reasons.
            </p>
            <div class="p-2">
              <Field label="Username or email" field={:email}>
                <Input field={:email} type="email" />
              </Field>
            </div>
            <div class="p-2">
              <Button on_click="set_close" variant="tertiary" size="lg" full_width="true">
                Send
              </Button>
              <div class="p-2 mt-4 rounded-lg bg-goku">
                <h3 class="p-2 text-lg font-medium leading-6 border-b-2 text-bulma border-beerus">
                  Need some help?
                </h3>
                <div class="flex mt-2">
                  <MailEnvelope class="text-moon-48 text-bulma" />
                  <div class="px-2">
                    <p class="font-medium text-bulma">Email us</p>
                    <p class="text-xs text-trunks">Contact us via email</p>
                  </div>
                </div>
              </div>
            </div>
          </BottomSheet.Panel>
        </BottomSheet>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      BottomSheet.open("bottom_sheet_extras")
      {:noreply, socket}
    end

    def handle_event("set_close", _, socket) do
      BottomSheet.close("bottom_sheet_extras")
      {:noreply, socket}
    end
    """
  end
end
