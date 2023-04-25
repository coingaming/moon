defmodule MoonWeb.Examples.Design.TableExample.Responsive do
  @moduledoc """
  Responsive design for the table. To see what it's about - just
  resize the window, or press <F12> to open the console and resize it
  sizes can be ssen here - https://tailwindcss.com/docs/screens
  """

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Table

  import MoonWeb.Helpers.Lorem

  prop(models, :list,
    default:
      Enum.map(1..5, fn x ->
        %{
          id: x,
          name: "Name #{x}",
          created_at: DateTime.add(DateTime.utc_now(), -3600 + x),
          user: "User ##{x}",
          lorem: "lorem ipsum dolor sit almet",
          long_text: lorem()
        }
      end)
  )

  def render(assigns) do
    ~F"""
    <Table items={model <- @models} selected={nil}>
      <Table.Column class="table-cell sm:hidden">
        #{model.id}: {model.name} by {model.user} at {Timex.format!(model.created_at, "%b %d, %Y", :strftime)}
        <br>
        {model.long_text |> String.slice(0, 30)}...
      </Table.Column>
      <Table.Column label="ID" class="hidden 2xl:table-cell">
        {model.id}
      </Table.Column>
      <Table.Column label="Name" class="hidden sm:table-cell">
        {model.name}
      </Table.Column>
      <Table.Column label="Created at" class="hidden sm:table-cell">
        <p class="hidden xl:block">{Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime)}</p>
        <p class="block xl:hidden">{Timex.format!(model.created_at, "%b %d, %Y", :strftime)}</p>
      </Table.Column>
      <Table.Column label="User" class="hidden xl:table-cell">
        {model.user}
      </Table.Column>
      <Table.Column label="Short text" class="hidden lg:table-cell">
        {model.lorem}
      </Table.Column>
      <Table.Column label="Long text" class="hidden md:table-cell">
        <p class="hidden xl:block">{model.long_text}</p>
        <p class="block xl:hidden">{model.long_text |> String.slice(0, 70)}...</p>
      </Table.Column>
    </Table>
    """
  end

  def code() do
    """
    alias Moon.Design.Table

    import MoonWeb.Helpers.Lorem

    prop(models, :list,
      default:
        Enum.map(1..5, fn x ->
          %{
            id: x,
            name: "Name \#{x}",
            created_at: DateTime.add(DateTime.utc_now(), -3600 + x),
            user: "User #\#{x}",
            lorem: "lorem ipsum dolor sit almet",
            long_text: lorem()
          }
        end)
    )

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models} selected={nil} head_row_class="table-row sm:hidden">
        <Table.Column class="table-cell sm:hidden">
          \#{model.id}: {model.name} by {model.user} at {Timex.format!(model.created_at, "%b %d, %Y", :strftime)}
          <br />
          {model.long_text |> String.slice(0, 30)}...
          </Table.Column>
        <Table.Column label="ID" class="hidden sm:table-cell">
          {model.id}
        </Table.Column>
        <Table.Column label="Name" class="hidden sm:table-cell">
          {model.name}
        </Table.Column>
        <Table.Column label="Created at"  class="hidden sm:table-cell">
          <p class="hidden xl:block">{Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime)}</p>
          <p class="block xl:hidden">{Timex.format!(model.created_at, "%b %d, %Y", :strftime)}</p>
        </Table.Column>
        <Table.Column label="User" class="hidden 2xl:table-cell">
          {model.user}
        </Table.Column>
        <Table.Column label="Short text" class="hidden lg:table-cell">
          {model.lorem}
        </Table.Column>
        <Table.Column label="Long text" class="hidden md:table-cell">
          <p class="hidden xl:block">{model.long_text}</p>
          <p class="block xl:hidden">{model.long_text |> String.slice(0, 70)}...</p>
        </Table.Column>
      </Table>
      \"""
    end
    """
  end
end
