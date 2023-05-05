# Moon UIPattern API

Provides Application Programming Interface for software engineers to build quickly views that consist of:

1. List table view (with filters)
2. Create resource
3. Update resource


# Two options we have

## 1. HTML is generated for Mobile and Desktop

```elixir
defmodule Mobile do 
  slot default
  def render(assigns) do 
    ~F"""
    <div class="md:hidden bg-red-500">
      <#slot {@default} />
    </div>
    """
  end
end

defmodule Desktop do  
  slot default
  def render(assigns) do 
    ~F"""
    <div class="hidden md:visible bg-green-500">
      <#slot {@default} />
    </div>
    """
  end
end

defmodule Example do 
  slot default
  def render(assigns) do 
    ~F"""
    <Mobile>
      <#slot {@default} />
    </Mobile>
    <Desktop>
      <#slot {@default} />
    </Desktop>
    """
  end
end
```

This has following problem, when content generated, it just can not be slot, because using ID, will cause duplicate ID error.

```elixir
<Example>
  <div id="duplicate-id-examle" />
</Example>
```

To address this problem, we can do this (after adding slot vars to Mobile and Desktop components):

```elixir
<Example :let={device_type: device_type}>
  <div id={"duplicate-id-examle-#{device_type}"} />
</Example>
```

And rendered HTML will be valid:
```elixir
<div class="hidden md:visible bg-green-500">
  <div id={"duplicate-id-examle-mobile"} />
  <div id={"duplicate-id-examle-desktop"} />
</div>
```

Cons:
1. Content is rendered twice (meaning bigger footprint on data load)
2. A bit more complex syntax (and additional context for developer to remember)

Pros:
1. Event managment works as expected? (Imagine open and close for both Modal and BottomSheet)

## 2. HTML is generated only for current device

In sake of clarity, we just have a plug, that sets is_mobile boolean for context.

```elixir
defmodule Mobile do 
  prop is_mobile, :boolean, from_context: :is_mobile
  slot default
  def render(assigns) do 
    ~F"""
    <div class="md:hidden bg-red-500" :if={@is_mobile}>
      <#slot {@default} />
    </div>
    """
  end
end

defmodule Desktop do  
  prop is_mobile, :boolean, from_context: :is_mobile
  slot default
  def render(assigns) do 
    ~F"""
    <div class="hidden md:visible bg-green-500" :if={!@is_mobile}>
      <#slot {@default} />
    </div>
    """
  end
end

defmodule Example do 
  slot default
  def render(assigns) do 
    ~F"""
    <Mobile>
      <#slot {@default} />
    </Mobile>
    <Desktop>
      <#slot {@default} />
    </Desktop>
    """
  end
end

defmodule HelloWeb.Plug.SetIsMobile do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _default) do
    assign(conn, :is_mobile, true)
  end
end

defmodule HelloWeb.Hooks.SetIsMobile do
  import Phoenix.Component

  def on_mount(:default, _params, _session, socket) do
    socket = assign(socket, is_mobile: true)
    {:cont, Surface.Components.Context.put(socket, is_mobile: true)}
  end
end
```

Now we can call:

```elixir
<Example>
  <div id={"duplicate-id-examle"} />
</Example>
```

And rendered HTML will be valid:
```elixir
<div class="hidden md:visible bg-green-500">
  <div id={"duplicate-id-examle-mobile"} />
</div>
```

Cons:
1. More problems #1. How to detect correct device on initial page load? (Only headers available, but not screen resolution?)
2. More problems #2. How to resize on window resize? (Full page reload, roundtrip to server.)
3. Event managment must be specific to device (sending event to non-existant component resolves as error.)


# Problems with the "Two options that we have"

1. Both require "thinking" from developer. Shouln't Moon itself address these problems, so from developer perspective he can pass data to components and they just work?
2. We could apply both ways like SoftMobile (css hide) and HardMobile (not renderd in HTML dom), but yet again, it introduces different usage and confusion.


# Proposal

...
