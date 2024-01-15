## some elixirspecific handbook points

## Elixir-Specific Points
	0.  Treat warnings as errors. Always. 
  The same is expected from our consumers. SO , form that daywe won't be shy to produce deprectaion warning. you-were-noticed will be our common policy.


## live_view uses VMI approach
Common component module looks like

```elixir

defmodule Component.Module do
	@moduledoc "..."

	use|alias|import ...

	# here is the model described - with attr|slot macros
	attr :id, :string, default: nil
	attr :name, :string, required: true
	slot :header
	....

	def render(assigns) do
		#this is view
	end 

	# intents live here
	def handle_event("open", _params, socket), do: {:noreply, assign(socket, is_open: true)}
  ...
	def handle_event(intent_name, intent_params, socket) do
    {:noreply, assign(socket, model_delta(intent_name, intent_params, socket))}
  end
	...
end

```

### Preferred Solutions
The principle of KISS is highly regarded, even if it means sacrificing visual effects. HTML/CSS solutions are preferred over Elixir, and JavaScript is considered a last resort. And for sure we do not send mouse-move, hover or scroll events to the server.

### Naming Conventions
To overcome parser/formatter issues, we avoid using the `?` notation for boolean properties. Instead, we prefix them with `is_` or `has_`, such as `is_headless` or `has_head`, as opposed to `headless?`.
