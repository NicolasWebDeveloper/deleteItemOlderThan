function main {
    param(
        [string]$folder,
        [int]$days,
        [switch]$recurse
    )
    $date = Get-Date
    $maxModified = $date.AddDays(-$days)
    $maxModified

    $data = Get-ChildItem $folder -Recurse:$recurse
    foreach($item in $data) {
        $lastModified = $item.lastWriteTime
        $item.name
        if ($lastModified -lt $maxModified) {
            Write-Host "Delete this!"
            $path = $item.FullName
            Remove-Item $path -WhatIf
        }
    }
}


main -folder "C:\Users\duernbec\Desktop\test" -days 10 -recurse
