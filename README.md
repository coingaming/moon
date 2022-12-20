# Moon Design System
<h3 >Set of UI components built with Surface UI library</h3>
<p>
  <a href="https://conventionalcommits.org">
    <img alt="Conventional Commits" src="https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg">
  </a>
  <a href="https://github.com/semantic-release/semantic-release">
    <img alt="semantic-release" src="https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg">
  </a>
</p>



<img width="644" alt="Moon Design System" src="https://user-images.githubusercontent.com/232199/133601344-e63bd62f-dd0f-47a1-9d1e-b5cb065e5a90.png">

_Note: This project uses **[semantic-release](https://semantic-release.gitbook.io/semantic-release/)** and **[conventional-commits](https://www.conventionalcommits.org/en/v1.0.0/)** spec, please use **[Commitizen](https://github.com/commitizen/cz-cli)**
to write commit messages_

## Resources

📖 [Documentation](https://moon.surface.io)

## Setup

Clone the repository: `git clone git@github.com:coingaming/moon.git`

Start local development server by running `run-locally-dev.sh`

If `./run-locally-dev.sh` is not working, try the following steps:

1. Install [asdf](https://asdf-vm.com/) and plugins
   `asdf plugin add erlang`  
   `asdf plugin add elixir`  
   `asdf plugin add nodejs`
2. Run `asdf install`. This will install all the tool versions specified in the _.tool_versions_ file
   Or you can install each tool version manually by typing:
   `asdf install erlang` # and follow https://github.com/asdf-vm/asdf-erlang#asdf-erlang on fail (e.g. `export KERL_CONFIGURE_OPTIONS="--without-wx --without-javac"`)
   `asdf install elixir`  
   `asdf install nodejs`

3. Install assets dependencies with `cd assets && npm i && cd -`
4. Try running `iex -S mix phx.server`
5. Stop the command above, then try running `./run-locally-dev.sh`
6. If you do see error in ElixirLS extension "no elixir command found", you'll need to `cp .tool-versions ~`

Install dependencies: `mix deps.get`

To format your code, run `mix format` , `mix surface.format`

## Running .run-auto-importers.sh

This script imports figma assets and icons. You need to set the values in the .env file.
You also need read access to the assets tool repo https://github.com/coingaming/assets
Kindly check if you can clone this repo, if not, ask YulianaYarema @yarema184

## Tests
All newly added components must come with tests. In order to run the tests, run `mix test`

## Preferences to consider when writing code

In writing code try to remember following rules:

1. Code should be as short and simple as possible (less lines is better)
2. Code should be as explicit as possible (and compiler should catch as many errors as possible)
3. Moon Design System follows [headless design ](https://garden.mirahi.io/get-started-with-headless-design-systems/) approach - emphasis is on building smart, functional and reusable UI components.
4. Use slots
5. Add and run tests
6. Create component's page in moon_web application with API described and state shown
7. Use following classes for TW-way styling:
   - Use Moon classes for: (see ds-moon-preset.js for full list of variables, and themes/moon-design-\*.css for values)
     - font sizes
     - border-radius - rounded-moon-{s - big elements, e.g cart, i - interactive, e.g button}
     - shadows
     - font-weight - only 2
   - Use TailWind classes for following reasons
     - transition
     - breakpoints - @media
   - And do not forget to use RTL features
     - use rtl: and ltr: prefixes for according write-direction styles
     - use ps & pe instead of pl & pr accordingly

```
alias Moon.Components.TextInput
alias Moon.Assets.Icons.IconCloseRounded
alias Moon.Assets.Icons.IconZoom

<TextInput placeholder="Search for dashboard, segments and more">
  <:left_icon>
    <IconZoom>
  </:left_icon>
  <:right_icon>
    <IconCloseRounded on_click="clear_search">
  </:right_icon>
</TextInput>
```

```bash
mix test
```
