# some additional tailwind classes for extending our own moon components
# to match backoffice components default styles

import Config

config :surface, :components, [
  {Moon.Design.Form.Input, default_class: "hidden"},
  {Moon.Design.Avatar, default_class: "hidden"}
]
