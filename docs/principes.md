# Some principes
Here are some principles we're trying to use when developing MoonDS. Why do we think it's important? Well, in most cases, bad principles lead to a bad architecture. Bad architecture leads to buggy, unusable, unstable, and ugly code. So, to be aware of that, let's discuss some points that seem to be important to us.


## Our main goals are:
- create multi-technology design system
- ... to make frontend development easier for our consumers
- ... and make library development transparent, involve library consumers in feature discussion and/or implementing

## Programming rules:
We do preffer and respect the following principes:
Design First - as soon as your design is compatible with our figma files - you'll have painless integration of our components in your project. As much design differs - as much problems you'll have when implementing it.
Headless - as soon as we're using few techologies (React, Phoenix & Flutter) we need to use headless approach, so API, subcomponents structure & interactions are mostly predefined when implemnting component for each technology.
KISS & DRY - every time we do break them - we have to pay for it. list of cases can be provided.
SOLID - as soon as it can be applied to surface/live_view components (no inheritance, etc.). bc of SOLID (and bc of headless) we're about to use ...
  - Compound Pattern - every component is a compound of subcomponents, easely replaceable and a bit customizable.
  - Component Composition is prefferable vs creating new one. Less components mean less support. "Laziness is a one of the programmer's best quality" - tofind a qoute's source
Library development - gives us few more restrictions: 
  - Breaking Change - is something critical, would like to have a place for discussing it with connsumers before implemennting.


## Document workflow
- First should be reviewed with chatGPT.
- ... by MoonDS team after that
- ... and proposed for a review/discussion to our library consumers

# Gitflow
TODO: to describe

# Taskflow
TODO: to describe

## Namings
For historical reasons - some parser/formatter issues - we do not use notation? for boolean properties. In most cases the are prefixed with is_/has_, e.g. `is_headless` or `has_head` instead of `headless?` 





## Compound pattern

... in general it gives us a lot of flexibility. Not for free, but by increasing complexity.

What does it mean e.g. on form-field level:

1. Full syntax
```
<Field>
  <Field.Label>Label here</Field.Label>
  <Form.Input/>
  <Field.Hint>hint here</Field.Hint>
  <Field.Error/>
</Field>
```
This variant is fully customizable - elements sequence, presence, replacement, visual changes, icons in text and so on



2. Short syntax
```
<Field label="Label here" hint="hint here" hide_errors>
  <Form.Input/>
</Field>
```

This code looks easier to read, but it's less flexible - no classes, icons, etc.

3. Extra-short (only in components v1)
```
<Form.Input label="Label here" hint="hint here">
```

Code is not flexible, How would you customize the label or email here? And also - u can take an `<input>` only together wuth lot of other unecessary things, so it can be used only inside the form. we will need a separate input for other cases or realy dirty code inside (take a look at form components v1)