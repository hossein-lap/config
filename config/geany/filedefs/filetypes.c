[build-menu]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)
FT_00_LB=_Compile
FT_00_CM=gcc -Wall -o "%e" "%f"
FT_00_WD=
FT_01_LB=_Build
FT_01_CM=gcc -Wall -o "%e" "%f" && "./%e"
FT_01_WD=
FT_02_LB=_Lint
FT_02_CM=cppcheck --language=c --enable=warning,style --template=gcc "%f"
FT_02_WD=
EX_00_LB=_Execute
EX_00_CM="./%e"
EX_00_WD=
