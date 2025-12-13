---@diagnostic disable: undefined-global
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	-- math modes
	s({ trig = "mt", snippetType = "autosnippet" },
		fmta("$<>$ ", { i(1) })
	),
	s({ trig = "mmt", snippetType = "autosnippet" },
		fmta("$ <> $ ", { i(1) })
	),
	s({ trig = "cent" },
		fmta("#align(center)[<>]", { i(1) })
	),
	s({ trig = "v" },
		fmta("#let <> = <>", { i(1), i(2) })
	),
	s({ trig = "brc", snippetType = "autosnippet" },
		fmta("\\(<>\\) ", { i(1) })
	),
}
