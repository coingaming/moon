defmodule MoonWeb.Pages.ComponentsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponetsPage.ComponentsPageCard
  alias MoonWeb.Components.ComponetsPage.ComponentsPageSection
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <h1 class="relative z-10  max-w-2xl text-moon-48 md:text-moon-72 font-medium text-bulma">
        Beautiful UI components, crafted with Tailwind CSS
      </h1>
      <div class="relative z-10 flex flex-col gap-6 max-w-2xl">
        <p class="text-moon-18 text-bulma">
          Components are one of the key building blocks of the design system.
          Their systematic reuse helps to create visual and functional consistency
          across products.
        </p>
      </div>

      <ComponentsPageSection title="Components">
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.AccordionPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/accordion.png"
          title="Accordion"
        >
          An accordion is a vertical stack of interactive headings used to toggle the display of further information; each item can be 'collapsed' with just a short label visible or 'expanded' to show the full content.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.AvatarPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/avatar.png"
          title="Avatar"
        >
          The Avatar component is typically used to display images, icons, or initials representing people or other entities.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.BreadcrumbPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/breadcrumb.png"
          title="Breadcrumb"
        >
          A list of links showing the location of the current page in the navigational hierarchy.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.ButtonPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/button.png"
          title="Button"
        >
          Buttons allow users to take actions, and make choices, with a single tap.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.Button.IconButtonPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/icon_button.png"
          title="IconButton"
        >
          Buttons allow users to take actions, and make choices, with a single tap.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.ChipPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/chip.png"
          title="Chip"
        >
          Chips help filter content, or trigger actions.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.DropdownPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/dropdown.png"
          title="Dropdown"
        >
          Dropdowns is a custom select component that allows users to make single or multiple selections.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Components.IconsPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/icon.png"
          title="Icons"
        >
          Moon DS provides a set of commonly used interface icons you can use in your project.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.Form.InputPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/input.png"
          title="Input"
        >
          Text input fields allow users to enter text and can be used to collect user feedback or enter information in data entry forms.
        </ComponentsPageCard>

        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.LoaderPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/loader.png"
          title="Loader"
        >
          Loaders provide a visual cue that an action is processing awaiting a course of change or a result.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.MenuItemPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/menu_item.png"
          title="MenuItem"
        >
          Menu items are used in such vertical menues and containers as Popovers, Sidebars, Drawers, Dialogs etc.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.ModalPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/modal.png"
          title="Modal"
        >
          A modal is an interface element that appears over other content. It requires an interaction from the user before they can return to whatever is underneath.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.PopoverPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/popover.png"
          title="Popover"
        >
          Popovers are perfect for floating panels with arbitrary content like navigation menus, mobile menus and flyout menus.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.CircularProgressPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/circular_progress.png"
          title="CircularProgress"
        >
          A progress indicator (Circular and Linear) is a visual representation of a user's progress through a set of steps, guiding toward the completion of a specified process.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.ProgressPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/linear_progress.png"
          title="Progress"
        >
          A progress indicator (Circular and Linear) is a visual representation of a user's progress through a set of steps, guiding toward the completion of a specified process.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.Form.SelectPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/select.png"
          title="Select"
        >
          A form input used for selecting a value: when collapsed it shows the currently selected option and when expanded, it shows a scrollable list of predefined options for the user to choose from.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.SnackbarPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/snackbar.png"
          title="Snackbar"
        >
          The snackbar component is a non-disruptive message that appears on the interface to provide quick, at-a-glance feedback on the outcome of an action.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.SwitchPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/switch.png"
          title="Switch"
        >
          Switch is a control that is used to quickly switch between two possible states.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.TablePage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/table.png"
          title="Table"
        >
          A component for displaying large amounts of data in rows and columns.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.TabsPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/tabs.png"
          title="Tabs"
        >
          Tabs to allow users to navigate easily between views within the same context.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.TagPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/tag.png"
          title="Tag"
        >
          Tags represent a set of interactive keywords that help organise and categorise objects.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.Form.TextareaPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/textarea.png"
          title="Textarea"
        >
          A form control for editing multi-line text.
        </ComponentsPageCard>
        <ComponentsPageCard
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.TooltipPage,
            theme_name: @theme_name,
            direction: @direction
          )}
          image="/moon/assets/images/facing/components/tooltip.png"
          title="Tooltip"
        >
          A means of displaying a description or extra information about an element, usually on hover, but can also be on click or tap.
        </ComponentsPageCard>
      </ComponentsPageSection>
    </Page>
    """
  end
end
