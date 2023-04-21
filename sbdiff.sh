#!/bin/sh
#!/bin/sh
echo
echo Comparing: "$1 between $3 and $6"
echo
C=$(stty size | cut -d' ' -f2)
D=$(expr $C / 2 - 2)
diff -tyW $C "$2" "$5" | grep -E "^.{$D}[^ ]" -A 5 -B 5 | colordiff | less -R
