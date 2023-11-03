defmodule MoonWeb.Pages.ComponentsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponetsPage.ComponentsPageCard
  alias MoonWeb.Components.ComponetsPage.ComponentsPageSection
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages

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
          page={Pages.Design.AccordionPage}
          image="facing/components/accordion.png"
          title="Accordion"
        >
          An accordion is a vertical stack of interactive headings used to toggle the display of further information; each item can be 'collapsed' with just a short label visible or 'expanded' to show the full content.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.AlertPage}
          image="facing/components/alert.png"
          title="Alert"
        >
          A way of informing the user of important changes in a prominent way.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.Form.AuthCodePage}
          image="facing/components/auth_code.png"
          title="AuthCode"
        >
          A one-time password (OTP) is an automatically generated numeric or alphanumeric string of characters that authenticates a user for a single transaction or login session.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.AvatarPage}
          image="facing/components/avatar.png"
          title="Avatar"
        >
          The Avatar component is typically used to display images, icons, or initials representing people or other entities.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.BottomSheetPage}
          image="facing/components/bottom_sheet.png"
          title="BottomSheet"
        >
          The bottom sheet component is a modified dialog that slides from the bottom of the screen, common pattern in mobile apps.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.BreadcrumbPage}
          image="facing/components/breadcrumb.png"
          title="Breadcrumb"
        >
          A list of links showing the location of the current page in the navigational hierarchy.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.Button.ButtonPage}
          image="facing/components/button.png"
          title="Button"
        >
          Buttons allow users to take actions, and make choices, with a single tap.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.Button.IconButtonPage}
          image="facing/components/icon_button.png"
          title="IconButton"
        >
          Buttons allow users to take actions, and make choices, with a single tap.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.CarouselPage}
          image="facing/components/carousel.png"
          title="Carousel"
        >
          Carousel is an effective way of displaying multiple images or content in a single space.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.Form.CheckboxPage}
          image="facing/components/checkbox.png"
          title="Checkbox"
        >
          The checkbox is shown as a square box that is ticked (checked) when activated.
        </ComponentsPageCard>
        <ComponentsPageCard page={Pages.Design.ChipPage} image="facing/components/chip.png" title="Chip">
          Chips help filter content, or trigger actions.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.DropdownPage}
          image="facing/components/dropdown.png"
          title="Combobox"
        >
          An input that behaves similarly to a select, with the addition of a free text input to filter options.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.DrawerPage}
          image="facing/components/drawer.png"
          title="Drawer"
        >
          The Drawer component is a panel that slides out from the edge of the screen. It can be useful when you need users to complete a task or view some details without leaving the current page.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.DropdownPage}
          image="facing/components/dropdown.png"
          title="Dropdown"
        >
          Dropdowns is a custom select component that allows users to make single or multiple selections.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Components.IconsPage}
          image="facing/components/icon.png"
          title="Icons"
        >
          Moon DS provides a set of commonly used interface icons you can use in your project.
        </ComponentsPageCard>

        <ComponentsPageCard
          page={Pages.Design.Form.InputPage}
          image="facing/components/input.png"
          title="Input"
        >
          Text input fields allow users to enter text and can be used to collect user feedback or enter information in data entry forms.
        </ComponentsPageCard>

        <ComponentsPageCard
          page={Pages.Design.Form.InsetInputPage}
          image="facing/components/inset_input.png"
          title="InsetInput"
        >
          Text input fields allow users to enter text and can be used to collect user feedback or enter information in data entry forms.
        </ComponentsPageCard>

        <ComponentsPageCard
          page={Pages.Design.Form.GroupPage}
          image="facing/components/group.png"
          title="Group"
        >
          Combine different types of inputs into groups to save vertical space on your designs and also simplify form filling.
        </ComponentsPageCard>

        <ComponentsPageCard
          page={Pages.Design.LoaderPage}
          image="facing/components/loader.png"
          title="Loader"
        >
          Loaders provide a visual cue that an action is processing awaiting a course of change or a result.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.MenuItemPage}
          image="facing/components/menu_item.png"
          title="MenuItem"
        >
          Menu items are used in such vertical menues and containers as Popovers, Sidebars, Drawers, Dialogs etc.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.ModalPage}
          image="facing/components/modal.png"
          title="Modal"
        >
          A modal is an interface element that appears over other content. It requires an interaction from the user before they can return to whatever is underneath.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.PaginationPage}
          image="facing/components/pagination.png"
          title="Pagination"
        >
          Pagination is the process of splitting information over multiple pages instead of showing it all on a single page.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.PopoverPage}
          image="facing/components/popover.png"
          title="Popover"
        >
          Popovers are perfect for floating panels with arbitrary content like navigation menus, mobile menus and flyout menus.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.Progress.CircularProgressPage}
          image="facing/components/circular_progress.png"
          title="CircularProgress"
        >
          A progress indicator (Circular and Linear) is a visual representation of a user's progress through a set of steps, guiding toward the completion of a specified process.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.Progress.LinearProgressPage}
          image="facing/components/linear_progress.png"
          title="Progress"
        >
          A progress indicator (Circular and Linear) is a visual representation of a user's progress through a set of steps, guiding toward the completion of a specified process.
        </ComponentsPageCard>

        <ComponentsPageCard
          page={Pages.Design.Form.RadioPage}
          image="facing/components/radio_button.png"
          title="Radio"
        >
          Radio buttons are used to represent a group of choices whereby users can only select one option.
        </ComponentsPageCard>

        <ComponentsPageCard
          page={Pages.Design.Form.SelectPage}
          image="facing/components/select.png"
          title="Select"
        >
          A form input used for selecting a value: when collapsed it shows the currently selected option and when expanded, it shows a scrollable list of predefined options for the user to choose from.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.SnackbarPage}
          image="facing/components/snackbar.png"
          title="Snackbar"
        >
          The snackbar component is a non-disruptive message that appears on the interface to provide quick, at-a-glance feedback on the outcome of an action.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.SwitchPage}
          image="facing/components/switch.png"
          title="Switch"
        >
          Switch is a control that is used to quickly switch between two possible states.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.TablePage}
          image="facing/components/table.png"
          title="Table"
        >
          A component for displaying large amounts of data in rows and columns.
        </ComponentsPageCard>
        <ComponentsPageCard page={Pages.Design.TabsPage} image="facing/components/tabs.png" title="Tabs">
          Tabs to allow users to navigate easily between views within the same context.
        </ComponentsPageCard>
        <ComponentsPageCard page={Pages.Design.TagPage} image="facing/components/tag.png" title="Tag">
          Tags represent a set of interactive keywords that help organise and categorise objects.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.Form.TextAreaPage}
          image="facing/components/textarea.png"
          title="TextArea"
        >
          A form control for editing multi-line text.
        </ComponentsPageCard>
        <ComponentsPageCard
          page={Pages.Design.TooltipPage}
          image="facing/components/tooltip.png"
          title="Tooltip"
        >
          A means of displaying a description or extra information about an element, usually on hover, but can also be on click or tap.
        </ComponentsPageCard>
      </ComponentsPageSection>
    </Page>
    """
  end
end
