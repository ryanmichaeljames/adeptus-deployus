<#
.SYNOPSIS
    Installs the Power Platform Build Tools extension in Azure DevOps.

.DESCRIPTION
    This function automates the installation of the Power Platform Build Tools extension in a specified Azure DevOps organization.
    The extension provides tasks for automating Power Platform ALM processes such as solution export, import, and deployment.

.PARAMETER DevOpsOrgUrl
    The URL of the Azure DevOps organization where the extension will be installed. This parameter is required.

.EXAMPLE
    # Install the Power Platform Build Tools extension
    Install-PowerPlatformBuildTools -DevOpsOrgUrl "https://dev.azure.com/ORG_NAME"

    This example installs the Power Platform Build Tools extension in the specified Azure DevOps organization.

.NOTES
    Author: Ryan James
    Requires: Azure CLI (az) installed and authenticated
    Purpose: Automates the installation of the Power Platform Build Tools extension in Azure DevOps
#>
function Install-PowerPlatformBuildTools {
    param (
        [Parameter(Mandatory=$true)]
        [string]$DevOpsOrgUrl
    )

    # Install the Power Platform Build Tools extension
    az devops extension install `
        --extension-id "PowerPlatform-BuildTools" `
        --publisher-id "microsoft-IsvExpTools" `
        --org $DevOpsOrgUrl
}
