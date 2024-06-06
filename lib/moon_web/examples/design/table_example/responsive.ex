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
          created_at: DateTime.utc_now(),
          user: "User ##{x}",
          lorem: "lorem ipsum dolor sit almet",
          long_text: lorem()
        }
      end)
  )

  def render(assigns) do
    ~F"""
    <div>
      <Table items={model <- @models} selected={nil}>
        <Table.Column label="ID" width="hidden 2xl:table-cell">
          {model.id}
        </Table.Column>
        <Table.Column label="Name" width="hidden sm:table-cell">
          {model.name}
        </Table.Column>
        <Table.Column label="Created at" width="hidden sm:table-cell">
          <p class="hidden xl:block">{Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime)}</p>
          <p class="block xl:hidden">{Timex.format!(model.created_at, "%b %d, %Y", :strftime)}</p>
        </Table.Column>
        <Table.Column label="User" width="hidden xl:table-cell">
          {model.user}
        </Table.Column>
        <Table.Column label="Short text" width="hidden lg:table-cell">
          {model.lorem}
        </Table.Column>
        <Table.Column label="Long text" width="hidden md:table-cell">
          <p class="hidden xl:block">{model.long_text}</p>
          <p class="block xl:hidden">{model.long_text |> String.slice(0, 70)}...</p>
        </Table.Column>
        <Table.Column class="table-cell sm:hidden">
          #{model.id}: {model.name} by {model.user} at {Timex.format!(model.created_at, "%b %d, %Y", :strftime)}
          <br>
          {model.long_text |> String.slice(0, 30)}...
        </Table.Column>
      </Table>
    </div>
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
            created_at: DateTime.utc_now(),
            user: "User #\#{x}",
            lorem: "lorem ipsum dolor sit almet",
            long_text: lorem()
          }
        end)
    )

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models} selected={nil}>
        <Table.Column label="ID" width="hidden 2xl:table-cell">
          {model.id}
        </Table.Column>
        <Table.Column label="Name" width="hidden sm:table-cell">
          {model.name}
        </Table.Column>
        <Table.Column label="Created at" width="hidden sm:table-cell">
          <p class="hidden xl:block">{Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime)}</p>
          <p class="block xl:hidden">{Timex.format!(model.created_at, "%b %d, %Y", :strftime)}</p>
        </Table.Column>
        <Table.Column label="User" width="hidden xl:table-cell">
          {model.user}
        </Table.Column>
        <Table.Column label="Short text" width="hidden lg:table-cell">
          {model.lorem}
        </Table.Column>
        <Table.Column label="Long text" width="hidden md:table-cell">
          <p class="hidden xl:block">{model.long_text}</p>
          <p class="block xl:hidden">{model.long_text |> String.slice(0, 70)}...</p>
        </Table.Column>
        <Table.Column class="table-cell sm:hidden">
          \#{model.id}: {model.name} by {model.user} at {Timex.format!(model.created_at, "%b %d, %Y", :strftime)}
          <br>
          {model.long_text |> String.slice(0, 30)}...
        </Table.Column>
      </Table>
      \"""
    end
    """
  end
end
