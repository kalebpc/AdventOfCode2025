# Dial starts at 50
# The actual password is the number of times the dial 
#  is left pointing at 0 after any rotation in the sequence.
# ./pt1 [input.txt]
$password = 0
$starPos = 50

# Get file content
$fileContent = Get-Content -Path $args[0]

For ( $i=0; $i -lt $fileContent.Length; $i++ ) {
    If ( [Int32]$i -eq 0 ) {
        $currPos = $starPos
    }
    $direction = $fileContent[$i][0]
    $clicks = $fileContent[$i].Substring(1)
    If ( $direction -imatch "L") {
        # Dial left
        If ( [Int32]$clicks -gt 100 ) {
            $clicks = "$clicks"
            $clicks = $clicks.Substring(1)
            $clicks = [Int32]$clicks
        }
        $nexPos = $($currPos-$clicks)
        If ( [Int32]$nexPos -lt 0 ) {
            $nexPos = $($nexPos + 100)
        }
        "currPos : {0} - {1} : clicks" -f $currPos, $clicks
    }
    Else {
        # Dial right
        If ( [Int32]$clicks -gt 100 ) {
            $clicks = "$clicks"
            $clicks = $clicks.Substring(1)
            $clicks = [Int32]$clicks
        }
        $nexPos = $($currPos+$clicks)
        If ( [Int32]$nexPos -gt 100 ) {
            $nexPos = $($nexPos - 100)
        }
        "currPos : {0} + {1} : clicks" -f $currPos, $clicks
    }
    If ( [Int32]$nexPos -eq 100 ) {
        $nexPos = 0
    }
    If ( [Int32]$nexPos -eq 0 ) {
        $password+=1
    }
    # "dir : {0} clicks : {1}" -f $direction, $clicks
    "currPos : {0} nexPos : {1}" -f $currPos, $nexPos
    $currPos = $nexPos
}


"Password result   : {0}" -f $password
"Password expected : 3"
