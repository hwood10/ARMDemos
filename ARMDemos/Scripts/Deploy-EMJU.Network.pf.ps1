#Requires -Version 3.0

Param(
  [string] [Parameter(Mandatory=$true)] $ResourceGroupLocation,
  [string] $ResourceGroupName = 'EMJU-AZPF-Network',  
  [switch] $UploadArtifacts,
  [string] $StorageAccountName,
  [string] $StorageAccountResourceGroupName, 
  [string] $StorageContainerName = $ResourceGroupName.ToLowerInvariant() + '-stageartifacts',
  [string] $TemplateFile = '..\Templates\DeploymentTemplate-EMJU.Network.json',
  [string] $TemplateParametersFile = '..\Templates\DeploymentTemplate-EMJU.Network.param.dev.json',
  [string] $ArtifactStagingDirectory = '..\bin\Debug\staging',
  [string] $AzCopyPath = '..\Tools\AzCopy.exe'
)


Import-Module Azure -ErrorAction SilentlyContinue

try {
  [Microsoft.Azure.Common.Authentication.AzureSession]::ClientFactory.AddUserAgent("VSAzureTools-$UI$($host.name)".replace(" ","_"), "2.7")
} catch { }

Set-StrictMode -Version 3

$OptionalParameters = New-Object -TypeName Hashtable
$TemplateFile = [System.IO.Path]::Combine($PSScriptRoot, $TemplateFile)
$TemplateParametersFile = [System.IO.Path]::Combine($PSScriptRoot, $TemplateParametersFile)

# Create or update the resource group using the specified template file and template parameters file

#Login-AzureRmAccount

Set-AzureRmContext -SubscriptionId ec4b8e6e-6a27-4430-a1ac-3ded010cb563 -SubscriptionName "EMJU-pf" -TenantId b7f604a0-00a9-4188-9248-42f3a5aac2e9

New-AzureRmResourceGroup -Name $ResourceGroupName `
                       -Location $ResourceGroupLocation `

New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName `
                       -Location $ResourceGroupLocation `
                       -TemplateFile $TemplateFile `
                       -TemplateParameterFile $TemplateParametersFile `
                        @OptionalParameters `
                        -Force -Verbose
