local M = {}

-- return current git branch name
local function gitCurrentBranchName()
	-- `git branch --show-current` also works, but is newer so going w/ rev-parse as it is more widely supported
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD")

	-- Remove trailing newline character
	branch = string.gsub(branch, "\n", "")

	-- replace / with -
	branch = string.gsub(branch, "/", "-")

	-- Return the branch name
	return branch
end

-- returns name of source directory (should live at project root; inline with .git dir)
local function getSourceDir()
	return vim.fn.getcwd() .. "/.PRipheral/"
end

-- check if source directory exists
local function hasSourceDir()
	local stat = vim.loop.fs_stat(getSourceDir())

	if stat and stat.type == "directory" then
		return true
	end

	return false
end

-- creates main source dir (.PRipheral/)
local function createSourceDir()
	os.execute("mkdir " .. getSourceDir())
end

-- boolean if file exists
local function hasFile(filename)
	local file = io.open(filename, "r")

	if file then
		file:close()
		return true
	end

	return false
end

-- returns file contents
local function getFile(filename)
	if hasFile(filename) then
		local file = io.open(filename, "r")
		local contents = file:read("a")
		file:close()

		return contents
	end
end

-- creates md file in source dir
local function createAndOpenMarkdownFile()
	local branch = string.gsub(gitCurrentBranchName(), "/", "-")
	local file_name = getSourceDir() .. branch .. ".md"

	-- if file doesn't exist yet, create it, else just open the existing file
	if not hasFile(file_name) then
		local file = io.open(file_name, "w")
		local default_content = "# PR Template"
		local contents = default_content
		local template_filename = getSourceDir() .. "pr.template.md"

		-- if .PRipheral has a pr.template.md file, use its contents when creating new pr file
		if hasFile(template_filename) then
			contents = getFile(template_filename)
		end

		-- write file
		if file then
			file:write(contents)
			file:close()
		end
	end

	-- open file in split buffer
	vim.cmd("vsplit " .. file_name)
end

-- create custom user command
local function createUserCommand()
	vim.api.nvim_create_user_command("PRipheral", function(opts)
		-- check for pr.template.md file
		-- if this^ exists, use contents as starting point for creating new branch-name.md file

		-- create .PRipheral directory if it doesn't exist
		if not hasSourceDir() then
			createSourceDir()
		end

		createAndOpenMarkdownFile()
	end, { nargs = 0 })
end

M.setup = function()
	createUserCommand()
end

return M
