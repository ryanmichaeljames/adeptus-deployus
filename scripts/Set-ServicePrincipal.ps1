<#
.SYNOPSIS
    Creates a service principal and assigns Dataverse API permissions.

.DESCRIPTION
    This function automates the creation of an Azure Active Directory (AAD) service principal,
    adds a secret to it, assigns necessary Dataverse permissions, and grants admin consent.
    It simplifies the manual process into a scriptable and repeatable function.

.PARAMETER DisplayName
    The display name for the service principal to be created. This parameter is required.

.OUTPUTS
    JSON object containing details of the created service principal.

.EXAMPLE
    # Create a service principal with a specified display name
    $sp = Set-ServicePrincipal -DisplayName "power-platform-adeptus-deployus"
    Write-Output $sp

.NOTES
    Author: Ryan James
    Requires: Azure CLI (az) installed and authenticated
    Purpose: Automates service principal creation for Power Platform integration
#>
function Set-ServicePrincipal {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DisplayName
    )

    # Create the service principal
    $sp = az ad app create --display-name $DisplayName | ConvertFrom-Json

    # Add secret to the service principal
    $cred = az ad app credential reset --id $sp.appId | ConvertFrom-Json

    # Add Dataverse 'user_impersonation' permission to the service principal
    az ad app permission add `
        --id $sp.appId `
        --api "00000007-0000-0000-c000-000000000000" `
        --api-permissions "78ce3f0f-a1ce-49c2-8cde-64b5c0896db4=Scope"

    # Grant admin consent
    az ad app permission grant `
        --id $sp.appId `
        --api "00000007-0000-0000-c000-000000000000" `
        --scope "user_impersonation"

    return [PSCustomObject]@{
        AppId        = $sp.appId
        ClientSecret = $cred.password
    }
}
