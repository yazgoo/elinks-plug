# installing

This requires [git](https://git-scm.com/) command line to be installed.

```shell
$ mkdir -p ~/.elinks/plugged
$ cd ~/.elinks/plugged
$ git clone http://github.com/yazgoo/elinks-plug
```

Add this line at the top of `~/.elinks/hooks.lua` (create it if it does not exist):

```lua
loadfile(debug.getinfo(1, "S").source:sub(2):match("(.*/)") .. "/plugged/elinks-plug/main.lua")()
```

# adding plugins

in your `~/.elinks/hooks.lua`, add plugins, e.g.

```lua
plug("git@github.com:yazgoo/elinks-basis")
```

then start elinks to install them.

# plugins list

See [wiki](https://github.com/yazgoo/elinks-plug/wiki) for a list of plugins.
