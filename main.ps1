function main {
    param(
        $folder,
        $days
    )
    $date = Get-Date
    $maxModified = $date.AddDays(-$days)
    $maxModified

    $data = Get-ChildItem $folder
    foreach($item in $data) {
        $lastModified = $item.lastWriteTime

        if ($lastModified -lt $maxModified) {
            $name = $item.name
            Write-Host "Delete this!"
            Remove-Item "$folder\$name" -WhatIf
        }
    }
}


main -folder "FOLDER_DESTINATION" -days 10
