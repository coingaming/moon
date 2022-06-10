<h1 align="center" style="border-bottom: none;">M O O N</h1>
<h3 align="center">Set of UI components built with Surface UI library</h3>
<p align="center">
  <a href="https://conventionalcommits.org">
    <img alt="Conventional Commits" src="https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg">
  </a>
  <a href="https://github.com/semantic-release/semantic-release">
    <img alt="semantic-release" src="https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg">
  </a>
</p>

https://moon-surface.coingaming.io/tutorials/process-description-and-team-interactions

https://moon-surface.coingaming.io/tutorials/installation

_Note: This project uses **[semantic-release](https://semantic-release.gitbook.io/semantic-release/)** and **[conventional-commits](https://www.conventionalcommits.org/en/v1.0.0/)** spec, please use **[Commitizen](https://github.com/commitizen/cz-cli)**
to write commit messages_

# Troubleshooting setting up issues in Mac

If `./run-locally-dev.sh` is not working, try the following steps:

1. Install [asdf](https://asdf-vm.com/)
2. Run `asdf install`. This will install all the tool versions specified in the _.tool_versions_ file
   Or you can install each tool version manually by typing:  
   `asdf install erlang`  
   `asdf install elixir`  
   `asdf install nodejs`

3. Try running `iex -S mix phx.server`
4. Stop the command above, then try running `./run-locally-dev.sh`

# Security issues

Please do not publish this project, as it contains following security issues

1. Figma importer contains Figma API token (for secret files)

# Preferences to consider when writing code

In writing code try to remember following rules:

1. Code should be as short and simple as possible (less lines is better)
2. Code should be as explicit as possible (and compiler should catch as many errors as possible)
3. Use slots
4. Run tests

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
