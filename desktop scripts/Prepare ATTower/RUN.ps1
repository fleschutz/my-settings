param([string]$path = "")

try {
        "Preparing and Clearing ATTower Installation"
        "-------------------------------------------"
        if ($path -eq "") { $path = Read-Host "Enter the path to ATTower" }
        if (!(Test-Path "$path")) { throw "Invalid path" }

        "(1) Copy SimControl configuration..."
        Copy-Item "$PSScriptRoot/config.xml" -destination "$path/DBase/Profiles/SimControl" -force -passthru

        "✅ ATTower at $path is prepared now."
        Start-Sleep -milliseconds 5000
        exit 0 # success
} catch {
        "⚠️ ERROR: $($Error[0]) (script line $($_.InvocationInfo.ScriptLineNumber))"
        exit 1
}