-- if mac then different path for notes, else is always HOME + /archive/notes

local output = vim.fn.system({ "uname" })

local output_uname = string.gsub(output, "\n", "")
local notes_path = os.getenv("HOME") .. "/archive/notes"

if output_uname == "Darwin" then
	notes_path = os.getenv("HOME") .. "/Documents/archive/notes/"
end

print(notes_path)
require("notes").setup({
	root = notes_path,
})
