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
function plug(url)
  local path = basename(url)
  local directory = cwd() .. "/../" .. path
  if not exists(directory) then
    print("cloning")
    print("git clone " .. url .. " " .. directory)
    os.execute("git clone " .. url .. " " .. directory)
  end
  source(directory .. "/main.lua")
end
