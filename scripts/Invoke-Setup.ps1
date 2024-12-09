<#
.SYNOPSIS
    Orchestrates the setup of the deployment pipeline infrastructure by invoking all necessary functions in sequence.

.DESCRIPTION
    This function automates the entire setup process for the Adeptus Deployus pipeline framework. It sequentially calls the following functions:
    - `Create-ServicePrincipal`
    - `Create-ApplicationUser`
    - `Install-PowerPlatformBuildTools`
    - `Set-DevOpsServiceEndpoint`

.PARAMETER SPDisplayName
    The display name for the service principal to be created.

.PARAMETER EnvironmentId
    The ID of the Power Platform environment where the application user will be created.

.PARAMETER DevOpsOrgUrl
    The URL of the Azure DevOps organization.

.PARAMETER DevOpsProjectName
    The name of the Azure DevOps project where the service endpoint will be added.

.PARAMETER ServiceEndpointConfigFilePath
    The path to the JSON configuration file for the service endpoint.

.EXAMPLE
    # Invoke the full setup
    Invoke-Setup SPDisplayName "APP_NAME" -EnvironmentId "00000000-0000-0000-0000-000000000000" -DevOpsOrgUrl "https://dev.azure.com/ORG_NAME" -DevOpsProjectName "PROJECT_NAME" -ServiceEndpointConfigFilePath "./service-endpoint-config.json"

.NOTES
    Author: [Your Name]
    Requires: Azure CLI (az), Power Platform CLI (pac) installed and authenticated
    Purpose: Automates the complete setup of the Adeptus Deployus pipeline framework
#>
function Invoke-Setup {
    param (
        [Parameter(Mandatory=$true)]
        [string]$SPDisplayName,

        [Parameter(Mandatory=$true)]
        [string]$EnvironmentId,

        [Parameter(Mandatory=$true)]
        [string]$DevOpsOrgUrl,

        [Parameter(Mandatory=$true)]
        [string]$DevOpsProjectName,

        [Parameter(Mandatory=$true)]
        [string]$ServiceEndpointConfigFilePath
    )

    Write-Host "Starting setup process..."

    # Step 1: Create Service Principal
    Write-Host "Creating service principal..."
    $spDetails = Create-ServicePrincipal -DisplayName $SPDisplayName
    Write-Host "Service Principal created with AppId: $($spDetails.AppId)"

    # Step 2: Create Application User
    Write-Host "Creating application user..."
    Create-ApplicationUser -EnvironmentId $EnvironmentId -AppId $spDetails.AppId
    Write-Host "Application user created and assigned in environment: $EnvironmentId"

    # Step 3: Install Power Platform Build Tools
    Write-Host "Installing Power Platform Build Tools..."
    Install-PowerPlatformBuildTools -OrganizationUrl $DevOpsOrganizationUrl
    Write-Host "Power Platform Build Tools installed."

    # Step 4: Set up Service Endpoint
    Write-Host "Setting up service endpoint..."
    Set-DevOpsServiceEndpoint `
        -ConfigFilePath $ServiceEndpointConfigFilePath `
        -OrganizationUrl $DevOpsOrganizationUrl `
        -ProjectName $DevOpsProjectName
    Write-Host "Service endpoint created in project: $DevOpsProjectName"

    Write-Host "Setup process completed successfully."
}
