<#
.SYNOPSIS
    Creates an application user and assigns the 'System Administrator' role in a specified Power Platform environment.

.DESCRIPTION
    This function automates the process of creating an application user by authenticating to a Power Platform environment
    and assigning the specified application user the 'System Administrator' role.

.PARAMETER EnvironmentId
    The ID of the Power Platform environment where the application user will be created. This parameter is required.

.PARAMETER AppId
    The AppId of the application user to be assigned the 'System Administrator' role. This parameter is required.

.EXAMPLE
    # Create an application user in a specific environment
    Set-PowerPlatformApplicationUser -EnvironmentId "00000000-0000-0000-0000-000000000000" -AppId "00000000-0000-0000-0000-000000000000"

    This example authenticates to the specified Power Platform environment and assigns the application user with the given AppId
    the 'System Administrator' role.

.NOTES
    Author: Ryan James
    Requires: Power Platform CLI (pac) installed and authenticated
    Purpose: Automates application user creation and role assignment for Power Platform environments
#>
function Set-PowerPlatformApplicationUser {
    param (
        [Parameter(Mandatory=$true)]
        [string]$EnvironmentId,

        [Parameter(Mandatory=$true)]
        [string]$AppId
    )

    # Authenticate with the Power Platform environment
    pac auth create --environment $EnvironmentId

    # Create the application user and assign a role
    pac admin assign-user `
        --environment $EnvironmentId `
        --user $AppId `
        --role "System Administrator" `
        --application-user
}
