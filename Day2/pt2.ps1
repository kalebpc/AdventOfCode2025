# You can find the invalid IDs by looking for any ID which is made 
#  only of some sequence of digits repeated twice. 
#  So, 55 (5 twice), 6464 (64 twice), and 123123 (123 twice) would 
#  all be invalid IDs.
# What do you get if you add up all of the invalid IDs?
# ./pt2 [input.txt]

$sumIds = 0

# Get content from file
$fileContent = Get-Content -Path $args[0]
$fileContent = $fileContent -Split ","
ForEach ( $_ In $fileContent ) {
    "{0}" -f $_
    [Int64]$Min, [Int64]$Max = $_ -Split "-"
    # "{0} {1}" -f $Min, $Max
    For ( $i=$Min; $i -le $Max; $i++) {
        $temp = $($i | Select-String -Pattern "^(\d+?)\1+$" -AllMatches)
        If ( $temp -ne $null ) {
            # "{0}" -f $temp.Line
            $sumIds+=[Int64]$temp.Line
        }
    }
}

"Expected example sum : {0}" -f $sumIds
"Expected example sum : 4174379265"
