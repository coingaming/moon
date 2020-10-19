# Installation 

## for Moon developer

```
git clone git@github.com:coingaming/moon.git
cd moon
bash run-install.sh
bash run-locally-dev.sh
open "http://localhost:4000"
```

## for Site Builder developer

add into mix.exs deps:

```
  {:moon, git: "git@github.com:coingaming/moon.git"}
```

Note: Site Builder developer (who is connecting template with data layer) - should not write any HTML or CSS - only passing data (including handle_event-s) to components that will be available from moon/sites.

