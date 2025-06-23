#!/bin/bash

###############################################################################
# Author: Mushrauf khan Pattan
# Version: v0.0.1
#
# Script to automate the process of listing all the resources in an Azure account
#
# Supported services:
# 1. VM
# 2. SQL
# 3. Storage
# 4. CDN
# 5. VNet
# 6. AD User
# 7. DNS
# 8. Monitor
# 9. Resource Group
# 10. Function
# 11. ServiceBus
# 12. Queue
# 13. CosmosDB
# 14. Disk
#
# Usage: ./azure_resource_list.sh <azure_region> <azure_service>
# Example: ./azure_resource_list.sh eastus vm
###############################################################################

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: ./azure_resource_list.sh <azure_region> <azure_service>"
    echo "Example: ./azure_resource_list.sh eastus vm"
    exit 1
fi

# Assign the arguments to variables and convert the service to lowercase
azure_region=$1
azure_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')

# Check if the Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "Azure CLI is not installed. Please install the Azure CLI and try again."
    exit 1
fi

# Check if the Azure CLI is logged in
if ! az account show &> /dev/null; then
    echo "Azure CLI is not authenticated. Please run 'az login' and try again."
    exit 1
fi

# List the resources based on the service
case $azure_service in
    vm)
        echo "Listing Virtual Machines in $azure_region"
        az vm list --query "[?location=='$azure_region']" -o table
        ;;
    sql)
        echo "Listing SQL Servers in $azure_region"
        az sql server list --query "[?location=='$azure_region']" -o table
        ;;
    storage)
        echo "Listing Storage Accounts in $azure_region"
        az storage account list --query "[?location=='$azure_region']" -o table
        ;;
    cdn)
        echo "Listing CDN Profiles in $azure_region"
        az cdn profile list --query "[?location=='$azure_region']" -o table
        ;;
    vnet)
        echo "Listing Virtual Networks in $azure_region"
        az network vnet list --query "[?location=='$azure_region']" -o table
        ;;
    aduser)
        echo "Listing Azure AD Users"
        az ad user list --all --query "[].{Name:displayName, UPN:userPrincipalName}" -o table
        ;;
    dns)
        echo "Listing DNS Zones"
        az network dns zone list -o table
        ;;
    monitor)
        echo "Listing Monitor Alerts"
        az monitor alert list -o table
        ;;
    rg)
        echo "Listing Resource Groups in $azure_region"
        az group list --query "[?location=='$azure_region']" -o table
        ;;
    function)
        echo "Listing Function Apps in $azure_region"
        az functionapp list --query "[?location=='$azure_region']" -o table
        ;;
    servicebus)
        echo "Listing Service Bus Namespaces in $azure_region"
        az servicebus namespace list --query "[?location=='$azure_region']" -o table
        ;;
    queue)
        echo "Listing Storage Queues (Manual input needed)"
        echo "Run: az storage queue list --account-name <your_storage_account>"
        ;;
    cosmosdb)
        echo "Listing Cosmos DB Accounts in $azure_region"
        az cosmosdb list --query "[?location=='$azure_region']" -o table
        ;;
    disk)
        echo "Listing Managed Disks in $azure_region"
        az disk list --query "[?location=='$azure_region']" -o table
        ;;
    *)
        echo "Invalid service. Please enter a valid Azure service."
        exit 1
        ;;
esac
