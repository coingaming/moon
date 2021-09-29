defmodule Moon.Components.ToastStack do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Components.Toast
  alias Moon.Components.Toast.Message

  @default_duration 4000

  data toasts, :keyword, default: Keyword.new()

  def render(assigns) do
    ~F"""
    <div class="fixed md:top-0 md:right-0 bottom-0 flex flex-col max-w-sm md:max-w-md p-4 items-end overflow-y-scroll overflow-x-hidden mx-auto">
      <Toast
        :for={{id, toast} <- @toasts}
        id={id}
        message={toast.message}
        variant={toast.variant}
        closeable={toast.closeable}
        link_text={toast.link_text}
        link_href={toast.link_href}
        on_close="hide_toast"
      />
    </div>
    """
  end

  def show(toast, id = %Message{}) do
    send_update(__MODULE__, id: id, toast: %{toast | id: generate_id()})
  end

  def show(toasts, id) when is_list(toasts) do
    Enum.each(toasts, fn toast ->
      send_update(__MODULE__, id: id, toast: %{toast | id: generate_id()})
    end)
  end

  def hide_toast(toast_id, stack_id) do
    send_update(__MODULE__, id: stack_id, toast_to_hide: toast_id)
  end

  def update(%{toast: toast}, socket) do
    Process.send_after(self(), {:hide_toast, toast.id}, @default_duration)

    {:ok, assign(socket, toasts: socket.assigns.toasts ++ [{toast.id, toast}])}
  end

  def update(%{toast_to_hide: toast_id}, socket) do
    {
      :ok,
      assign(socket, toasts: Keyword.delete(socket.assigns.toasts, toast_id))
    }
  end

  def update(_assigns, socket), do: {:ok, socket}

  def handle_event("hide_toast", %{"id" => id}, socket) do
    toasts = Keyword.delete(socket.assigns.toasts, String.to_atom(id))
    {:noreply, assign(socket, toasts: toasts)}
  end

  defp generate_id do
    12
    |> :crypto.strong_rand_bytes()
    |> Base.url_encode64()
    |> binary_part(0, 12)
    |> String.to_atom()
  end
end
