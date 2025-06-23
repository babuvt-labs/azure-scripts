# Azure Resource Listing Script

## Overview

This Bash script automates the listing of various Azure resources filtered by region and service type. It uses the Azure CLI (`az`) to fetch and display resource information in a tabular format.

---

## 📌 Features

- Lists Azure resources by **region** and **service**
- Supports the following services:
  - Virtual Machines (`vm`)
  - SQL Servers (`sql`)
  - Storage Accounts (`storage`)
  - CDN Profiles (`cdn`)
  - Virtual Networks (`vnet`)
  - Azure AD Users (`aduser`)
  - DNS Zones (`dns`)
  - Monitor Alerts (`monitor`)
  - Resource Groups (`rg`)
  - Function Apps (`function`)
  - Service Bus Namespaces (`servicebus`)
  - Storage Queues (`queue`) *(manual input needed)*
  - Cosmos DB Accounts (`cosmosdb`)
  - Managed Disks (`disk`)

---

## 🔧 Prerequisites

- **Azure CLI** must be installed on your system.  
  Install from: [https://learn.microsoft.com/en-us/cli/azure/install-azure-cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

- You must be **logged in** to Azure via CLI using:
  ```bash
  az login
  ````

---

## 🚀 Usage

```bash
./azure_resource_list.sh <azure_region> <azure_service>
```

### ✅ Examples

```bash
./azure_resource_list.sh eastus vm
./azure_resource_list.sh westus2 sql
./azure_resource_list.sh eastus storage
```

---

## 📋 Output

The script returns a table-format output of the requested resources using Azure CLI’s `--query` and `-o table` options.

---

## ⚠️ Notes

* For the `queue` service, additional manual input is required. You'll be prompted to run:

  ```bash
  az storage queue list --account-name <your_storage_account>
  ```

* The `aduser` and `dns` services are not region-specific and will list globally.

---

## 👨‍💻 Author

**Mushrauf Khan Pattan**
Version: **v0.0.1**

---

## 📝 License

This script is provided as-is without any warranties. Use at your own risk.

```

```
