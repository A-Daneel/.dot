local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep

ls.add_snippets("tex", {
  s({ trig = "beg", name = "begin{} / end{}" }, {
    t({ "\\begin{" }),
    i(1),
    t({ "}", "\t" }),
    i(0),
    t({ "", "\\end{" }),
    rep(1),
    t("}"),
  }),
  s({ trig = "s", name = "section{}" }, {
    t({ "\\section{" }),
    i(1),
    t("}"),
  }),
  s({ trig = "ss", name = "subsection{}" }, {
    t({ "\\subsection{" }),
    i(1),
    t("}"),
  }),
  s({ trig = "--", name = "\\item" }, {
    t({ "\\item " }),
    i(0),
  }),
  s({ trig = "!-", name = "\\item[<custom content>]" }, {
    t({ "\\item[" }),
    i(1),
    t({ "] " }),
    i(0),
  }),
})
