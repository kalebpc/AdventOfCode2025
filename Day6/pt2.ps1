# ./pt1 [input.txt]
[Int64]$grandTotal = 0

If ( $args.Length -eq 1 ) {
    $fileContent = Get-Content -Path $args[0]
}
Else { Exit 1 }
[Int32]$rowCount = $fileContent.Length
[String]$operators = ""
[String]$opContent = $fileContent[$($fileContent.Length-1)]
[String[]]$splitz = $opContent -Split " "
[Int32]$x = 0
ForEach ( $_ In $splitz ) {
    If ( $_ -ine "" ) {
        If ( $x -eq 0 ) {
            $operators+="$_"
            $x+=1
        }
        Else { $operators+=",$_" }
    }
}
echo $escapedPattern
# i columns
For ( $i=$($fileContent[0].Length-1); $i -ge 0; $i-- ) {
    # j rows
    [String]$temp = ""
    For ( $j=0; $j -lt $fileContent.Length; $j++ ) {
        If ( $fileContent[$j][$i] -ine " " ) {
            If ( $fileContent[$j][$i] -imatch '\d' ) {
                $temp+=$fileContent[$j][$i]
            }
            ElseIf ( $fileContent[$j][$i] -match '\D{1}' ) { "found : {0}." -f $fileContent[$j][$i] }
            "i{0} j{1}" -f $i, $j
        }
    }
    If ( $temp -eq "" -or $j -eq $($fileContent.Length-1) ) {
        echo "Time to Calculate"
    }
    Else { "temp: {0}" -f $temp }
}

"Grand total          : {0}" -f $grandTotal
"Grand total expected : 4277556"
