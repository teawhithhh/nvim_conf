local map = vim.api.nvim_set_keymap

function NM(key, command)
	map('n', key, command, {noremap = true})
end

function IM(key, command)
	map('i', key, command, {noremap = true})
end

function VM(key, command)
	map('v', key, command, {noremap = true})
end

function TM(key, command)
	map('t', key, command, {noremap = true})
end
