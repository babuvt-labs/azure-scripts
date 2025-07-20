# Step-by-Step: How to Setup and Use Azure CLI Interactive Mode

> **Tags:**
> `#terminal` `#azure` `#cli` `#ai`

---

## Overview

The **Azure Command Line Interface (CLI)** is a developer tool that allows users to control Azure services using command line commands. It is a cross-platform tool that can be installed in multiple ways (Windows, Mac, Linux, Docker, and Azure Cloud Shell).

Azure CLI supports extensions to add functionality for development and deployment to the cloud. One of the latest is the **AZ Interactive extension**, which is now in preview.

---

## Useful Links

* [Install Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
* [Azure CLI Interactive documentation](https://docs.microsoft.com/en-us/cli/azure/interactive-azure-cli)
* [Azure Interactive GitHub Guide](https://github.com/Azure/azure-cli-shell)

---

## What is AZ Interactive?

Using any CLI can be cumbersome, especially for beginners. **AZ Interactive** is an AI-based extension for the Azure CLI that acts as a “cheat code” for developers:

* Makes discovering services, commands, and parameters easier
* Reduces learning time for Azure CLI commands
* Speeds up writing commands and deploying resources

It is useful for both newcomers and experienced users.

---

## Prerequisites

* **Azure CLI installed**
  Find installation instructions [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).

---

## Installing AZ Interactive

1. **Open your terminal** (with Azure CLI installed).

2. **Install the extension** by running:

   ```sh
   az extension add --name interactive --upgrade
   ```

3. **Start Interactive Mode**:

   ```sh
   az interactive
   ```

---

## Using AZ Interactive

### Command Suggestions

* As you type, AZ Interactive suggests commands that match your input.
* It is similar to tab completion, but smarter and more intuitive.

### Command Scenarios

* Select a scenario, and AZ Interactive will guide you through the process, generating the commands you need to deploy resources.

### Search for Commands and Scenarios

* Use search to find commands, parameters, or resources.
* For example, searching *“connect an app service to mongodb”* generates all necessary commands for that scenario.

### Running Commands Outside Interactive Mode

* You can run regular shell commands by prefixing them with `#`.
* Example:

  * To check your current directory in interactive mode:

    ```sh
    #pwd
    ```

### JMESPath Query Support

* **JMESPath** lets you extract and transform JSON output.
* Example: To get the `name` of a resource group from a previous command’s output:

  ```sh
  ??name
  ```
* You can inject JMESPath queries into future commands, enabling advanced scripting and data reuse in your session.

### Status Codes

* The `$` symbol returns the status code of the previous command.
* For example, a status code of `0` means the command was successful.

### Setting Scope

* Set the scope of commands to avoid repeating command group prefixes.
* Example: To focus on resource groups:

  ```sh
  %% group
  ```
* Now, run commands within that group without the full prefix.

### Fun Colour Themes

* Customize your terminal with different color themes for text, dropdown lists, and more!
* To turn off AI recommendations and revert to basics:

  ```sh
  az config set interactive.enable_recommender=False
  ```

---

## Summary & Recommendation

**AZ Interactive** makes working with the Azure CLI easier, more intuitive, and more productive. It is ideal for both beginners and experienced users who want to speed up their workflow.

For more examples and advanced usage, check out the [Azure CLI Interactive documentation](https://docs.microsoft.com/en-us/cli/azure/interactive-azure-cli).

---

> Happy terminal'ing!
