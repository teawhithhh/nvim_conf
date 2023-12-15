function CompileCommand()
  vim.cmd('w')

  local cxx_command_template = 'C:\\msys64\\ucrt64\\bin\\g++.exe -std=c++23 -fmodules-ts -Werror -pedantic-errors -Wall -Wextra -Wpedantic %s -g %s -o %s/%s.exe'
	local py_command_template = 'C:\\Users\\240821\\scoop\\apps\\python\\current\\python.exe %s'

	local cxx_flags = '-Wctor-dtor-privacy -Wnon-virtual-dtor -Wold-style-cast -Woverloaded-virtual -Wsign-promo -Wduplicated-branches -Wduplicated-cond -Wfloat-equal -Wshadow=compatible-local -Wcast-qual -Wconversion -Wzero-as-null-pointer-constant -Wextra-semi -Wsign-conversion -Wlogical-op'

  local dir_to_build_file = '%s/%s.exe'
  local source_file = vim.fn.expand('%:p')  -- полный путь к текущему файлу
  local output_dir = vim.fn.expand('%:p:h')  -- каталог текущего файла с полным путем
  local output_file = vim.fn.expand('%:t:r') -- имя текущего файла без расширения
	local module = 'C:\\Users\\240821\\modules'

  local type_file = vim.fn.fnamemodify(source_file, ':e')
	local expanded_command
	local start_cmd	
	local status

	if type_file == "cxx" or type_file == "cpp" then
  	expanded_command = string.format(cxx_command_template, cxx_flags, source_file, output_dir, output_file)
  	start_cmd = string.format(dir_to_build_file, output_dir, output_file)
		status = vim.fn.system('cd ' .. module .. ' && ' .. expanded_command)
	elseif type_file == "py" then
		expanded_command = string.format(py_command_template, source_file, output_dir, output_file)
		start_cmd = expanded_command
		status = ''
	else
		print("Файл не поддерживает запуск")
 		return
	end


  print(type_file)
  print(expanded_command)

  if status == '' then
    vim.fn.system('start wt"" -d "C:\\Users\\240821" cmd /c "' .. start_cmd .. ' && echo. && pause"')
    print("Компиляция прошла успешно.\n")
  else
    print("Ошибка компиляции. Код ошибки:\n" .. status)
  end
end

-- Создание команды для компиляции
vim.cmd('command! Compile lua CompileCommand()')
