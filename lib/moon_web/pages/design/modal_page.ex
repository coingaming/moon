defmodule MoonWeb.Pages.Design.ModalPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.ModalExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/modal",
        name: "Modal"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        is_aria_support
        is_rtl_support
        title="Modal"
        image="facing/components/modal.png"
      >
        <p>
          A modal is an interface element that appears over other content. It requires an interaction from the user before they can return to whatever is underneath.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        ModalExample.Default,
        ModalExample.ExampleWithBigContent,
        ModalExample.ExampleWithStyledContent,
        ModalExample.ExampleWithSelect
      ]} />

      <PropsTable
        title="Modal props"
        data={[
          %{
            :name => 'is_open',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the Modal is open or not'
          },
          %{
            :name => 'on_close',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Handler for open/close of the element'
          },
          %{
            :name => 'backdrop',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Backdrop of Modal element, see Modal.Backdrop'
          },
          %{
            :name => 'panel',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Content of Modal element, see Modal.Panel'
          }
        ]}
      />

      <PropsTable
        title="Modal.Panel"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Content of Modal element'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'Yes',
            :default => '-',
            :description => 'Tailwind classes for customization of Panel'
          }
        ]}
      />

      <PropsTable
        title="Modal.Backdrop"
        data={[
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'Yes',
            :default => '-',
            :description => 'Tailwind classes for customization of Backdrop'
          }
        ]}
      />
    </Page>
    """
  end

  def component_anatomy do
    """
    <Modal>
      <Modal.Backdrop />
      <Modal.Panel />
    </Modal>
    """
  end
end
