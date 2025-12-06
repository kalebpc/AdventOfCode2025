# You can find the invalid IDs by looking for any ID which is made 
#  only of some sequence of digits repeated twice. 
#  So, 55 (5 twice), 6464 (64 twice), and 123123 (123 twice) would 
#  all be invalid IDs.
# What do you get if you add up all of the invalid IDs?
# ./pt1 [input.txt]

$sumIds = 0

# Get content from file
$fileContent = Get-Content -Path $args[0]
$fileContent = $fileContent -Split ","
ForEach ( $_ In $fileContent ) {
    [Int64]$Min, [Int64]$Max = $_ -Split "-"
    # "{0} {1}" -f $Min, $Max
    For ( $i=$Min; $i -le $Max; $i++) {
        If ( $($i.ToString().Length%2) -eq 0 ) {
            # "i-in  : {0}" -f $i
            $frontTemp = $i.ToString().SubString(0,$($i.ToString().Length/2))
            # "{0}" -f $frontTemp
            $backTemp = $i.ToString().SubString($(($i.ToString().Length/2)))
            If ( [Int64]$frontTemp -eq [Int64]$backTemp ) {
                $sumIds+=$i
                "i     : {0}" -f $i
            }
        }
    }
}

"Expected example sum : {0}" -f $sumIds
"Expected example sum : 1227775554"
