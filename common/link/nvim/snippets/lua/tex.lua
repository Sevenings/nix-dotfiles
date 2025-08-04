local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")


return {
  -- Letras com indice, a_1, a_2, a_3...
	s(
    { trig = "(%a+)(%d+)", regTrig = true, snippetType="autosnippet" },
    f(function(_, snip)
      return snip.captures[1].."_".. snip.captures[2]
    end, {})
  ),

  -- Ao quadrado
  s(
    { trig = "sq", snippetType="autosnippet", wordTrig = false },
      t("^2")
  ),
  -- Ao cubo
  s(
    { trig = "cb", snippetType="autosnippet", wordTrig = false },
      t("^3")
  ),
}

