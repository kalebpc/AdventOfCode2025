# Find num of fresh ingridients
# The fresh ID ranges are inclusive: the range 3-5 means that ingredient IDs 3, 4, and 5 are all fresh. The ranges can also overlap; an ingredient ID is fresh if it is in any range.
# Input File layout :
# n-n2  ingredient ID range
# `n    new line
# n     ingredient ID

# ./pt1 [input.txt]

$fileContent = $(Get-Content -Path $args[0])
$freshCount = 0

# Get ingredient id ranges and Ids
$fileContentRanges,$fileContentIds = $fileContent.Where( { $_ -match "-" }, 'Split' )
# Write-Host "Ranges: "
# ForEach ( $_ In $fileContentRanges ) {
#     Write-Host $_
# }
# Write-Host "Ids: "
# ForEach ( $_ In $fileContentIds ) {
#     If ( $_ -ne "" ) {
#         Write-Host $_
#     }
# }
# TODO ... Consolidate Ranges

# Compare ids to ranges
ForEach ( $id In $fileContentIds ) {
    If ( $id -ne "" ) {
        ForEach ( $range In $fileContentRanges ) {
            # min and max of $range
            $min,$max = $range -split "-"
            # Write-Host
            # Write-Host   min  : $min max: $max
            # Write-Host   id   : $id
            If ( [Int64]$id -ge [Int64]$min ) {
                If ( [Int64]$id -le [Int64]$max ) {
                    # Count fresh if id is in any range
                    $freshCount+=1
                    # Write-Host fscnt: $freshCount
                    Break
                }
            }
        }
    }
}

Write-Host "Num of Fresh Ingredients          : $freshCount"
# Write-Host "Num of Expected Fresh Ingredients : 3"
