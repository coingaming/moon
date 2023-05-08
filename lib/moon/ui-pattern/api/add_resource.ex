defmodule Moon.UIPattern.API.AddResource do
  @moduledoc false

  use Moon.StatefulComponent
  alias Moon.UIPattern.Visibility.OnlyMobile
  alias Moon.UIPattern.Visibility.OnlyTabletAndDesktop

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
        <BottomSheet is_open={@is_open} id={bottom_sheet_id(@id)} on_close={@close}>
          <BottomSheet.Panel class="p-4 grid gap-2">
            <#slot {@title} />
            <#slot {@content} />
            <#slot {@footer} />
          </BottomSheet.Panel>
        </BottomSheet>
      </OnlyMobile>
      <OnlyTabletAndDesktop>
        <Modal is_open={@is_open} id={modal_id(@id)} on_close={@close}>
          <Modal.Backdrop />
          <Modal.Panel class="p-4 grid gap-2">
            <#slot {@title} />
            <#slot {@content} />
            <#slot {@footer} />
          </Modal.Panel>
        </Modal>
      </OnlyTabletAndDesktop>
    </div>
    """
  end

  def gen_id(base_id, postfix) do
    "#{base_id}-#{postfix}"
  end

  def bottom_sheet_id(base_id) do
    gen_id(base_id, "bottom-sheet")
  end

  def modal_id(base_id) do
    gen_id(base_id, "modal")
  end

  def open(id) do
    send_update(__MODULE__, id: id, is_closing: true)
    BottomSheet.open(bottom_sheet_id(id))
    Modal.open(modal_id(id))
  end

  def close(id) do
    send_update(__MODULE__, id: id, is_closing: true)
    BottomSheet.close(bottom_sheet_id(id))
    Modal.close(modal_id(id))
  end
end
