(TeX-add-style-hook
 "fa-lightmode"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb*")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (TeX-run-style-hooks
    "fontspec"
    "fancyvrb"
    "framed"
    "xcolor"
    "xstring"
    "listings"
    "xepersian")
   (TeX-add-symbols
    '("bigcenter" 1)
    '("themeconfig" 1)
    "headbeforespace"
    "headafterspace"
    "shadedheadlinemacro"
    "plainheadlinemacro"
    "threerowedfootlinemacro"
    "tworowedfootlinemacro"
    "applysidebar"
    "applytheshadow"
    "removetheshadow"
    "theshadow"
    "defperfont"
    "isshaded"
    "isthree"
    "isside"
    "isshadow")
   (LaTeX-add-xcolor-definecolors
    "color_main"
    "color_text"
    "color_gradient"
    "color_frametitle_fg"
    "color_frametitle_bg"
    "color_but_right_fg"
    "color_but_right_bg"
    "color_but_mid_fg"
    "color_but_mid_bg"
    "color_but_left_fg"
    "color_but_left_bg"
    "color_block_body_fg"
    "color_blocks_title_fg"
    "color_block_def_bg"
    "color_block_exm_bg"
    "color_example_title_bg"
    "color_block_def_title_bg"
    "color_alert_title_bg"
    "color_block_alr_bg"
    "color_items_bg"
    "color_items_fg"
    "grayColor"
    "greenColor"
    "yellowColor"
    "orangeColor"
    "redColor"
    "purpleColor"
    "blueColor"
    "cyanColor"))
 :latex)

