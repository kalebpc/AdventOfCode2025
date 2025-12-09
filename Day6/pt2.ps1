# ./pt1 [input.txt]

If ( $args.Length -eq 1 ) {
    $fileContent = Get-Content -Path $args[0]
}
Else { Exit 1 }
[Int64]$grandTotal = 0
[String[]]$list = @()
[Int64]$tempTotal = 0
# i columns
For ( $i=$($fileContent[0].Length-1); $i -ge 0; $i-- ) {
    # j rows
    [String]$temp = ""
    For ( $j=0; $j -lt $($fileContent.Length); $j++ ) {
        If ( $temp.Length -gt 0 -and $j -gt $($fileContent.Length-2) ) {
            # Add number to list
            $list+=$temp
            # "list is :{0}.       | i{1} j{2}" -f $temp, $i, $j
        }
        If ( $fileContent[$j][$i] -ine " " ) {
            If ( $fileContent[$j][$i] -match '\d' ) {
                $temp+=$fileContent[$j][$i]
                # "this temp is :{0}.       | i{1} j{2}" -f $temp, $i, $j
            }
            ElseIf ($fileContent[$j][$i] -match '\D{1}' ) { 
                $op = $fileContent[$j][$i]
                For ( $k=0; $k -lt $list.Length; $k++ ) {
                    If ( $list[$k] -ne '' ) {
                        If ( $k -eq 0 ) {
                            $tempTotal = $list[$k]
                        }
                        Switch ( $op ) {
                            "*" {
                                    If ( $k -lt $($list.Length-1) ) {
                                        "temptotal: '{0}'{2}'{1}' :list[k]'" -f $tempTotal, $list[$k+1], $op
                                        $tempTotal = $($tempTotal*$list[$k+1])
                                    } 
                                }
                            "+" { $tempTotal = $($tempTotal+$list[$k+1]) }
                            Default { "Script Not equipped to handle '{0}'." -f $op }
                        }
                        "list k:{1} :{0}  |   temptotal:  {2}" -f $list[$k], $k, $tempTotal
                    }
                }
                "temptotal :{0}" -f $tempTotal
                $grandTotal+=$tempTotal
                $tempTotal = 0
                # Write-Host "Calculate and clear list"
                $list = @()
            }
        }
    }
}
"Grand total          : {0}" -f $grandTotal
"Grand total expected : 3263827"
