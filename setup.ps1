# Claude Project Template Setup
# Bu script placeholder'ları proje bilgilerinizle değiştirir.

param(
    [string]$ProjectName,
    [string]$ProjectDescription
)

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "=== Claude Project Template Setup ===" -ForegroundColor Cyan
Write-Host ""

# Proje adı
if (-not $ProjectName) {
    $ProjectName = Read-Host "Proje adi"
}
if (-not $ProjectName) {
    Write-Host "Hata: Proje adi bos olamaz." -ForegroundColor Red
    exit 1
}

# Proje açıklaması
if (-not $ProjectDescription) {
    $ProjectDescription = Read-Host "Proje aciklamasi"
}
if (-not $ProjectDescription) {
    $ProjectDescription = "$ProjectName projesi."
}

Write-Host ""
Write-Host "Proje: $ProjectName" -ForegroundColor Green
Write-Host "Aciklama: $ProjectDescription" -ForegroundColor Green
Write-Host ""

# Dosyalarda placeholder değiştir
$filesToUpdate = @(
    "CLAUDE.md",
    "package.json",
    "index.html",
    "src\App.tsx",
    ".claude\skills\project-workflow\SKILL.md",
    ".claude\skills\project-testing\SKILL.md"
)

foreach ($file in $filesToUpdate) {
    $filePath = Join-Path $PSScriptRoot $file
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw -Encoding UTF8
        $content = $content -replace '\{\{PROJECT_NAME\}\}', $ProjectName
        $content = $content -replace '\{\{PROJECT_DESCRIPTION\}\}', $ProjectDescription
        Set-Content $filePath $content -Encoding UTF8 -NoNewline
        Write-Host "  Guncellendi: $file" -ForegroundColor DarkGray
    }
}

Write-Host ""
Write-Host "Setup tamamlandi!" -ForegroundColor Green
Write-Host ""

# Setup dosyalarını silme teklifi
$cleanup = Read-Host "Setup dosyalarini silmek ister misiniz? (e/h)"
if ($cleanup -eq "e") {
    Remove-Item (Join-Path $PSScriptRoot "setup.ps1") -Force -ErrorAction SilentlyContinue
    Remove-Item (Join-Path $PSScriptRoot "setup.sh") -Force -ErrorAction SilentlyContinue
    Write-Host "Setup dosyalari silindi." -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "Projeniz hazir! 'claude' veya 'npm run dev' ile baslayabilirsiniz." -ForegroundColor Cyan
Write-Host ""
