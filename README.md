# PRipheral

Pronounced "peripheral", but play on the "PR" acronym, a plugin that has your PR description in your peripheral

---

## Background

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

`:PRipheral` will open (and create if one doesn't exist) a new [branch-name].md file in a split buffer
