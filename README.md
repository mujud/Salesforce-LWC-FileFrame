# Salesforce-LWC-FileFrame

## Overview

Salesforce-LWC-FileFrame is a custom Lightning Web Component that allows you to display related record files directly within a record's Flexipage in Salesforce. This README outlines the steps required to deploy this component to your Salesforce organization.

## ChatGpt Flow Thread:

If you are curious about how I created this component. You can check out the chatgpt thread I used [here](https://chat.openai.com/share/19c39cf1-f0da-4a96-aa57-76ddc52907a8) and for this readme [here](https://chat.openai.com/share/1c2ca3ad-1021-459a-a5c9-cc2e7fd4b7a8) and [here](https://chat.openai.com/share/915604d1-9c8e-4915-a630-8d7e9a3ad14b) to see how I added more functionality and Testing.

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
