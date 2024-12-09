<#
.SYNOPSIS
    Creates a service connection in Azure DevOps using a specified configuration file.

.DESCRIPTION
    This function automates the creation of a service endpoint in Azure DevOps by leveraging the Azure CLI.
    The configuration details are provided in a JSON file, ensuring a repeatable and efficient setup process.

.PARAMETER ConfigFilePath
    The path to the JSON configuration file that defines the service endpoint. This parameter is required.

.PARAMETER DevOpsOrgUrl
    The URL of the Azure DevOps organization where the service endpoint will be created. This parameter is required.

.PARAMETER ProjectName
    The name of the Azure DevOps project where the service endpoint will be added. This parameter is required.

.EXAMPLE
    # Create a service endpoint in Azure DevOps
    Set-DevOpsServiceEndpoint -ConfigFilePath "./service-endpoint-config.json" -DevOpsOrgUrl "https://dev.azure.com/ORG_NAME" -ProjectName "PROJECT_NAME"

    This example creates a service endpoint in the specified Azure DevOps organization and project using the provided configuration file.

.NOTES
    Author: Ryan James
    Requires: Azure CLI (az) installed and authenticated
    Purpose: Automates the creation of Azure DevOps service endpoints
#>
function Set-DevOpsServiceEndpoint {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ConfigFilePath,

        [Parameter(Mandatory=$true)]
        [string]$DevOpsOrgUrl,

        [Parameter(Mandatory=$true)]
        [string]$ProjectName
    )

    # Create the service endpoint
    az devops service-endpoint create `
        --service-endpoint-configuration $ConfigFilePath `
        --org $DevOpsOrgUrl `
        --project $ProjectName
}
