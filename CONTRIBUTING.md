# Contributing

Thank you for your interest in contributing to Moon Design System!

Please take a moment to review this document **before submitting a pull request**.

- [Pull requests](#pull-requests)
- [Structure](#structure)
- [Documentation](#documentation)
- [Tests](#tests)
- [Commits](#commits)
- [Branches](#branches)
- [Accessibility](#accessibility)
- [Right to left (RTL)](#right-to-left)
- [Mobile First](#mobile-first)
- [Additional materials](#additional-materials)

## Pull requests

**Please ask first before starting work on any new features.**

Having your pull request declined after investing a significant amount of time and effort into a new feature can be disheartening. To prevent such situations, we kindly request that contributors first create [an issue](https://github.com/coingaming/moon/issues) to initiate a discussion about any new features. This includes tasks like adding new components, modifying tokens, or exposing internal information.

It's crucial to understand that the Moon Design System is a complex ecosystem comprising `Figma` files, different versions for `React`, `Elixir`, and even `Flutter`. Ensuring consistency and feature parity across all these platforms involves numerous stakeholders and users who rely on us to avoid breaking changes. Thus, it's vital to respect this process and seek approval **before commencing work on any new features**.

If you are an internal employee, please contact Dmytro Kireiev via the internal chats. He serves as the product owner of the project and will be more than willing to assist you.

## Structure

The Moon Surface framework comprises two distinct libraries:

`Moon.Components` - this is our v1 set of legacy components, which has not received updates since autumn 2022.

`Moon.Design` -  new v2 set of headless components that we actively develop and support.

It is crucial to note that all v2 components under the `Moon.Design` namespace have significantly stricter requirements. For instance, these components must support all variants from the Figma Master file, provide comprehensive documentation and examples, and ensure their reusability in other projects.

## Documentation

Each component within the Moon Design System is accompanied by a corresponding documentation page (located in `moon_web/pages/design`), where all component features shall be described with relevant examples and corresponding code snippets (examples located in `moon_web/examples/design`).

Every example must be tested to ensure accuracy.

To include a property in the component's props table on the component page, each property should have a `@doc` attribute with a descriptive explanation.

When creating an entirely new component, e.g `Moon.Design.Form.SomethingAwesome`, please use the following command:

```sh
mix moon.gen.component Form.SomethingAwesome
```

This command will generate the necessary component, page, and also provide instructions for integrating it into the router and left menu.

## Tests

You can run the test suite using the following command:

```sh
mix test
```

Please ensure that the tests are passing when submitting a pull request.

If you're adding new components to Moon Design, please include tests.

## Commits

This project uses [semantic-release](https://semantic-release.gitbook.io/semantic-release/) and [conventional-commits](https://www.conventionalcommits.org/en/v1.0.0/) spec, please use [Commitizen](https://github.com/commitizen/cz-cli)
to write commit messages.

## Branches

As a developer, you will you be branching and merging from `main`, our base branch.

Consider `origin/main` to always represent the latest code deployed to production.

## Accessibility

All features should attempt to conform to as many items on The A11Y Project's [Web Accessibility Checklist](https://a11yproject.com/checklist) as possible. If a checkbox can't be completed, the justification should be documented for future reference.

## Right to left

Languages such as Arabic, Hebrew, and Persian are prime examples of "right to left" (RTL) languages, and we have numerous users from these regions.
It is essential that all components support RTL languages to ensure that web content is displayed and navigated correctly for users in these regions.

## Mobile First

Mobile devices are the most commonly used method of browsing the web. When designing and developing your component, always prioritize building with mobile devices in mind first.

If you need to modify the style at specific breakpoints, scale your changes upwards. Start by building for mobile by default and then add media queries for changes on larger screen sizes.

If you want to use CSS Grid, set your component's default display to block. This way, items will stack on mobile and other unsupported devices. Then, implement your grid at larger breakpoints.

## Additional materials

[Does It Belong in the System?](https://medium.com/eightshapes-llc/i-made-this-does-it-go-in-the-system-3b67b9894531)