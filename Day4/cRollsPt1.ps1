# Count Toilet paper rolls in input.
# ./cRolls.ps1 [file.txt] [Num of Lines to Retrieve]

function Count-Rolls {
    param (
        [Parameter(Mandatory=$true)]
        [System.String[]]$fileCollection,
        
        [int]$rolls
    )
    # i = rows. and j = columns
    For ( $i=0; $i -lt $fileCollection.Length; $i++ ) {
        For ( $j=0; $j -lt $fileCollection[$i].Length; $j++ ) {
            # Start counting surrounding rolls if on a roll.
            If ( "$($fileCollection[$i][$j])" -eq "@" ) {
                [int]$surroundingRolls = 0
                If ( $i -lt 1 ) {
                    # Check Right and Down.
                    If ( $j -lt 1 ) {
                        For ( $k=0; $k -lt 2; $k++ ) {
                            For ( $l=0; $l -lt 2; $l++ ) {
                                If ( "$($fileCollection[$i+$k][$j+$l])" -eq "@" ) {
                                    $surroundingRolls+=1
                                }
                                # Dont count current roll
                                If ( $k -eq 0 -and $l -eq 0) {
                                    $surroundingRolls-=1
                                }
                            }
                        }
                    }
                    # Check Left and Down.
                    Elseif ( $j -eq $($fileCollection[$i].Length-1) ) {
                        For ( $k=0; $k -lt 2; $k++ ) {
                            For ( $l=-1; $l -lt 1; $l++ ) {
                                If ( "$($fileCollection[$i+$k][$j+$l])" -eq "@" ) {
                                    $surroundingRolls+=1
                                }
                                # Dont count current roll
                                If ( $k -eq 0 -and $l -eq 0) {
                                    $surroundingRolls-=1
                                }
                            }
                        }
                    }
                    # Check Left, Right, and Down.
                    Else {
                        For ( $k=0; $k -lt 2; $k++ ) {
                            For ( $l=-1; $l -lt 2; $l++ ) {
                                If ( "$($fileCollection[$i+$k][$j+$l])" -eq "@") {
                                    $surroundingRolls+=1
                                }
                                # Dont count current roll
                                If ( $k -eq 0 -and $l -eq 0) {
                                    $surroundingRolls-=1
                                }
                            }
                        }
                    }
                }
                ElseIf ( $i -eq $($fileCollection.Length-1) ) {
                    # Check Right and Up.
                    If ( $j -lt 1 ) {
                        For ( $k=-1; $k -lt 1; $k++ ) {
                            For ( $l=0; $l -lt 2; $l++ ) {
                                If ( "$($fileCollection[$i+$k][$j+$l])" -eq "@" ) {
                                    $surroundingRolls+=1
                                }
                                # Dont count current roll
                                If ( $k -eq 0 -and $l -eq 0) {
                                    $surroundingRolls-=1
                                }
                            }
                        }
                    }
                    # Check Left and Up.
                    Elseif ( $j -eq $($fileCollection[$i].Length-1) ) {
                        For ( $k=-1; $k -lt 1; $k++ ) {
                            For ( $l=-1; $l -lt 1; $l++ ) {
                                If ( "$($fileCollection[$i+$k][$j+$l])" -eq "@" ) {
                                    $surroundingRolls+=1
                                }
                                # Dont count current roll
                                If ( $k -eq 0 -and $l -eq 0) {
                                    $surroundingRolls-=1
                                }
                            }
                        }
                    }
                    # Check Left, Right, and Up.
                    Else {
                        For ( $k=-1; $k -lt 1; $k++ ) {
                            For ( $l=-1; $l -lt 2; $l++ ) {
                                If ( "$($fileCollection[$i+$k][$j+$l])" -eq "@" ) {
                                    $surroundingRolls+=1
                                }
                                # Dont count current roll
                                If ( $k -eq 0 -and $l -eq 0) {
                                    $surroundingRolls-=1
                                }
                            }
                        }
                    }
                }
                Else {
                    # Check Right, Up, and Down.
                    If ( $j -lt 1 ) {
                        For ( $k=-1; $k -lt 2; $k++ ) {
                            For ( $l=0; $l -lt 2; $l++ ) {
                                If ( "$($fileCollection[$i+$k][$j+$l])" -eq "@" ) {
                                    $surroundingRolls+=1
                                }
                                # Dont count current roll
                                If ( $k -eq 0 -and $l -eq 0) {
                                    $surroundingRolls-=1
                                }
                            }
                        }
                    }
                    # Check Left, Up, and Down.
                    Elseif ( $j -eq $($fileCollection[$i].Length-1) ) {
                        For ( $k=-1; $k -lt 2; $k++ ) {
                            For ( $l=-1; $l -lt 1; $l++ ) {
                                If ( "$($fileCollection[$i+$k][$j+$l])" -eq "@" ) {
                                    $surroundingRolls+=1
                                }
                                # Dont count current roll
                                If ( $k -eq 0 -and $l -eq 0) {
                                    $surroundingRolls-=1
                                }
                            }
                        }
                    }
                    Else {
                        # Check Left, Right, Up, and Down.
                        For ( $k=-1; $k -lt 2; $k++ ) {
                            For ( $l=-1; $l -lt 2; $l++ ) {
                                If ( "$($fileCollection[$i+$k][$j+$l])" -eq "@" ) {
                                    $surroundingRolls+=1
                                }
                                # Dont count current roll
                                If ( $k -eq 0 -and $l -eq 0) {
                                    $surroundingRolls-=1
                                }
                            }
                        }
                    }
                }
                If ( $surroundingRolls -lt 4 ) {
                    $rolls+=1
                }
                # Write-Host Line                    : $fileCollection[$i]
                # Write-Host Line                    : $($fileCollection[$i+1])
                # Write-Host i:$i","j:$j surrounding : $surroundingRolls
                # Write-Host             rolls       : $rolls
                # Write-Host
            }
        }
    }
    return $rolls
}

If ( $(Try { Test-Path $args[0] } Catch { $false }) ) {
    If ( $args[1] -gt 0 ) {
        Write-Host "$( Count-Rolls -fileCollection $(Get-Content -Path $args[0] -TotalCount $args[1]) )"
    }
    Else {
        Write-Host "$( Count-Rolls -fileCollection $(Get-Content -Path $args[0]) )"
    }
}
Else {
    Write-Host "Path not found."
}

