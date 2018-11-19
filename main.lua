function source(path)
    f = assert(loadfile(path))
    f()
end
function script_path() return debug.getinfo(2, "S").source:sub(2) end
function cwd()
  return script_path():match("(.*/)")
end
function load_script(script)
  assert(loadfile(cwd() .. "/" .. script))()
end
function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         return true
      end
   end
   return ok, err
end
function basename(path)
  return string.match(path, ".*/([^/]+)$")
end
plugins = {"git@github.com:yazgoo/elinks-plug"}
function plug_directory(url)
  return cwd() .. "/../" .. basename(url)
end
function plug(url)
  table.insert(plugins, url)
  local directory = plug_directory(url)
  if not exists(directory) then
    print("cloning")
    print("git clone " .. url .. " " .. directory)
    os.execute("git clone " .. url .. " " .. directory)
  end
  source(directory .. "/main.lua")
end
function plug_update()
  os.execute("clear")
  for _, url in pairs(plugins) do
    os.execute("git -C " ..  plug_directory(url) .. " pull origin master")
  end
end
