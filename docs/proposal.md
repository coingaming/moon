# Moon scaffold proposal

## Proposal reason
Speed up frontend development. 
Reduce the number of breaking changes. 
It closely aligns with Phoenix's development standards.

## Proposal workflow
- First should be discussed inside the MoonDS team 
- ... and proposed for a review/discussion to our library consumers


## Subject
To create generator task  `moon.scaffold <Your.Data.Type.Module>` pretty close to `phx.gen...` mix task.
`<Your.Data.Type.Module>` - is some kind of struct|ecto.schema

Generator result - Compound component & it's subcomponents.

Example:

Let's say we have some struct
```elixir
defmodule MoonWeb.Schema.Link do
  defstruct name: nil,
            key: nil,
            icon: nil
end
```

so, running `mix moon.scaffold MoonWeb.Schema.Link` will generate few components:

```elixir
defmodule MoonWeb.Components.Link do
...

  alias __MODULE__

  def render(assigns) do

    ~F"""
    <Moon.CRUD>
      <Link.Table items=... />
      <Link.Form for=.../>
      <Link.Card for=.../>
      <Link.Actions>
    </Moon.CRUD>
    """

  end
end

defmodule MoonWeb.Components.Link.Table do
...

  alias Moon.Design.Table

  def render(assigns) do

    ~F"""
    <Table items={model <- @models}>
      <Table.Col name="name">{model.name}</Table.Col>
      <Table.Col name="key">{model.key}</Table.Col>
      <Table.Col name="icon">{model.icon}</Table.Col>
    </Table>
    """

  end
end

defmodule MoonWeb.Components.Link.Form do
...

  alias Moon.Design.Form

  def render(assigns) do

    ~F"""
    <Form>
      <Form.Field field="name">
        <Form.Input />
      </Form.Field>
      <Form.Field field="key">
        <Form.Input />
      </Form.Field>
      <Form.Field field="icon">
        <Form.Input />
      </Form.Field>
    </Form>
    """

  end
end

defmodule MoonWeb.Components.Link.Card do
...

  def render(assigns) do

    ~F"""
    <pre>{inspect(@for)}</pre>
    """

  end
end
```

Some schema-specific information can be helpful when generating forms - some selects, checkboxes, etc. can appear here depending on datatype.

After components are generated, they will have some default behavior. The Card will be open on row-click and closed on cancel. The Table will be sortable and filterable, etc.

Behaviour will be based on https://www.figma.com/file/sv4LnptKzx5JwgpIVcEenU/Partners.io?type=design&node-id=3135-10499&mode=design&t=G8dRp4A3fQDy3KT4-0

## Some remark about breaking changes avoiding:
If the generator script is changed, everybody can run it to see the results comparing to the committed changes. So, consumers can choose if they do need the changes provided.