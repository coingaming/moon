import Config, only: [config: 3]

config :surface, :components, [
  {Surface.Components.Form.ErrorTag,
   default_translator: {MoonWeb.ErrorHelpers, :translate_error}},
  # lib part
  {Moon.Components.Form, propagate_context_to_slots: true},
  {Moon.Components.Field, propagate_context_to_slots: true},
  {Moon.Components.TextInput, propagate_context_to_slots: true},
  {Moon.Components.Select.Dropdown, propagate_context_to_slots: true},
  {Moon.Design.Accordion, propagate_context_to_slots: true},
  {Moon.Design.Accordion.Item, propagate_context_to_slots: true},
  {Moon.Design.Drawer, propagate_context_to_slots: true},
  {Moon.Design.Dropdown, propagate_context_to_slots: true},
  {Moon.Design.Dropdown.Options, propagate_context_to_slots: true},
  {Moon.Design.Form, propagate_context_to_slots: true},
  {Moon.Design.Form.Combobox, propagate_context_to_slots: true},
  {Moon.Design.Form.Dropdown, propagate_context_to_slots: true},
  {Moon.Design.Form.Field, propagate_context_to_slots: true},
  {Moon.Design.Form.Group, propagate_context_to_slots: true},
  {Moon.Design.Form.Radio, propagate_context_to_slots: true},
  {Moon.Design.Form.Radio.Button, propagate_context_to_slots: true},
  {Moon.Design.MenuItem, propagate_context_to_slots: true},
  {Moon.Design.Modal, propagate_context_to_slots: true},
  {Moon.Design.Modal.Panel, propagate_context_to_slots: true},
  {Moon.Design.Snackbar, propagate_context_to_slots: true},
  {Moon.Design.Snackbar.Close, propagate_context_to_slots: true},
  {Moon.Design.Tabs, propagate_context_to_slots: true},
  {Moon.Design.Tabs.List, propagate_context_to_slots: true},
  {Moon.Design.Tooltip.Content, propagate_context_to_slots: true},
  {Moon.Design.BottomSheet, propagate_context_to_slots: true},
  {Moon.Design.Pagination, propagate_context_to_slots: true},
  {Moon.Design.Carousel.Reel, propagate_context_to_slots: true},
  {Moon.Design.Carousel, propagate_context_to_slots: true},
  {Moon.Design.Form.AuthCode, propagate_context_to_slots: true},
  # app part
  {MoonWeb.Components.ExampleAndCode, propagate_context_to_slots: true},
  {MoonWeb.Components.SidebarLink, propagate_context_to_slots: false}
]
