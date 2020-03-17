set foldmethod=expr
set foldexpr=getline(v:lnum)=~'^Message:'?'>1':2

