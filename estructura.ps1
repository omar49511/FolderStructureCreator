param(
    [string]$folderName
)

$baseFolder = $folderName

# Verificamos si la carpeta ya existe
if (Test-Path -Path $baseFolder -PathType Container) {
    Write-Host "La carpeta '$baseFolder' ya existe en esta ubicación."
} else {
    Write-Host "Creando estructura de carpetas y archivos..."

    # Crear carpeta principal
    New-Item -ItemType Directory -Path "$baseFolder" > $null
    Write-Host "Carpeta principal creada..."

    # Crear carpeta css
    New-Item -ItemType Directory -Path "$baseFolder\css" > $null
    Write-Host "Carpeta css creada..."

    # Crear archivo styles.css
    New-Item -ItemType File -Path "$baseFolder\css\styles.css" > $null
    Write-Host "Archivo styles.css creado..."

    # Crear carpeta img
    New-Item -ItemType Directory -Path "$baseFolder\img" > $null
    Write-Host "Carpeta img creada..."

    # Crear carpeta js
    New-Item -ItemType Directory -Path "$baseFolder\js" > $null
    Write-Host "Carpeta js creada..."

    # Crear archivo index.js
    New-Item -ItemType File -Path "$baseFolder\js\index.js" > $null

    # Crear archivo index.html
    New-Item -ItemType File -Path "$baseFolder\index.html" > $null

    # Escribir la estructura básica de HTML en el archivo index.html
    $htmlContent = @'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Página</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Mi Página</h1>
    <script src="js/index.js"></script>
</body>
</html>
'@

    $htmlContent | Set-Content -Path "$baseFolder\index.html" -Encoding UTF8

    Write-Host "Estructura de carpetas y archivos creada exitosamente en $baseFolder"
}
