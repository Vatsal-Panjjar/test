provider "azurerm" {
  features {}
subscription_id = "47131d78-dc13-4bdc-954f-375b6a9e79cf"
} 

resource "azurerm_resource_group" "Puru" {
  name     = "Puru"
  location = "Central India"     
}

resource "azurerm_virtual_network" "vn-puru" {
  name                = "vn-puru"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.Puru.location
  resource_group_name = azurerm_resource_group.Puru.name
}

resource "azurerm_subnet" "sub-1" {
  name                 = "sub-1"
  resource_group_name  = azurerm_resource_group.Puru.name
  virtual_network_name = azurerm_virtual_network.vn-puru.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = azurerm_resource_group.Puru.location
  resource_group_name = azurerm_resource_group.Puru.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.sub-1.id   
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "Puru" {
  name                = "Puru"
  resource_group_name = azurerm_resource_group.Puru.name
  location            = azurerm_resource_group.Puru.location
  size                = "Standard_B1s"
  admin_username      = "Puru"
  admin_password      = "rupupuru"
  network_interface_ids = [azurerm_network_interface.nic.id]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_disk {
    name                 = "osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
