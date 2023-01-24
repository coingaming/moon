defmodule MoonWeb.Pages.Design.ModalPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Select

  alias Moon.Components.Button
  alias Moon.Design.Modal
  alias Moon.Design.Modal.Panel

  alias Moon.Icons.ControlsClose
  alias Moon.Autolayouts.PullAside

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/modal",
        name: "Modal"
      }
    ]
  )

  data(modal_props, :list,
    default: [
      %{
        :name => 'open',
        :type => 'boolean',
        :required => 'Yes',
        :default => '-',
        :description => 'Whether the Modal is open or not.'
      },
      %{
        :name => 'close',
        :type => '()=> void',
        :required => 'Yes',
        :default => '-',
        :description => 'Called when the Modal is dismissed.'
      }
    ]
  )

  data(modal_panel_props, :list,
    default: [
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'Yes',
        :default => '-',
        :description => 'Tailwind classes for customization of Panel.'
      }
    ]
  )

  data(modal_backdrop_props, :list,
    default: [
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'Yes',
        :default => '-',
        :description => 'Tailwind classes for customization of Backdrop.'
      }
    ]
  )

  data(modal_1_is_open, :boolean, default: false)
  data(modal_2_is_open, :boolean, default: false)
  data(modal_3_is_open, :boolean, default: false)
  data(modal_4_is_open, :boolean, default: false)

  data(gender_options, :any)

  def mount(_params, _session, socket) do
    size_options = [
      [key: "Small", value: "small"],
      [key: "Medium", value: "medium"],
      [key: "Large", value: "large"]
    ]

    color_options = [
      [key: "Red", value: "red"],
      [key: "Blue", value: "blue"],
      [key: "Green", value: "green"]
    ]

    material_options = [
      [key: "Leather", value: "leather"],
      [key: "Wool", value: "wool"],
      [key: "Cotton", value: "cotton"],
      [key: "Silk", value: "silk"]
    ]

    {:ok,
     assign(socket,
       size_options: size_options,
       color_options: color_options,
       material_options: material_options
     )}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress title="Modal">
        <p>
          A modal is an interface element that appears over other content. It requires an interaction from the user before they can return to whatever is underneath.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="modal_1_example">
        <:example>
          <Button on_click="open_modal_1">Open dialog</Button>
          <Modal :if={@modal_1_is_open}>
            <Panel title_divider="true" footer_divider="true">
              <:title>Payment successful</:title>
              <:content>Your payment has been successfully submitted. We've sent you an
                email with all of the details of your order. Lorem ipsum dolor sit
                amet, consectetur adipiscing elit. Aliquam blandit massa at lorem
                fermentum volutpat. Aliquam varius faucibus turpis, in facilisis
                dui dictum ac. Nulla ac consequat enim. Ut lobortis ultricies
                mauris eget volutpat. Aliquam aliquam nisl in nulla sagittis, eget
                viverra est ullamcorper.
              </:content>
              <:footer>
                <PullAside>
                  <:left>
                    <Button on_click="close_modal_1">Got it, thanks!</Button>
                  </:left>
                </PullAside>
              </:footer>
            </Panel>
          </Modal>
        </:example>
        <:code>{get_example_code_1()}</:code>
        <:state>{get_state_1(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Example with big content" id="big_content">
        <:example>
          <Button on_click="open_modal_2">Open dialog</Button>
          <Modal :if={@modal_2_is_open}>
            <Panel title_divider="true" footer_divider="true">
              <:title>Payment successful</:title>
              <:content>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
                blandit massa at lorem fermentum volutpat. Aliquam varius faucibus
                turpis, in facilisis dui dictum ac. Nulla ac consequat enim. Ut
                lobortis ultricies mauris eget volutpat. Aliquam aliquam nisl in
                nulla sagittis, eget viverra est ullamcorper. Morbi vel eros sed
                mauris dignissim congue et nec ligula. Duis quis tellus a est
                facilisis finibus. Duis varius libero id arcu pretium, et ultrices
                diam tincidunt. Aenean laoreet, velit at tempus eleifend, lectus
                turpis interdum ipsum, ac porta elit libero at arcu. Nam maximus
                magna vel orci pulvinar, et dignissim mi egestas. Pellentesque
                dapibus rhoncus ex, a finibus tortor sagittis quis. In nunc
                mauris, scelerisque vitae elit pulvinar, consequat accumsan leo.
                Proin varius maximus erat sed convallis. Aliquam convallis turpis
                turpis, eget euismod justo elementum at. Curabitur ligula velit,
                volutpat eget lacus sed, congue hendrerit turpis. Ut justo felis,
                ultricies et ornare quis, finibus ac lectus. Nam scelerisque felis
                nec massa convallis, eu ornare mauris posuere. Vivamus lacinia
                feugiat odio. Mauris cursus eu libero sit amet sollicitudin. Proin
                urna lectus, sodales nec ultricies ut, pharetra a mauris. Cras
                quis pharetra velit. Pellentesque magna erat, bibendum volutpat
                facilisis vitae, euismod in odio. Donec id sem vehicula, mollis
                eros porttitor, mattis sem. Etiam augue ligula, consectetur
                lobortis ullamcorper a, ullamcorper a lectus. Nullam non auctor
                quam. Morbi a lorem ut eros lobortis ultricies vitae sed lacus.
                Proin auctor vestibulum lorem a porttitor. Nunc ullamcorper leo
                risus. Integer tincidunt erat leo, ut lacinia est volutpat sit
                amet. Nulla laoreet molestie pharetra. Suspendisse sed magna erat.
                Fusce et orci orci. Suspendisse sit amet finibus mi. Integer
                fringilla venenatis dolor, porttitor bibendum lorem mattis et.
                Maecenas nisl nisl, finibus sed dolor vel, rhoncus euismod lorem.
                Maecenas sit amet gravida nunc. Praesent iaculis nunc elit, ut
                viverra nisl aliquam non. Donec eget ex velit. Pellentesque sed
                laoreet nunc. Morbi eget augue cursus, laoreet lorem in, tempus
                magna. Aliquam quis auctor nibh, id ornare sapien. Aenean sem
                magna, tempus a tempus in, lobortis vitae nisi. Mauris lobortis
                tellus sit amet elit maximus ornare. Sed interdum ac purus quis
                feugiat. Praesent nunc quam, gravida placerat dui eget, tempus
                pharetra urna. Maecenas eros augue, rutrum vitae maximus dictum,
                consectetur ut orci. Phasellus ut consequat urna. Morbi
                pellentesque sapien mauris, quis ornare diam ultricies eu.
                Interdum et malesuada fames ac ante ipsum primis in faucibus.
                Etiam tincidunt lacus purus, sit amet ultricies elit dapibus et.
                Vestibulum at velit eu mauris tincidunt lobortis quis sed leo.
                Vivamus non rhoncus massa, et bibendum ligula. Sed pulvinar,
                tortor eu faucibus vestibulum, nunc magna laoreet leo, ut
                elementum diam ipsum vitae purus. Vestibulum egestas sit amet elit
                egestas auctor. Mauris vestibulum ex at erat viverra ultricies.
                Suspendisse et nisi enim. Aenean ut velit sit amet diam aliquet
                molestie non quis urna. Praesent nec arcu non nisl maximus tempus
                in in ligula. Sed sodales eu elit facilisis tempus. Suspendisse
                viverra porta velit, mollis tempor purus aliquam id. Vestibulum
                sit amet vehicula dolor. Vestibulum orci nulla, sodales vitae
                euismod at, aliquam egestas sapien. Pellentesque et massa et
                lectus imperdiet ullamcorper. Integer sit amet semper nisl, sed
                suscipit eros. Nunc quis quam leo. Pellentesque porttitor, ex
                vitae ultrices interdum, sapien tellus dictum lectus, quis
                convallis elit felis vitae nulla. Nulla volutpat cursus urna, sed
                facilisis nisi consectetur sed. Praesent ac euismod odio. Mauris
                laoreet id ante vel finibus. Nulla nec egestas mi. Aenean leo
                lacus, imperdiet at lobortis nec, egestas ac mi. Praesent ut
                molestie est. Sed est dui, rhoncus eget semper id, egestas in
                sapien. Vestibulum aliquet, orci eget ultricies placerat, felis
                leo euismod enim, efficitur lacinia nulla ipsum non odio. Etiam id
                urna ut tortor egestas mattis. Nullam eget urna ac massa facilisis
                auctor nec at diam. Aliquam imperdiet, tortor non dignissim
                semper, eros sem congue lacus, a vehicula diam tellus ut ligula.
                Sed eget porta nibh, nec interdum urna. In tempor placerat massa,
                at imperdiet leo tincidunt eget. Vestibulum eu laoreet nisl, et
                gravida mauris. Aliquam erat volutpat. Vivamus elit diam,
                fringilla varius congue quis, dignissim non sapien. Curabitur a
                magna vitae risus tempus vulputate. Ut metus metus, iaculis in
                tincidunt ullamcorper, eleifend vitae mauris. Aliquam erat
                volutpat. Nunc eu nisi placerat, feugiat eros non, fringilla
                purus. Aliquam erat volutpat. Morbi sit amet imperdiet felis, sit
                amet dapibus lacus. Sed aliquam ipsum vitae ipsum maximus
                convallis. Donec quis nulla placerat, scelerisque tellus ut,
                ullamcorper sapien. Pellentesque enim lacus, ornare mollis nisl
                vitae, rutrum tincidunt mauris. Sed suscipit, augue in venenatis
                ultrices, augue nunc viverra turpis, eget ornare tellus lectus sit
                amet felis. In aliquam ullamcorper nulla sit amet tristique.
                Pellentesque odio ipsum, pulvinar sit amet est eget, maximus
                accumsan leo. Aenean consequat tellus vel pulvinar bibendum.
                Suspendisse finibus volutpat nisl, id dictum est feugiat sit amet.
                Pellentesque euismod lectus leo. Integer imperdiet nisi egestas
                quam posuere, mollis imperdiet odio tincidunt. Nam non quam leo.
                Vivamus vulputate metus sed velit laoreet euismod id et turpis.
                Vestibulum dictum ac turpis quis ultrices. Vivamus non semper
                nunc. Nullam vitae dignissim augue. Aliquam mollis nibh enim, sit
                amet accumsan est suscipit ac. Cras dignissim aliquet turpis id
                aliquet. Mauris erat magna, mattis ut ligula eu, ultricies
                interdum dolor. Cras nec congue mi, vitae faucibus nisi. Fusce
                tincidunt ultrices eleifend. Vestibulum sit amet porta lectus.
                Fusce dapibus tortor in lectus vehicula lobortis. Vestibulum ac
                felis congue, consectetur nunc sed, porttitor lorem. Maecenas non
                ultrices diam, non molestie neque. Donec metus odio, bibendum nec
                facilisis vel, mattis ut ex. Morbi luctus ex eu est tincidunt
                lacinia. Sed commodo eget neque eget aliquet. Phasellus tincidunt
                justo imperdiet nunc scelerisque, sit amet interdum lorem
                dignissim. Lorem ipsum dolor sit amet, consectetur adipiscing
                elit. Class aptent taciti sociosqu ad litora torquent per conubia
                nostra, per inceptos himenaeos.
              </:content>
              <:footer>
                <PullAside>
                  <:left>
                    <Button on_click="close_modal_2">Got it, thanks!</Button>
                  </:left>
                </PullAside>
              </:footer>
            </Panel>
          </Modal>
        </:example>
        <:code>{get_example_code_2()}</:code>
        <:state>{get_state_2(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Example with styled content" id="styled_content">
        <:example>
          <Button on_click="open_modal_3">Open dialog</Button>
          <Modal :if={@modal_3_is_open}>
            <Panel class="lg:max-w-md bg-roshi text-goten rounded-none">
              <:controls_close>
                <ControlsClose class="text-moon-24" click="close_modal_3" />
              </:controls_close>
              <:content>
                <div class="pt-11 text-moon-24 text-goten font-medium text-center">
                  <div class="mt-2">Your payment has been successfully submitted.</div>
                </div>
              </:content>
              <:footer>
                <div class="flex items-center justify-center">
                  <Button variant="secondary" on_click="close_modal_3">Got it, thanks!</Button>
                </div>
              </:footer>
            </Panel>
          </Modal>
        </:example>
        <:code>{get_example_code_3()}</:code>
        <:state>{get_state_3(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Example with select" id="with_select">
        <:example>
          <Button on_click="open_modal_4">Open dialog</Button>
          <Modal :if={@modal_4_is_open}>
            <Panel title_divider="true" footer_divider="true">
              <:title>Modal title</:title>
              <:controls_close>
                <ControlsClose click="close_modal_4" />
              </:controls_close>
              <:content>
                <Select label="Size" class="w-full" options={@size_options} prompt="Please select size" />
                <Select label="Color" class="w-full" options={@color_options} prompt="Please select color" />
                <Select
                  label="Material"
                  class="w-full"
                  options={@material_options}
                  prompt="Please select material"
                />
              </:content>
              <:footer>
                <PullAside>
                  <:right>
                    <div class="flex gap-2 justify-end pt-2">
                      <Button variant="secondary" on_click="close_modal_4">Cancel</Button>
                      <Button on_click="close_modal_4">Create</Button>
                    </div>
                  </:right>
                </PullAside>
              </:footer>
            </Panel>
          </Modal>
        </:example>
        <:code>{get_example_code_4()}</:code>
        <:state>{get_state_4(assigns)}</:state>
      </ExampleAndCode>

      <PropsTable title="Modal" data={@modal_props} />
      <PropsTable title="Modal.Panel" data={@modal_panel_props} />
      <PropsTable title="Modal.Backdrop" data={@modal_backdrop_props} />
    </Page>
    """
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event("open_modal_1", _params, socket) do
    socket = assign(socket, modal_1_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal_1", _params, socket) do
    socket = assign(socket, modal_1_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_modal_2", _params, socket) do
    socket = assign(socket, modal_2_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal_2", _params, socket) do
    socket = assign(socket, modal_2_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_modal_3", _params, socket) do
    socket = assign(socket, modal_3_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal_3", _params, socket) do
    socket = assign(socket, modal_3_is_open: false)
    {:noreply, socket}
  end

  def handle_event("open_modal_4", _params, socket) do
    socket = assign(socket, modal_4_is_open: true)
    {:noreply, socket}
  end

  def handle_event("close_modal_4", _params, socket) do
    socket = assign(socket, modal_4_is_open: false)
    {:noreply, socket}
  end

  def get_example_code_1() do
    """
    <Button on_click="open_modal_1">Open dialog</Button>
    <Modal :if={@modal_1_is_open}>
        <Panel title_divider="true" footer_divider="true">
          <:title>Payment successful</:title>
          <:content>Your payment has been successfully submitted. We've sent you an
            email with all of the details of your order. Lorem ipsum dolor sit
            amet, consectetur adipiscing elit. Aliquam blandit massa at lorem
            fermentum volutpat. Aliquam varius faucibus turpis, in facilisis
            dui dictum ac. Nulla ac consequat enim. Ut lobortis ultricies
            mauris eget volutpat. Aliquam aliquam nisl in nulla sagittis, eget
            viverra est ullamcorper.
          </:content>
          <:footer>
            <PullAside>
              <:left>
                <Button on_click="close_modal_1">Got it, thanks!</Button>
              </:left>
            </PullAside>
          </:footer>
        </Panel>
      </Modal>
    """
  end

  def get_example_code_2() do
    """
    <Button on_click="open_modal_2">Open dialog</Button>
    <Modal :if={@modal_2_is_open}>
        <Panel title_divider="true" footer_divider="true">
          <:title>Payment successful</:title>
          <:content>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam
            blandit massa at lorem fermentum volutpat. Aliquam varius faucibus
            turpis, in facilisis dui dictum ac. Nulla ac consequat enim. Ut
            lobortis ultricies mauris eget volutpat. Aliquam aliquam nisl in
            nulla sagittis, eget viverra est ullamcorper. Morbi vel eros sed
            mauris dignissim congue et nec ligula. Duis quis tellus a est
            facilisis finibus. Duis varius libero id arcu pretium, et ultrices
            diam tincidunt. Aenean laoreet, velit at tempus eleifend, lectus
            turpis interdum ipsum, ac porta elit libero at arcu. Nam maximus
            magna vel orci pulvinar, et dignissim mi egestas. Pellentesque
            dapibus rhoncus ex, a finibus tortor sagittis quis. In nunc
            mauris, scelerisque vitae elit pulvinar, consequat accumsan leo.
            Proin varius maximus erat sed convallis. Aliquam convallis turpis
            turpis, eget euismod justo elementum at. Curabitur ligula velit,
            volutpat eget lacus sed, congue hendrerit turpis. Ut justo felis,
            ultricies et ornare quis, finibus ac lectus. Nam scelerisque felis
            nec massa convallis, eu ornare mauris posuere. Vivamus lacinia
            feugiat odio. Mauris cursus eu libero sit amet sollicitudin. Proin
            urna lectus, sodales nec ultricies ut, pharetra a mauris. Cras
            quis pharetra velit. Pellentesque magna erat, bibendum volutpat
            facilisis vitae, euismod in odio. Donec id sem vehicula, mollis
            eros porttitor, mattis sem. Etiam augue ligula, consectetur
            lobortis ullamcorper a, ullamcorper a lectus. Nullam non auctor
            quam. Morbi a lorem ut eros lobortis ultricies vitae sed lacus.
            Proin auctor vestibulum lorem a porttitor. Nunc ullamcorper leo
            risus. Integer tincidunt erat leo, ut lacinia est volutpat sit
            amet. Nulla laoreet molestie pharetra. Suspendisse sed magna erat.
            Fusce et orci orci. Suspendisse sit amet finibus mi. Integer
            fringilla venenatis dolor, porttitor bibendum lorem mattis et.
            Maecenas nisl nisl, finibus sed dolor vel, rhoncus euismod lorem.
            Maecenas sit amet gravida nunc. Praesent iaculis nunc elit, ut
            viverra nisl aliquam non. Donec eget ex velit. Pellentesque sed
            laoreet nunc. Morbi eget augue cursus, laoreet lorem in, tempus
            magna. Aliquam quis auctor nibh, id ornare sapien. Aenean sem
            magna, tempus a tempus in, lobortis vitae nisi. Mauris lobortis
            tellus sit amet elit maximus ornare. Sed interdum ac purus quis
            feugiat. Praesent nunc quam, gravida placerat dui eget, tempus
            pharetra urna. Maecenas eros augue, rutrum vitae maximus dictum,
            consectetur ut orci. Phasellus ut consequat urna. Morbi
            pellentesque sapien mauris, quis ornare diam ultricies eu.
            Interdum et malesuada fames ac ante ipsum primis in faucibus.
            Etiam tincidunt lacus purus, sit amet ultricies elit dapibus et.
            Vestibulum at velit eu mauris tincidunt lobortis quis sed leo.
            Vivamus non rhoncus massa, et bibendum ligula. Sed pulvinar,
            tortor eu faucibus vestibulum, nunc magna laoreet leo, ut
            elementum diam ipsum vitae purus. Vestibulum egestas sit amet elit
            egestas auctor. Mauris vestibulum ex at erat viverra ultricies.
            Suspendisse et nisi enim. Aenean ut velit sit amet diam aliquet
            molestie non quis urna. Praesent nec arcu non nisl maximus tempus
            in in ligula. Sed sodales eu elit facilisis tempus. Suspendisse
            viverra porta velit, mollis tempor purus aliquam id. Vestibulum
            sit amet vehicula dolor. Vestibulum orci nulla, sodales vitae
            euismod at, aliquam egestas sapien. Pellentesque et massa et
            lectus imperdiet ullamcorper. Integer sit amet semper nisl, sed
            suscipit eros. Nunc quis quam leo. Pellentesque porttitor, ex
            vitae ultrices interdum, sapien tellus dictum lectus, quis
            convallis elit felis vitae nulla. Nulla volutpat cursus urna, sed
            facilisis nisi consectetur sed. Praesent ac euismod odio. Mauris
            laoreet id ante vel finibus. Nulla nec egestas mi. Aenean leo
            lacus, imperdiet at lobortis nec, egestas ac mi. Praesent ut
            molestie est. Sed est dui, rhoncus eget semper id, egestas in
            sapien. Vestibulum aliquet, orci eget ultricies placerat, felis
            leo euismod enim, efficitur lacinia nulla ipsum non odio. Etiam id
            urna ut tortor egestas mattis. Nullam eget urna ac massa facilisis
            auctor nec at diam. Aliquam imperdiet, tortor non dignissim
            semper, eros sem congue lacus, a vehicula diam tellus ut ligula.
            Sed eget porta nibh, nec interdum urna. In tempor placerat massa,
            at imperdiet leo tincidunt eget. Vestibulum eu laoreet nisl, et
            gravida mauris. Aliquam erat volutpat. Vivamus elit diam,
            fringilla varius congue quis, dignissim non sapien. Curabitur a
            magna vitae risus tempus vulputate. Ut metus metus, iaculis in
            tincidunt ullamcorper, eleifend vitae mauris. Aliquam erat
            volutpat. Nunc eu nisi placerat, feugiat eros non, fringilla
            purus. Aliquam erat volutpat. Morbi sit amet imperdiet felis, sit
            amet dapibus lacus. Sed aliquam ipsum vitae ipsum maximus
            convallis. Donec quis nulla placerat, scelerisque tellus ut,
            ullamcorper sapien. Pellentesque enim lacus, ornare mollis nisl
            vitae, rutrum tincidunt mauris. Sed suscipit, augue in venenatis
            ultrices, augue nunc viverra turpis, eget ornare tellus lectus sit
            amet felis. In aliquam ullamcorper nulla sit amet tristique.
            Pellentesque odio ipsum, pulvinar sit amet est eget, maximus
            accumsan leo. Aenean consequat tellus vel pulvinar bibendum.
            Suspendisse finibus volutpat nisl, id dictum est feugiat sit amet.
            Pellentesque euismod lectus leo. Integer imperdiet nisi egestas
            quam posuere, mollis imperdiet odio tincidunt. Nam non quam leo.
            Vivamus vulputate metus sed velit laoreet euismod id et turpis.
            Vestibulum dictum ac turpis quis ultrices. Vivamus non semper
            nunc. Nullam vitae dignissim augue. Aliquam mollis nibh enim, sit
            amet accumsan est suscipit ac. Cras dignissim aliquet turpis id
            aliquet. Mauris erat magna, mattis ut ligula eu, ultricies
            interdum dolor. Cras nec congue mi, vitae faucibus nisi. Fusce
            tincidunt ultrices eleifend. Vestibulum sit amet porta lectus.
            Fusce dapibus tortor in lectus vehicula lobortis. Vestibulum ac
            felis congue, consectetur nunc sed, porttitor lorem. Maecenas non
            ultrices diam, non molestie neque. Donec metus odio, bibendum nec
            facilisis vel, mattis ut ex. Morbi luctus ex eu est tincidunt
            lacinia. Sed commodo eget neque eget aliquet. Phasellus tincidunt
            justo imperdiet nunc scelerisque, sit amet interdum lorem
            dignissim. Lorem ipsum dolor sit amet, consectetur adipiscing
            elit. Class aptent taciti sociosqu ad litora torquent per conubia
            nostra, per inceptos himenaeos.
          </:content>
          <:footer>
            <PullAside>
              <:left>
                <Button on_click="close_modal_2">Got it, thanks!</Button>
              </:left>
            </PullAside>
          </:footer>
        </Panel>
      </Modal>
    """
  end

  def get_example_code_3() do
    """
    <Button on_click="open_modal_3">Open dialog</Button>
    <Modal :if={@modal_3_is_open}>
      <Panel class="lg:max-w-md bg-roshi text-goten rounded-none">
        <:controls_close>
          <ControlsClose class="text-moon-24" click="close_modal_3" />
        </:controls_close>
        <:content>
          <div class="pt-11 text-moon-24 text-goten font-medium text-center">
            <div class="mt-2">Your payment has been successfully submitted.</div>
          </div>
        </:content>
        <:footer>
          <div class="flex items-center justify-center">
            <Button variant="secondary" on_click="close_modal_3">Got it, thanks!</Button>
          </div>
        </:footer>
      </Panel>
    </Modal>
    """
  end

  def get_example_code_4() do
    """
    <Button on_click="open_modal_4">Open dialog</Button>
    <Modal :if={@modal_4_is_open}>
      <Panel title_divider="true" footer_divider="true">
        <:title>Modal title</:title>
        <:controls_close>
          <ControlsClose click="close_modal_4" />
        </:controls_close>
        <:content>
            <Select label="Size" class="w-full" options={@size_options} prompt="Please select size" />
            <Select label="Color" class="w-full" options={@color_options} prompt="Please select color" />
            <Select label="Material" class="w-full" options={@material_options} prompt="Please select material" />
        </:content>
        <:footer>
          <PullAside>
            <:right>
              <div class="flex gap-2 justify-end pt-2">
                <Button variant="secondary" on_click="close_modal_4">Cancel</Button>
                <Button on_click="close_modal_4">Create</Button>
              </div>
            </:right>
          </PullAside>
        </:footer>
      </Panel>
    </Modal>
    """
  end

  def get_state_1(assigns) do
    inspect(%{modal_1_is_open: assigns.modal_1_is_open})
  end

  def get_state_2(assigns) do
    inspect(%{modal_2_is_open: assigns.modal_2_is_open})
  end

  def get_state_3(assigns) do
    inspect(%{modal_3_is_open: assigns.modal_3_is_open})
  end

  def get_state_4(assigns) do
    inspect(%{modal_4_is_open: assigns.modal_4_is_open})
  end
end
