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

```
{
    "adxmantium/PRipheral",
    cmd = "PRipheral",
    config = function()
        require("pripheral").setup()
    end
}
```

## Usage

`:PRipheral` will open (and create if one doesn't exist) a new [branch-name].md file in a split buffer. This file will live in a .PRipheral directory which will be created if it doesn't exist.

## Roadmap

1. Add/verify support for git worktrees
