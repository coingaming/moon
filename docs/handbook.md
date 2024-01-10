# Moon (Elixir) Developer's Handbook Proposal
Version 0.0-cgpt-3

## Document Workflow
	•	Review by MoonDS team
	•	Proposal for review/discussion with library consumers

## Main Goal
The main goal of this handbook is to establish a transparent and multi-technology design system for MoonDS, fostering a community both within and outside the company. This involves making frontend development easier for consumers and involving the community in feature discussions and implementation of the library.

## Principles
We follow these principles when developing MoonDS to ensure code quality and component understanding:
	1.	Design First: Integration of our components is painless when the design aligns with our Figma files. Divergent designs result in more implementation difficulties for the consumer.
	2.	Headless: MoonDS utilizes React, Phoenix, and Flutter, requiring a headless approach for predefined APIs, subcomponent structures, and interactions across technologies.
	3.	KISS & DRY: Violating these principles leads to increased challenges and should be avoided. A list of specific cases can be provided.
	4.	SOLID: While SOLID can't be fully applied to surface/live_view/react? components, we adopt the Compound Pattern, allowing easy replacement and customizations of components. Component composition is preferred over creating new components. Simplicity is valued in order to minimize support requirements.
	5.	Library Development: We consider consumer feedback before implementing breaking changes and aim to support diverse architecture solutions. Examples are provided to assist consumers in their own implementations.

## Areas for Improvement
Currently, MoonDS relies heavily on Tailwind CSS, this point can be evaluated for potential enhancements.

## Gitflow
The recommended Gitflow for MoonDS development is as follows:
  0.  Find or create Jira Task 
	1.	Pull the last the main branch.
	2.	Checkout to a new branch with the format MDS-<JIRA_TASK_NR>-...
	3.	Code and test on the branch
	4.	Create a pull request (PR) to the main branch
	5.	Obtain approvals and pass checks
	6.	Squash and merge the branch into the main branch

## Proposal Flow
Proposals are initiated through GitHub issues, followed by synchronous or asynchronous discussions. Participants reach a conclusion, deciding whether to implement, investigate further, postpone, or reconsider the proposal in the future. Proposals may then proceed through the  GitFlow.

## Git Hygiene
To maintain a clean Git history, rebase is preferred over merge. Atomic commits are encouraged, and conventional commit messages are collected by the CI system and added to CHANGELOG.md. Direct pushes to the main branch are prohibited unless authorized.

## Scrum
We adopt a non-strict Scrum approach with one-month sprints. Daily meetings assist collaboration, and sprint reviews (including retro and demo sometimes) are conducted, without plannings.


## Elixir-Specific Points

### Preferred Solutions
The principle of KISS is highly regarded, even if it means sacrificing visual effects. HTML/CSS solutions are preferred over Elixir, and JavaScript is considered a last resort. And for sure we do not send mouse-move, hover or scroll events to the server.

### Naming Conventions
To overcome parser/formatter issues, we avoid using the `?` notation for boolean properties. Instead, we prefix them with `is_` or `has_`, such as `is_headless` or `has_head`, as opposed to `headless?`.
