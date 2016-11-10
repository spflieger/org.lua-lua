local t = ...

local strPlatform = 'Windows_x64'

if strPlatform=='Windows_x86' then
	t:install('windows_x86/bin/lua5.3.exe', '${install.executable}')
	t:install('windows_x86/bin/wlua5.3.exe', '${install.executable}')
	t:install('windows_x86/bin/lua5.3.dll', '${install.sharedobject}')

elseif strPlatform=='Windows_x64' then
	t:install('windows_x64/bin/lua5.3.exe', '${install.executable}')
	t:install('windows_x64/bin/wlua5.3.exe', '${install.executable}')
	t:install('windows_x64/bin/lua5.3.dll', '${install.sharedobject}')

end

return true
