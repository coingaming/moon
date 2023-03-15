defmodule MoonWeb.Pages.Design.ModalPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.ModalExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
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
      <ComponentPageDescription is_in_progress is_rtl_support title="Modal">
        <p>
          A modal is an interface element that appears over other content. It requires an interaction from the user before they can return to whatever is underneath.
        </p>
      </ComponentPageDescription>

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
          },
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
          }
        ]}
      />

      <PropsTable
        title="Modal.Panel"
        data={[
          %{
            :name => 'header',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Header of Modal element, see Modal.Header'
          },
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
        title="Modal.Header"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Holds title of Modal.Header'
          },
          %{
            :name => 'title',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Title of Modal.Header'
          },
          %{
            :name => 'has_divider',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the Modal header has divider'
          },
          %{
            :name => 'has_close',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the Modal header has "close" icon'
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
end
