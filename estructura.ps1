param(
    [string]$folderName
)

$baseFolder = $folderName

# Verificamos si la carpeta ya existe
if (Test-Path -Path $baseFolder -PathType Container) {
    Write-Host "La carpeta '$baseFolder' ya existe en esta ubicación. ¯\_(⊙︿⊙)_/¯"
} else {
    Write-Host "Creando estructura de carpetas y archivos..."

    # Crear carpeta principal
    New-Item -ItemType Directory -Path "$baseFolder" > $null
    Write-Host "✅ Carpeta principal creada..."

    # Crear carpeta css
    New-Item -ItemType Directory -Path "$baseFolder\css" > $null
    Write-Host "✅ Carpeta css creada..."

    # Crear archivo styles.css
    New-Item -ItemType File -Path "$baseFolder\css\styles.css" > $null
    Write-Host "✅ Archivo styles.css creado..."

    # Crear carpeta img
    New-Item -ItemType Directory -Path "$baseFolder\img" > $null
    Write-Host "✅ Carpeta img creada..."

    # Crear carpeta js
    New-Item -ItemType Directory -Path "$baseFolder\js" > $null
    Write-Host "✅ Carpeta js creada..."

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
    <link rel="stylesheet" href="css/app.css">
</head>
<body>
    <h1>Mi Página</h1>
    <script src="js/index.js"></script>
</body>
</html>
'@
    # Crear y agregar estilos en el archivo app.css
    $cssContent = @'
@charset "UTF-8";

:root {
  --negro: #393939;
  --tipo-principal: Helvetica, Arial, sans-serif;
  --tipo-secundaria: Verdana;
}

@media (prefers-color-scheme: dark) {
  :root {
    --negro: #ececec;
  }
}

@media (prefers-reduced-motion: reduce) {
  * {
    -webkit-animation: none !important;
    animation: none !important;
    -webkit-transition: none !important;
    transition: none !important;
  }
}

* {
  margin: 0;
  padding: 0;
  border: 0;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  vertical-align: baseline;
}

img,
picture,
video,
iframe,
figure {
  max-width: 100%;
  width: 100%;
  display: block;

  -o-object-fit: cover;
  object-fit: cover;

  -o-object-position: center center;
  object-position: center center;
}

a {
  display: block;
  text-decoration: none;
  color: inherit;
  font-size: inherit;
}

p a {
  display: inline;
}

li {
  list-style-type: none;
}

html {
  scroll-behavior: smooth;
}

h1,
h2,
h3,
h4,
h5,
h6,
p,
span,
a,
strong,
blockquote,
i,
b,
u,
em {
  font-size: 1em;
  font-weight: inherit;
  font-style: inherit;
  text-decoration: none;
  color: inherit;
}

blockquote:before,
blockquote:after,
q:before,
q:after {
  content: "";
  content: none;
}

::-moz-selection {
  background-color: var(--negro);
  color: var(--blanco);
}
::selection {
  background-color: var(--negro);
  color: var(--blanco);
}

form,
input,
textarea,
select,
button,
label {
  font-family: inherit;
  font-size: inherit;
  -webkit-hyphens: auto;
  -ms-hyphens: auto;
  hyphens: auto;
  background-color: transparent;
  color: inherit;
  display: block;

  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

table,
tr,
td {
  border-collapse: collapse;
  border-spacing: 0;
}

svg {
  width: 100%;
  display: block;
  fill: currentColor;
}

body {
  min-height: 100vh;
  font-size: 100%;
  font-family: var(--tipo-principal);
  color: var(--negro);

  line-height: 1.4em;

  -webkit-hyphens: auto;
  -ms-hyphens: auto;
  hyphens: auto;

  font-smooth: always;

  -webkit-font-smoothing: antialiased;

  -moz-osx-font-smoothing: grayscale;
}

'@

    $htmlContent | Set-Content -Path "$baseFolder\index.html" -Encoding UTF8
    $cssContent | Out-File -FilePath "$baseFolder\css\app.css" -Encoding UTF8
    Write-Host "✅ Archivo app.css creado y estilos agregados..."

    Write-Host "Estructura de carpetas y archivos creada exitosamente en $baseFolder ☜(⌒▽⌒)☞"
}
