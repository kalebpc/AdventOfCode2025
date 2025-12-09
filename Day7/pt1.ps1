# ./pt1 [input.txt]

[Int64]$splitCount = 0
[String]$newBeamPositions = ""
[String[]]$fileContent = Get-Content -Path $args[0]
For ( $h = 0; $h -lt $fileContent[0].Length; $h++ ) {
    If ( $fileContent[0][$h] -ieq "s" ) { $newBeamPositions+="|" }
    Else { $newBeamPositions+=$fileContent[0][$h] }
}
# rows
For ( $i=0; $i -lt $fileContent.Length; $i++ ) {
    # columns
    For ( $j=0; $j -lt $fileContent[$i].Length; $j++ ) {
        If ( $fileContent[$i][$j] -ieq "^" ) {
            If ( $newBeamPositions[$j] -eq "|" ) {
                $splitCount+=1
            }
            $newBeamPositions = $newBeamPositions.Remove($j-1,1).Insert($j-1,"|")
            $newBeamPositions = $newBeamPositions.Remove($j+1,1).Insert($j+1,"|")
            $newBeamPositions = $newBeamPositions.Remove($j,1).Insert($j,".")
        }
    }
    $newBeamPositions
}

"Num of splits          : {0}" -f $splitCount
"Expected num of splits : 21"
