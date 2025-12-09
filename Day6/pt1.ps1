# ./pt1 [input.txt]
$grandTotal = 0

If ( $args.Length -eq 1 ) {
    $fileContent = Get-Content -Path $args[0]
}
Else { Exit 1 }
[String[]]$columns = @()
[Int32]$rowCount = $fileContent.Length
For ( $i=0; $i -lt $rowCount; $i++ ) {
    $splitz = $fileContent[$i] -Split " "
    [String]$temp = ""
    [Int32]$x = 0
    ForEach ( $_ In $splitz ) {
        If ( $_ -ine "" ) {
            If ( $x -eq 0 ) {
                $temp+="$_"
                # "temp {0} += $ {1}" -f $temp, $_
                $x+=1
            }
            Else {
                $temp+=",$_"
                # "temp {0} += $ {1}" -f $temp, $_
            }
        }
    }
    $columns+=$temp
    # "{0} += {1}" -f $columns, $temp
}
[String[]]$operators = $columns[$rowCount-1] -Split ","
For ( $j=0; $j -lt $operators.Length; $j++ ) {
    [Int64]$columnTotal = 0
    For ( $k=0; $k -lt $($rowCount-1); $k++ ) {
        If ( $k -eq 0 ) {
            $columnTotal = $($columns[$k] -Split ",")[$j]
            "columntotal = cols                   :{0}" -f $($columns[$k] -Split ",")[$j]
        }
        Else {
            "ops: {0}" -f $operators[$j].GetType()
            Switch ( $operators[$j] ) {
                "*" { $columnTotal = $($columnTotal*$($columns[$k] -Split ",")[$j]) }
                "+" { $columnTotal = $($columnTotal+$($columns[$k] -Split ",")[$j]) }
                "-" { $columnTotal = $($columnTotal-$($columns[$k] -Split ",")[$j]) }
                Default { "Script Not equipped to handle '{0}'." -f $operators[$j] }
            }
            "columntotal = coltotal:{0} op:{1} colsplit:{2}" -f $columnTotal, $operators[$j], $($columns[$k] -Split ",")[$j]
        }
    }
    $grandTotal+=$columnTotal
}

"Grand total          : {0}" -f $grandTotal
"Grand total expected : 4277556"
