

# Vérifier si Node.js est déjà installé
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Node.js is not installed. Installing it now..." -ForegroundColor Red

    # Définir l'URL et le chemin du fichier d'installation
    $nodeInstaller = "$env:TEMP\nodejs.msi"
    $nodeUrl = "https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi"

    # Télécharger Node.js
    Write-Host "⬇️ Downloading Node.js..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $nodeUrl -OutFile $nodeInstaller

    # Vérifier si le fichier a bien été téléchargé
    if (!(Test-Path $nodeInstaller)) {
        Write-Host "❌ Failed to download Node.js. Please check your internet connection." -ForegroundColor Red
        exit
    }

    Write-Host "🔄 Installing Node.js (this may take a few minutes)..." -ForegroundColor Yellow
    Start-Process msiexec.exe -ArgumentList "/i $nodeInstaller /quiet /norestart" -Wait -NoNewWindow

    # Vérifier si l’installation a réussi
    if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
        Write-Host "❌ Node.js installation failed. Trying manual installation..." -ForegroundColor Red
        Start-Process $nodeInstaller
        exit
    }

    Write-Host "✅ Node.js installed successfully!" -ForegroundColor Green
}

# Ajouter Node.js et npm au PATH immédiatement (évite le redémarrage)
$env:Path += ";$env:ProgramFiles\nodejs"

# Vérifier si `pnpm` est installé, sinon l'installer
if (-not (Get-Command pnpm -ErrorAction SilentlyContinue)) {
    Write-Host "📦 Installing pnpm..." -ForegroundColor Yellow
    npm install -g pnpm@latest-10
}

Write-Host "✅ Node.js and pnpm are ready!" -ForegroundColor Green

# Cloner le dépôt Vencord
Write-Host "📥 Cloning Vencord repository..." -ForegroundColor Cyan
git clone https://github.com/Vendicated/Vencord
Set-Location Vencord

# Installer les dépendances
Write-Host "📦 Installing dependencies..." -ForegroundColor Green
pnpm install --frozen-lockfile

# Créer le dossier userplugins et BlurMediasToggle
Write-Host "📂 Creating user plugin directory..." -ForegroundColor Magenta
New-Item -ItemType Directory -Path "src\userplugins\BlurMediasToggle" -Force

# Télécharger index.tsx
$pluginUrl = "https://raw.githubusercontent.com/Walkoud/VC-BlurMediasToggle/main/index.tsx"
$pluginPath = "src\userplugins\BlurMediasToggle\index.tsx"
Write-Host "⬇️ Downloading index.tsx..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $pluginUrl -OutFile $pluginPath

# Vérifier si le fichier a bien été téléchargé
if (Test-Path $pluginPath) {
    Write-Host "✅ index.tsx downloaded successfully!" -ForegroundColor Green
} else {
    Write-Host "❌ Failed to download index.tsx. Please check the URL or download it manually." -ForegroundColor Red
    exit
}

# Build et inject Vencord
Write-Host "🔨 Building Vencord..." -ForegroundColor Blue
pnpm build

Write-Host "💉 Injecting Vencord..." -ForegroundColor Blue
pnpm inject

Write-Host "🎯 Select 'Stable' using the arrow keys and press 'Enter'." -ForegroundColor Cyan
Pause

Write-Host "✅ Installation complete!" -ForegroundColor Green
