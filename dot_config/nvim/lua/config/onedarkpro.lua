local onedarkpro = require("onedarkpro")
onedarkpro.setup(
    {
        dark_theme = "onedark_dark",
        plugins = {
            polygot = false,
        },
        options = { 
            underline = true,
            -- undercurl = true,
        },
        highlights = {
            -- by default these use sp instead of fg, which seems to not work for me
            SpellBad = { fg = "${red}", style = 'underline' },
            SpellCap = { fg = "${red}", style='underline'},
            SpellLocal = { fg = "${red}", style='underline'},
            SpellRare = { fg = "${red}"}, style='underline',
            -- SpellBad = { fg = "${red}", style = 'undercurl' },
            -- SpellCap = { fg = "${red}", style='undercurl'},
            -- SpellLocal = { fg = "${red}", style='undercurl'},
            -- SpellRare = { fg = "${red}"}, style='undercurl',
        },
    }
)
onedarkpro.load()
