Try {
  Write-Output "Set power plan to 고성능"

  $HighPerf = powercfg -l | ForEach-Object { if ($_.contains("고성능")) { $_.split()[3] } }

  # $HighPerf cannot be $null, we try activate this power profile with powercfg
  if ($null -eq $HighPerf) {
    throw "Error: 고성능 is null"
  }

  $CurrPlan = $(powercfg -getactivescheme).split()[3]

  if ($CurrPlan -ne $HighPerf) { powercfg -setactive $HighPerf }

}
Catch {
  Write-Warning -Message "Unable to set power plan to 고성능"
  Write-Warning $Error[0]
}
