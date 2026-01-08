# Install-Module BcContainerHelper

Import-Module BcContainerHelper

# Update-Module BcContainerHelper
 
$containerName = 'PlaygroundV271'
 
$password = 'P@ssword1'

$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

$credential = New-Object pscredential 'admin', $securePassword

$auth = 'UserPassword'
 
$artifactUrl = Get-BcArtifactUrl -type 'Sandbox' -country 'dk' -version "27.1" -select latest
 
#$artifactUrl = Get-BcContainerArtifactUrl $containerName

Write-Host $artifactUrl
 
 
New-BcContainer `
    -accept_eula `
    -containerName $containerName `
    -credential $credential `
    -auth $auth `
    -artifactUrl $artifactUrl `
    -dns '8.8.8.8' `
    -updateHosts `
    -Isolation hyperv
 