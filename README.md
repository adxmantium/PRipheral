# PRipheral

Pronounced "peripheral", but play on the "PR" acronym, a plugin that has your PR description in your peripheral

---

## Background

This is a plugin that helps improve my own workflow. I often work on multiple projects at once and sometimes there is just a lot of mental overhead when it comes to writing the PR description when I can finally get a PR up, so having the ability to update the description during code-time is helpful for me, this way I don't have to

#### Before

Upon creating a PR, I would have to remember or take time going through my commits to be fill out my PR details.

#### After

With this plugin, it allows me to write my PR description as I am coding it (hence "peripheral"/PRipheral naming)

## Installation

1. setup

```
{
    "adxmantium/PRipheral",
    keys = {
		{
			"<leader>pr",
			":PRipheral<CR>",
			desc = "Opens peripheral PR description markdown file for current branch",
		},
	},
    config = function()
        require("pripheral").setup()
    end
}
```

2. Add `.pripheral` to your `~/.config/git/ignore` file - this will globally gitignore the auto generated `.pripheral` dir that this plugin creates

## Usage

`:PRipheral` will open (and create if one doesn't exist) a new [branch-name].md file in a split buffer. This file will live in a .PRipheral directory which will be created if it doesn't exist.

I recommend mapping this command to something easier to type, for example, I map it to `<leader>pr`.

This works with branches and worktree workflows.
