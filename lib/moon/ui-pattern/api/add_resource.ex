defmodule Moon.UIPattern.API.AddResource do
  @moduledoc false

  use Moon.StatefulComponent
  alias Moon.UIPattern.Visibility.OnlyMobile
  alias Moon.UIPattern.Visibility.TabletAndDesktop

  alias Moon.Design.BottomSheet
  alias Moon.Design.Modal

  prop(close, :event)
  slot(title)
  slot(content)
  slot(footer)

  prop(is_open, :boolean, default: true)
  data(is_closing, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div id={@id} phx-hook="Animation">
      <OnlyMobile>
        <BottomSheet is_open={@is_open} id="default_bottom_sheet" on_close={@close}>
          <BottomSheet.Panel>
            <#slot {@title} />
            <#slot {@content} />
            <#slot {@footer} />
          </BottomSheet.Panel>
        </BottomSheet>
      </OnlyMobile>
      <TabletAndDesktop>
        <Modal is_open={@is_open} id="default_modal" on_close={@close}>
          <Modal.Backdrop />
          <Modal.Panel>
            <#slot {@title} />
            <#slot {@content} />
            <#slot {@footer} />
          </Modal.Panel>
        </Modal>
      </TabletAndDesktop>
    </div>
    """
  end

  def open(id) do
    send_update(__MODULE__, id: id, is_closing: true)
    BottomSheet.open("default_bottom_sheet")
    Modal.open("default_modal")
  end

  def close(id) do
    send_update(__MODULE__, id: id, is_closing: true)
    BottomSheet.close("default_bottom_sheet")
    Modal.close("default_modal")
  end
end
