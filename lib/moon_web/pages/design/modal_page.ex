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
            :name => ~c"is_open",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"false",
            :description => ~c"Whether the Modal is open or not"
          },
          %{
            :name => ~c"on_close",
            :type => ~c"event",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Handler for open/close of the element"
          },
          %{
            :name => ~c"backdrop",
            :type => ~c"slot",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Backdrop of Modal element, see Modal.Backdrop"
          },
          %{
            :name => ~c"panel",
            :type => ~c"slot",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Content of Modal element, see Modal.Panel"
          }
        ]}
      />

      <PropsTable
        title="Modal.Panel"
        data={[
          %{
            :name => ~c"default",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Content of Modal element"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Tailwind classes for customization of Panel"
          }
        ]}
      />

      <PropsTable
        title="Modal.Backdrop"
        data={[
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Tailwind classes for customization of Backdrop"
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
