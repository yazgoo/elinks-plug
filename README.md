# installing

```
$ mkdir -p ~/.elinks/
$ cd ~/.elinks
$ git clone http://github.com/yazgoo/elinks-plug

in ~/.elinks/, Add this line at the top of hooks.lua

```lua
loadfile(debug.getinfo(1, "S").source:sub(2):match("(.*/)") .. "/elinks-plug/plug.lua")()
```

# adding plugins

in your hooks.lua, add plugins, e.g.

```
plug("http://github.com/yazgoo/elinks-basis")
```

then start elinks to install them.
