# ./pt1 [input.txt]

[String]$newBeamPositions = ""
[Int64[]]$splitCountList = @()
[Int64]$beamCount = 0
[String[]]$fileContent = Get-Content -Path $args[0]
For ( $h = 0; $h -lt $fileContent[0].Length; $h++ ) {
    If ( $fileContent[0][$h] -ieq "s" ) {
        $newBeamPositions+="|"
    }
    Else {
        $newBeamPositions+=$fileContent[0][$h]
    }
    $splitCountList+=0
}

# rows
For ( $i=0; $i -lt $fileContent.Length; $i++ ) {
    # columns
    For ( $j=0; $j -lt $fileContent[$i].Length; $j++ ) {
        # If ( $j -eq 0 ) { "$splitCountList" }
        If ( $fileContent[$i][$j] -ieq "^" -or $fileContent[$i][$j] -ieq "S" ) {
            If ( $newBeamPositions[$j] -ieq "|" -xor $fileContent[$i][$j] -ieq "S" ) {
                $newBeamPositions = $newBeamPositions.Remove($j-1,1).Insert($j-1,"|")
                $newBeamPositions = $newBeamPositions.Remove($j+1,1).Insert($j+1,"|")
                $newBeamPositions = $newBeamPositions.Remove($j,1).Insert($j,".")
                If ( $i -lt 3 ) {
                    $splitCountList[$j-1] = $($splitCountList[$j-1]+1+$splitCountList[$j])
                    $splitCountList[$j+1] = $($splitCountList[$j+1]+1+$splitCountList[$j])
                    $splitCountList[$j] = 0
                }
                # echo "j:$j | $($splitCountList[$j-1]) $j-1 = $($splitCountList[$j-1])+$($splitCountList[$j])"
                # echo "j:$j | $($splitCountList[$j+1]) $j+1 = $($splitCountList[$j+1])+$($splitCountList[$j])"
                $splitCountList[$j-1] = $($splitCountList[$j-1]+$splitCountList[$j])
                $splitCountList[$j+1] = $($splitCountList[$j+1]+$splitCountList[$j])
                $splitCountList[$j] = 0
            }
        }
    }
    # $newBeamPositions
}
# $splitCountList
ForEach ( $_ In $splitCountList ) {
    $beamCount+=$_
}
"Num of splits          : {0}" -f $beamCount
"Expected num of splits : 40"
