# Salesforce-LWC-FileFrame

## Overview

Salesforce-LWC-FileFrame is a custom Lightning Web Component that allows you to display related record files directly within a record's Flexipage in Salesforce. This README outlines the steps required to deploy this component to your Salesforce organization.

## Prerequisites

- Salesforce CLI (sfdx) must be installed. If not, you can find the installation guide [here](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm).

## Installation

### Step 1: Connect to Salesforce CLI

1. Open your terminal and run the following command to login to your Salesforce org:
   ```
   sf org login web
   ```
2. Complete the web-based authentication flow.

> **Note**: You can verify the connected orgs by running:

`sf org list`

### Step 2: Deploy the Component

Run the following command to deploy the Salesforce-LWC-FileFrame component to your org:

`sf project deploy start -o <<your_user_name>>`

## Usage

To add the `FileFrame` component to a Flexipage, follow these steps:

1. Open the Salesforce Setup.
2. Navigate to the Flexipages section.
3. Edit the Flexipage where you want to add the component.
4. Drag and drop the `FileFrame` component to the desired position on the Flexipage.

## Customization

More detailed customization options will be provided soon.

## Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for more information.

## License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.
