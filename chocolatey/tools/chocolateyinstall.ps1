$ErrorActionPreference = 'Stop'

# DiskGeek ships an Inno Setup installer. The package downloads it from the GitHub release for the
# matching tag and verifies it against a SHA-256 checksum rather than embedding the binary. Because
# nothing is embedded, this package must NOT contain a tools\VERIFICATION.txt - that file is only
# for packages that ship a binary inside the nupkg, and including one is what the USP 8.0.0
# submission was rejected for.
$packageArgs = @{
  packageName    = 'diskgeek'
  fileType       = 'exe'
  url            = 'https://github.com/techygeekshome/DiskGeek/releases/download/v1.1.1/DiskGeekSetup.exe'
  checksum       = 'd01c3068b604f333c529b33c316b44e42c4fab3c9d3ed047e2ea3666302e9dd4'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
