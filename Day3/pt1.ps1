# For example, if you have a bank like 12345 and you turn on batteries 
# 2 and 4, the bank would produce 24 jolts. (You cannot rearrange batteries.)
# You'll need to find the largest possible joltage each bank can produce.
# ./pt1 [input.txt]
$sumJolts = 0
$joltageDigits = 2
[String[]]$joltList = @()

# Get content
$fileContent = Get-Content -Path $args[0]
# Each line in file
function foo {
    param{
        [Int32]$index,

    }
    For ( $j=$startIndex; $j -lt $_.Length; $j++) {
        If ( $_[$j] -ieq $i.ToString() -and $joltageDigits -gt 0 ) {
            # found num
            $joltageDigits-=1
            $joltage+=$_[$j]
            $j = 
            "i {0} j {1}" -f $i, $j
        }
    }
}
ForEach ( $_ In $fileContent ) {
    [String[]]$joltage = @()
    # Digits
    $startIndex = 0
    For ( $i=9; $i -gt 0; $i--) {
        
    }
    [System.String]$temp = ""
    ForEach ( $digit In $joltage ) {
        $temp = $("{0}{1}" -f $temp, $digit)
    }
    "joltage : {0}" -f $temp
}

"Joltage sum          : {0}" -f $sumJolts
"Expected joltage sum : 357"
