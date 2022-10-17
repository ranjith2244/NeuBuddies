Vnet have dependency on  ddos protection module(if DDos protection is required)

This module creates the Vnet with following features

1. Vnet if not already created by Vnet module
2. Subnet 1: ploceusvnet000001a 
3. ploceusvnet000001a  is added to resource group ploceusrg000001 and required fields such as name,location,resource_group_name are to be provided in tfvars
4. setting is_ddos_protection_required attribute to true will enable ddos protection plan to Vnet.
  

Need to test:

1. Vnet with DDOS protectio is not tested as  DDOS protection plan costs huge.  

