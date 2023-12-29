# Some principes

## Few words about our headless

As soon as we're using few techologies, we need to use headless approach, so sub-components structure & interactions are mostly predefined.

## Components composition

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