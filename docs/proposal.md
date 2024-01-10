# Moon-elixir scaffold proposal
To provide a mix generator task that will create a compound component covering all CRUD operations for a given data type.


## Proposal reason
Speed up frontend development for back-office-common CRUD operations. 
Reduce the number of breaking changes, see details below.
It closely aligns with Phoenix's development standards.

## Proposal workflow
- First should be discussed inside the MoonDS team 
- ... and proposed for a review/discussion to our library consumers


## Subject
To create generator task  `moon.scaffold <Your.Data.Type.Module>` pretty close to `phx.gen...` mix task.
`<Your.Data.Type.Module>` - is some kind of struct|ecto.schema

Generator result - Compound component with all CRUD operations (+Table for list) & its subcomponents. 
Behavior will be based on [this Figma design](https://www.figma.com/file/sv4LnptKzx5JwgpIVcEenU/Partners.io?type=design&node-id=3135-10499&mode=design&t=G8dRp4A3fQDy3KT4-0). 
So, a table will be generated with sortable and filterable columns, corresponding to fields in the source struct. 
Clicking on a row in the table will lead to a row card/form displayed alongside the table. 
Additionally, a form should also be generated, containing the necessary fields. 
An additional `Actions` component will be generated to encapsulate entity actions.

`Ecto.Schema` holds more information that can be helpful when generating forms/tables. Some selects for relations, checkboxes for boolean values, radio buttons for enums, etc., can appear here depending on the field datatype.


## Some remark about breaking changes avoiding:
If the generator script is changed, everybody can run it to see the results compared to the committed changes. Therefore, consumers can choose whether the provided changes are needed, either in whole or in part. VCS will help.

## Potential Drawbacks

Flexibility is lacking. The entire component will not be as customizable as common Moon components because of the initial complexity.

There are no auto-updates on these components, and I actually prefer it that way! A new generator run is required when some updates are delivered. But it will ignore or overwrite previous changes.


## Example:
Lot of elixir code below, nothing else.

Let's say we have some struct. `Ecto.{Schema, Changeset}` should also be applicable here. Not sure about `Phoenix.Form`.
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
