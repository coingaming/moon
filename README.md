# MOON

Moon is set of rules, that everybody knows about, are mostly happy about, and are welcome to improve.

# How I create a new site?

* Implement Site=moon/sites/site_name (see moon/sites/aposta10 as example)
* Implement Page=moom/sites/site_name/pages/main_page.ex
* Page accepts props as data and triggers events from whoever is using it (meaning it knows nothing about data layer), but at the same time, it is touchable prototype 

[ENTER VIDEO HERE OF CREATING A NEW SITE EXAMPLE + COMMANDS TO SETUP PROJECT]

```
# setup lab umbrella
https://github.com/coingaming/lab_umbrella

# create user in lab
LabAuth.simple_register(UsersFlask.Flask, 1, "username", "password")

# setup domain, page, layout, site, path
http://localhost:4120/

# visit domain at path
http://aposta10.localhost:4130/

```


# MOON is system, that consists of elements

* Design libary (that is called Moon, yay!)
* Lab Umbrella 
* Site Builder


# If you want to create a Website, you should understand, where you store the data and how you present the data

## Presentation of data is by components

* https://github.com/coingaming/moon (each subfolder in lib will contain linked documentation)
* Moon is a design libary, that contain components and themes support. 


## Requirements for view components

* Using this libary, 0 lines of CSS is needed to write. (Correct composition is important!)


## To run the project

```
mix phx.server
```

### Aposta10

http://localhost:4000/sites/aposta10


# Boring requirements

* Code must document itself (meaning no complex code, prefer named arguments to positional arguments, prefer https://hexdocs.pm/elixir/Map.html to {{:key, "value"}, {:key2, "value2"}})
