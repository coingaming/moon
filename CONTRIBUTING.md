# Contributing

Thanks for your interest in contributing to Moon Design System!

Please take a moment to review this document **before submitting a pull request**.

- [Pull requests](#pull-requests)
- [Monorepo](#monorepo)
- [Documentation](#documentation)
- [Tests](#tests)
- [Commits](#commits)
- [Branches](#branches)
- [Accessibility](#accessibility)
- [Right to left (RTL)](#right-to-left)
- [Mobile First](#mobile-first)
- [Installation](#installation)
- [Prerelease Process](#prerelease-process)
- [Release Process](#release-process)

## Pull requests

**Please ask first before starting work on any new features.**

Having your pull request declined after investing a significant amount of time and effort into a new feature can be disheartening. To prevent such situations, we kindly request that contributors first create [an issue](https://github.com/coingaming/moon-design/issues) to initiate a discussion about any new features. This includes tasks like adding new components, modifying tokens, or exposing internal information.

It's crucial to understand that the Moon Design System is a complex ecosystem comprising `Figma` files, different versions for `React`, `Elixir`, and even `Flutter`. Ensuring consistency and feature parity across all these platforms involves numerous stakeholders and users who rely on us to avoid breaking changes. Thus, it's vital to respect this process and seek approval **before commencing work on any new features**.

If you are an internal employee, please contact Dmytro Kireiev via the internal chats. He serves as the product owner of the project and will be more than willing to assist you.

## Structure
(TODO_ - Explain difference between e.g)

Moon Surface has 2 different libraries set:

MoonWeb.Components - This is our v1 set of components that you currently use in Partners.

Moon.Design - This is a v2 set of components that we support, and it requires significantly stricter requirements. For instance, you have to support all variants from the Figma Master file, provide proper documentation and examples, and guarantee the ability to be reused in other projects.

## (Specific Requirements TODO_)

The Moon Design repo is using `(TODO_)`. Note that we are using `(TODO_)` **version 8**.

## Documentation

(TODO_)
Currently, the  documentation (located in `next-docs/`)(TODO_) is a Next.js app that contains examples.

It is essential that each component feature has a corresponding documentation page with code examples.

## Tests (TODO_)

You can run the test suite using the following commands:

```sh
pnpm run next test (TODO_)
```

Please ensure that the tests are passing when submitting a pull request.

If you're adding new features to Moon Design, please include tests.

## Commits

Commits follow the [Angular Commit Message Format](https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#-git-commit-guidelines).

## Branches

As a developer, you will you be branching and merging from `main`(TODO_), our base branch.

Consider `origin/main`(TODO_) to always represent the latest code deployed to production.

## Accessibility

All features should attempt to conform to as many items on The A11Y Project's [Web Accessibility Checklist](https://a11yproject.com/checklist) as possible. If a checkbox can't be completed, the justification should be documented for future reference.

## Right to left

Languages such as Arabic, Hebrew, and Persian are prime examples of "right to left" (RTL) languages, and we have numerous users from these regions.
It is essential that all components support RTL languages to ensure that web content is displayed and navigated correctly for users in these regions.

## Mobile First

Mobile devices are the most commonly used method of browsing the web. When designing and developing your component, always prioritize building with mobile devices in mind first.

If you need to modify the style at specific breakpoints, scale your changes upwards. Start by building for mobile by default and then add media queries for changes on larger screen sizes.

If you want to use CSS Grid, set your component's default display to block. This way, items will stack on mobile and other unsupported devices. Then, implement your grid at larger breakpoints.

## Installation

You only require a `(TODO_)` in the root directory to install everything you need.

```sh
(TODO_)
```


## Release Process

(TODO_)

Thanks to [changeset](https://github.com/changesets/changesets), we can generate version bumps automatically.


1. Run `TODO_` command. This will bump the versions of the packages previously specified with pnpm changeset (and any dependents of those) and update the changelog files.
2. Run `TODO_`. This will update the lockfile and rebuild packages.
3. Commit the changes. (e.g `git add .` and `git commit -m "chore: bump version X.X.X"`)
4. Push your changes.
5. Raise a pull request from [`develop` into `master`](https://github.com/coingaming/moon-design/compare/master...develop) (TODO_).
7. Obtain at least 1 approval.
8. Click the "Merge Pull Request" button to trigger an automatic release process.
9. After release is done tag a version on `master` branch and push your tag
```
git checkout master
git tag vX.X.X
git push && git push --tags
```
10. Communicate the release to the team!

## Additional materials

[Does It Belong in the System?](https://medium.com/eightshapes-llc/i-made-this-does-it-go-in-the-system-3b67b9894531)