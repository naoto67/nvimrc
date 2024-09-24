local ut = {}
local gotests = "gotests"
local utils = require("go.utils")
local empty = utils.empty
local run = function(setup)
	print(vim.inspect(setup))
	vim.fn.jobstart(setup, {
		stdout_buffered = true,
		on_stdout = function(_, data, _)
			print("unit tests generate " .. vim.inspect(data))
		end,
	})
end

local add_test = function(args)
	print(unpack(args))
	require("go.install").install(gotests)
	local gofile = vim.fn.expand("%")
	table.insert(args, "-w")
	table.insert(args, gofile)
	run(args)
end

local new_gotests_args = function(template_dir)
	local args = { gotests }
	if template_dir then
		table.insert(args, "-template_dir")
		table.insert(args, template_dir)
	end
	return args
end

ut.fun_test = function(template_dir)
	local ns = require("go.ts.go").get_func_method_node_at_pos()
	if empty(ns) then
		return
	end
	if ns == nil or ns.name == nil then
		return
	end
	local funame = ns.name
	local args = new_gotests_args(template_dir)
	table.insert(args, "-only")
	table.insert(args, funame)
	add_test(args)
end

ut.all_test = function(template_dir)
	local args = new_gotests_args(template_dir)
	table.insert(args, "-all")
	add_test(args)
end

-- Ref. https://github.com/ray-x/go.nvim/blob/v0.9.0/lua/go/commands.lua
local create_cmd = function(cmd, func, opt)
	opt = vim.tbl_extend("force", { desc = "own " .. cmd }, opt or {})
	vim.api.nvim_create_user_command(cmd, func, opt)
end

local template_dir_complete = function(arg_lead, _, _)
	return vim.tbl_filter(function(item)
		return vim.startswith(item, arg_lead)
	end, {
		vim.fn.expand("$HOME/.config/nvim/gotests_templates/journey/mockunit"),
		vim.fn.expand("$HOME/.config/nvim/gotests_templates/journey/adminrepo"),
		vim.fn.expand("$HOME/.config/nvim/gotests_templates/journey/graphql"),
	})
end

create_cmd("ExGoAddTest", function(opts)
	ut.fun_test(unpack(opts.fargs))
end, { nargs = "*", complete = template_dir_complete })
create_cmd("ExGoAddAllTest", function(opts)
	ut.all_test(unpack(opts.fargs))
end, { nargs = "*", complete = template_dir_complete })
