th.git = th.git or {}

th.git.modified = ui.Style():fg("#E5C07B")
th.git.added    = ui.Style():fg("#98C379")
th.git.untracked = ui.Style():fg("#FF6B6B")       -- Helleres Rot für untracked
th.git.ignored  = ui.Style():fg("#5C6370")
th.git.deleted  = ui.Style():fg("#BE5046"):bold()
th.git.updated  = ui.Style():fg("#56B6C2")

th.git.modified_sign  = "M"
th.git.added_sign     = "A"
th.git.untracked_sign = "?"
th.git.ignored_sign   = "·"
th.git.deleted_sign   = "D"
th.git.updated_sign   = "U"

require("git"):setup()
