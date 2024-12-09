# Adeptus Deployus

**Adeptus Deployus** is a deployment pipeline framework designed to streamline your CI/CD workflows, ensuring reliable and scalable deployments. By the will of the Omnissiah, it transforms chaos into order, guiding your code from repository to production with divine precision.

> This is a work in progress and serves as acompanion to my [The Litany of Automation: A Guide to Automated Power Platform Deployments](https://www.ryanjames.dev/blog/2024/12/09/litany-of-automation-hub/) series.

## Features

- 🛠 **Automated Build and Deployment**
- ⚙️ **Modular and Flexible Pipeline Stages**
- 🌌 **Integration with Popular Tools**
- 🛡 **Focus on Reliability and Error Handling**

## Awakening the Machine Spirit (Getting Started)

### Rites of Assembly (Prerequisites)

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Power Platform CLI](https://learn.microsoft.com/en-us/power-platform/developer/howto/install-cli-msi)
- Azure DevOps with the appropriate permissions

### Rituals of Initialization (Installation)

By the will of the Omnissiah, clarity shall emerge.

### Deploy the Will of the Omnissiah (Usage)

These functions enable you to set up and manage your CI/CD pipelines with efficiency and precision. Combine them with your deployment scripts to create robust, automated workflows.

## Function Reference

### `Invoke-Setup`

Orchestrates the setup of the deployment pipeline infrastructure by invoking all necessary functions in sequence.

```powershell
Invoke-Setup SPDisplayName "APP_NAME" -EnvironmentId "00000000-0000-0000-0000-000000000000" -DevOpsOrgUrl "https://dev.azure.com/ORG_NAME" -DevOpsProjectName "PROJECT_NAME" -ServiceEndpointConfigFilePath "./service-endpoint-config.json"
```

### `Set-ServicePrincipal`
Creates a service principal and assigns Dataverse API permissions. Returns the application id and client secret.

```powershell
$sp = Set-ServicePrincipal -DisplayName "APP_NAME"
```

### `Set-PowerPlatformApplicationUser`

Creates an application user and assigns the 'System Administrator' role in a specified Power Platform environment.

```powershell
Set-PowerPlatformApplicationUser -EnvironmentId "00000000-0000-0000-0000-000000000000" -AppId "00000000-0000-0000-0000-000000000000"
```

### `Install-PowerPlatformBuildTools`

Installs the Power Platform Build Tools extension in Azure DevOps.

```powershell
Install-PowerPlatformBuildTools -DevOpsOrgUrl "https://dev.azure.com/ORG_NAME"
```

### `Set-DevOpsServiceEndpoint`

Creates a service connection in Azure DevOps using a specified configuration file.

```powershell
Set-DevOpsServiceEndpoint -ConfigFilePath "./service-endpoint-config.json" -DevOpsOrgUrl "https://dev.azure.com/ORG_NAME" -ProjectName "PROJECT_NAME"
```

## Join the Holy Crusade of Code! (Contributions)

If you are worthy and seek to improve the sacred Adeptus Deployus, your efforts will be welcomed with the blessings of the Omnissiah.

- Forge your enhancements by forking this repository.
- Test your modifications with discipline and reverence.
- Submit a pull request for the collective betterment of the machine.

The Machine God smiles upon collaboration.

## Sanctioned Usage Rights (License)

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

**Through the machine, perfection is achieved. Through Adeptus Deployus, deployment is sanctified.**

