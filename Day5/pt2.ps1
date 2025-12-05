# Find num of fresh ingridient ids
# The fresh ID ranges are inclusive: the range 3-5 means that ingredient IDs 3, 4, and 5 are all fresh. The ranges can also overlap; an ingredient ID is fresh if it is in any range.
# Input File layout :
# n-n2  ingredient ID range
# `n    new line
# n     ingredient ID

# ./pt2 [input.txt]

$fileContent = $(Get-Content -Path $args[0])
[PSCustomObject[]]$objectArr = @()

# Get ingredient id ranges
$fileContentRanges,$_ = $fileContent.Where( { $_ -match "-" }, 'Split' )
ForEach ( $range In $fileContentRanges ) {
    # min and max of $range
    $minL,$maxL = $range -split "-"
    $ob = [PSCustomObject]@{
        Min="$minL"
        Max="$maxL"
    }
    $objectArr+=$ob
}
$objectArr = $objectArr | Sort-Object { [Int64]$_.Min }

# Consolidate ranges
[PSCustomObject[]]$consolidatedObjectArr = @()
$currentArr = $objectArr[0]
$consolidatedObjectArr+=$currentArr
For ( $i=1; $i -lt $objectArr.Length; $i++ ) {
    $nextArr = $objectArr[$i]
    If ( [Int64]$nextArr.Min -le [Int64]$currentArr.Max ) {
        If ( [Int64]$nextArr.Max -ge [Int64]$currentArr.Max) {
            $currentArr.Max = $nextArr.Max
        }
    }
    Else {
        $currentArr = $nextArr
        $consolidatedObjectArr+=$currentArr
    }
}

# Count Fresh ids
$freshCount = 0
ForEach ( $_ In $consolidatedObjectArr ) {
    $freshCount+=$(($_.Max - $_.Min) + 1)
}

# ForEach ( $_ In $consolidatedObjectArr ) {
#     Write-Host "$_"
# }

Write-Host "Num of Fresh Ingredient Ids : $freshCount"
Write-Host "Num of Fresh Ingredient Ids : 14"
