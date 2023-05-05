defmodule Moon.UIPattern.API.AddResource do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.UIPattern.Visibility.OnlyMobile
  alias Moon.UIPattern.Visibility.TabletAndDesktop

  alias Moon.Design.BottomSheet
  alias Moon.Design.Modal

  prop(close, :event)
  slot(title)
  slot(content)
  slot(footer)

  def render(assigns) do
    ~F"""
    <div>
      <OnlyMobile>
        <BottomSheet id="default_bottom_sheet">
          <BottomSheet.Panel>
            <#slot {@title} />
            <#slot {@content} />
            <#slot {@footer} />
          </BottomSheet.Panel>
        </BottomSheet>
      </OnlyMobile>
      <TabletAndDesktop>
        <Modal id="default_modal">
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
end
