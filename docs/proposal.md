# Moon-elixir scaffold proposal
version 0.4

## Purpose of the Proposal
The aim of this proposal is to streamline the frontend development process for common CRUD (Create, Read, Update, Delete) operations in the BO Templates area. This will be achieved by implementing a `mix` generator task that facilitates instant prototyping. The intention is to minimize the occurrence of breaking changes while adhering to the development standards of Phoenix.

## Workflow of the Proposal
The proposal should initially be discussed within the MoonDS team and then presented to our library consumers for review and discussion.

## Subject of the Proposal
The proposal involves the creation of a generator task like `mix moon.scaffold <Your.Data.Type.Module>`, which closely resembles the Phoenix's `mix phx.gen...` tasks.
<Your.Data.Type.Module> refers to a specific struct or Ecto.Schema. Other datatypes processing can be added later as well. 

The output of this generator task will be a compound component that encompasses all CRUD operations (including a table for listing) and its corresponding subcomponents. The generated table will have sortable and filterable columns, aligned with the fields in the original struct. Clicking on a row in the table will display a row card/form adjacent to the table. Additionally, a form with the necessary fields will be generated. An additional "{Item|List}Actions" components will encapsulate entity/list actions.

Please refer to the tables in the actual Figma design files for details:

https://www.figma.com/file/sv4LnptKzx5JwgpIVcEenU/Partners.io?type=design&node-id=3135-10499&mode=design&t=YHzkQMOQ7U0VIvkD-0

https://www.figma.com/file/maDYymDYYORfKtrT1nq23n/Yolo-Bo's?type=design&node-id=267-19671&mode=design&t=qgPmpFp8sOTtnaiW-0

https://www.figma.com/file/maDYymDYYORfKtrT1nq23n/Yolo-Bo's?type=design&node-id=85-45474&mode=design&t=I7Sut6mUNgus1SNc-0


The `Ecto.Schema` provides additional information that can be utilized when generating forms/tables. Depending on the field data type, this may include select options for relations, checkboxes for boolean values, radio buttons for enums, etc.

## Potential Drawbacks
The main drawback is a lack of flexibility. The generated component may not be as customizable as other standard Moon components due to its inherent complexity and the deprecation of Surface.Context usage. Anyway, flexibility is not a primary focus inside BO Templates.

Furthermore, these components do not receive automatic updates, which is intentional. When updates are delivered with a new moon package version, a new generator run is necessary to implement them. So, changes will definitely be reviewed by the consumer before being committed. It's a kind of no-breaking-changes for free. However, this process may override or disregard any previous changes.


## Example:
There are a lot of Surface templates and a bit of Elixir code below, nothing else.

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
      <Link.ItemActions>
      <Link.ListActions>
    </Moon.CRUD>
    """
  end
end

defmodule MoonWeb.Components.Link.Table do
...

  alias Moon.Design.Table

  def render(assigns) do
    ~F"""
    <Table items={item <- @items}>
      <Table.Col name="name">{item.name}</Table.Col>
      <Table.Col name="key">{item.key}</Table.Col>
      <Table.Col name="icon">{item.icon}</Table.Col>
    </Table>
    """
  end
end

defmodule MoonWeb.Components.Link.Form do
...

  alias Moon.Design.{Form, Button}

  def render(assigns) do

    ~F"""
    <Form {=@for}>
      <Form.Field field="name">
        <Form.Input />
      </Form.Field>
      <Form.Field field="key">
        <Form.Input />
      </Form.Field>
      <Form.Field field="icon">
        <Form.Input />
      </Form.Field>
      <Button type="submit">Submit</Button>
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

@gfrancischelli
1. Flexibility: endless scroll vs pagination, filter type, search, table columns for relations, table colum format
2. A soon as component is not ready right now, but is needed right now - providing new features should be painless, bc. there will be a lot of changes. IMHO generated code is a good point here.
E.g.:
  Providing new type of columns for existing data types - changes should be done in generated code. Who want - that use. Who does not want - uses old solution or own custom - let him live as he want.

@ViniciusGaiaValente
p1. alternative is previous comment by @gfrancischelli
p2. flexibility is not an oficial point for BO Templeates. But I'm too old for this shit - flexibility will be a point anyway. No design flexibility, but functional flexibility i believe - filters & sorting for table, so on
p3. that's one more flexibility point, thanks for mention