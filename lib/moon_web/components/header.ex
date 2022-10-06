defmodule MoonWeb.Components.Header do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop click, :event
  slot default

  def render(assigns) do
    ~F"""
    <header>
      <div class="relative z-10 py-4 lg:hidden flex flex-row gap-2 items-center justify-between text-bulma">
        <button type="button" class="focus:outline-none" phx-click={@click}>
          <span class="sr-only">Open sidebar</span>
          <svg
            width="1em"
            height="1em"
            viewBox="0 0 32 32"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
            class="text-moon-32"
          >
            <path d="M7.5 11.5h17m-17 8h17" stroke="currentColor" stroke-linecap="round" />
          </svg>
        </button>
        <a href="/">
          <svg
            width="1em"
            height="1em"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
            font-size="2rem"
            class="sc-eqhNQH fcnWEQ"
          >
            <path
              d="M8.64668 19.2933C12.3175 19.2933 15.2933 16.3175 15.2933 12.6466C15.2933 8.97581 12.3175 6 8.64668 6C4.97582 6 2 8.97581 2 12.6466C2 16.3175 4.97582 19.2933 8.64668 19.2933Z"
              fill="currentColor"
            />
            <path
              d="M22 8.2523C22 9.49622 20.9916 10.5046 19.7477 10.5046C18.5038 10.5046 17.4954 9.49622 17.4954 8.2523C17.4954 7.00839 18.5038 6 19.7477 6C20.9916 6 22 7.00839 22 8.2523Z"
              fill="currentColor"
            />
          </svg>
        </a>
      </div>
      <#slot />
    </header>
    """
  end
end
