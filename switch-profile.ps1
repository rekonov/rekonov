param(
    [ValidateSet("premium", "backend", "fullstack", "ai")]
    [string]$Role = "premium"
)

$ErrorActionPreference = "Stop"

$templates = @{
    premium  = "README.premium.md"
    backend  = "README.backend-nodejs.md"
    fullstack = "README.fullstack-nextjs.md"
    ai       = "README.ai-engineer.md"
}

$source = Join-Path $PSScriptRoot $templates[$Role]
$target = Join-Path $PSScriptRoot "README.md"

Copy-Item -Path $source -Destination $target -Force
Write-Host "Profile switched to '$Role' using $($templates[$Role])."
