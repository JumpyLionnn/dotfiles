# bookmarks.yazi

A [Yazi](https://github.com/sxyazi/yazi) plugin that adds the basic functionality of [vi-like marks](https://neovim.io/doc/user/motion.html#mark-motions).

https://github.com/dedukun/bookmarks.yazi/assets/25795432/9a9fe345-dd06-442e-99f1-8475ab22fad5

## Requirements

- [Yazi](https://github.com/sxyazi/yazi) v0.2.5+

## Features

- Create/delete bookmarks
- Custom Notifications
- `''` to go back to the previous folder
- Bookmarks persistence

## Installation

<details>
<summary>Yazi v0.2.5 (manual installation)</summary>
	
```sh
# Linux/macOS
git clone https://github.com/dedukun/bookmarks.yazi.git ~/.config/yazi/plugins/bookmarks.yazi

# Windows
git clone https://github.com/dedukun/bookmarks.yazi.git %AppData%\yazi\config\plugins\bookmarks.yazi
```

</details>


<details>
<summary>Latest commit in Yazi (package manager)</summary>

```sh
# Add the plugin
ya pack -a dedukun/bookmarks

# Install plugin
ya pack -i

# Update plugin
ya pack -u
```

</details>

## Configuration

Add this to your `keymap.toml`:

```toml
[[manager.prepend_keymap]]
on = [ "m" ]
run = "plugin bookmarks --args=save"
desc = "Save current position as a bookmark"

[[manager.prepend_keymap]]
on = [ "'" ]
run = "plugin bookmarks --args=jump"
desc = "Jump to a bookmark"

[[manager.prepend_keymap]]
on = [ "b", "d" ]
run = "plugin bookmarks --args=delete"
desc = "Delete a bookmark"

[[manager.prepend_keymap]]
on = [ "b", "D" ]
run = "plugin bookmarks --args=delete_all"
desc = "Delete all bookmarks"
```

---

Additionally there are configurations that can be done using the plugin's `setup` function in Yazi's `init.lua`, i.e. `~/.config/yazi/init.lua`.
The following are the default configurations:

```lua
-- ~/.config/yazi/init.lua
require("bookmarks"):setup({
	save_last_directory = false,
	persist = "none",
	desc_format = "full",
	notify = {
		enable = false,
		timeout = 1,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})
```

### `save_last_directory`

When enabled, a new bookmark is automatically created in `'` which allows the user to jump back to
the last directory.

### `persist`

When enabled the bookmarks will persist, i.e. if you close and reopen Yazi they will still be
present.

There are three possible values for this option:

| Value  | Description                                                                                                          |
| ------ | -------------------------------------------------------------------------------------------------------------------- |
| `none` | The default value, i.e., no persistance                                                                              |
| `all`  | All the bookmarks are saved in persistent memory                                                                     |
| `vim`  | This mode emulates the vim global marks, i.e., only the bookmarks in upper case (A-Z) are saved to persistent memory |

### `desc_format`

The format for the bookmark description.

There are two possible values for this option:

| Value    | Description                                                                                     |
| -------- | ----------------------------------------------------------------------------------------------- |
| `full`   | The default, it shows the full path of the bookmark, i.e., the parent folder + the hovered file |
| `parent` | Only shows the parent folder of the bookmark                                                    |

### `notify`

When enabled, notifications will be shown when the user creates a new bookmark and deletes one or
all saved bookmarks.

By default the notification has a 1 second timeout that can be changed with `notify.timeout`.

Furthermore, you can customize the notification messages with `notify.message`.
For the `new` and `delete` messages, the `<key>` and `<folder>` keywords can be used, which will be replaced by the respective new/deleted bookmark's associated key and folder.
