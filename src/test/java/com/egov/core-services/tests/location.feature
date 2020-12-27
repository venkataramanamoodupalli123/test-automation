Feature: Location

Background:
  * def jsUtils = read('classpath:jsUtils.js')
  * def javaUtils = Java.type('com.egov.base.EGovTest')
  * def authUsername = counterEmployeeUserName
  * def authPassword = counterEmployeePassword
  * def authUserType = 'EMPLOYEE'
  * call read('../pretests/authenticationToken.feature')
  * def location = read('../requestPayload/location/searchLocation.json')
  * print location
  * def locconst = read('../constants/location.yaml')
  

@SearchLocation_01 @location
Scenario: Send a POST request for a given tenant Id to search for the location details
      * def hierarchyTypeCode = locconst.parameters.hierarchyTypeCode
      * def boundaryType = locconst.parameters.boundaryType
      * call read('../pretests/location.feature@locationsuccess')
      * print searchLocationResponseBody
      * match searchLocationResponseBody == '#present'

@SearchLocation_NoTenantId_02 @location
Scenario: Search for  location details without tenantId
      * def hierarchyTypeCode = locconst.parameters.hierarchyTypeCode
      * def boundaryType = locconst.parameters.boundaryType
      * call read('../pretests/location.feature@locationwithnotenantid')
      * print searchLocationResponseBody

@SearchLocation_NonExistentValues_03  @location
Scenario: Send a POST request by passing  invalid/ non existent tenantId and search for the location details
      * def hierarchyTypeCode = locconst.parameters.hierarchyTypeCode
      * def boundaryType = locconst.parameters.boundaryType
      * def tenantId = locconst.parameters.invldTenantId
      * call read('../pretests/location.feature@locationsuccess')
      * print searchLocationResponseBody

@SearchLocation_MultiplehierarchyTypeCode_04  @location
Scenario: Send a POST request by passing Multiple hierarchyTypeCode and search for the location details for a particular Tenant
      * def hierarchyTypeCode = locconst.parameters.multiHierarchyTypeCode
      * def boundaryType = locconst.parameters.boundaryType
      * call read('../pretests/location.feature@locationsuccess')
      * print searchLocationResponseBody
      * match searchLocationResponseBody == '#present'   

@SearchLocation_AllRecords_05  @location
Scenario: Search to fetch all the records for a particular tenant
      * call read('../pretests/location.feature@locationsuccesswithtenantid')
      * print searchLocationResponseBody
      * match searchLocationResponseBody == '#present'  

@SearchLocation_WrongEndPoint_06   @location
Scenario: Send a POST request by passing a wrong endpoint
      * call read('../pretests/location.feature@locationerrorinvldendpoint')
      * print searchLocationResponseBody
      

# @SearchLocation_InvalidAuthToken_07
# Scenario: Send a POST request by passing a wrong auth token
#      * call read('../pretests/location.feature')

@SearchLocation_MulltipleTenantId_08  @location
Scenario: Send a POST request by passing multiple tenants which are valid in the request
      * def hierarchyTypeCode = locconst.parameters.hierarchyTypeCode
      * def boundaryType = locconst.parameters.boundaryType
      * def tenantId = locconst.parameters.multiTenantid
      * call read('../pretests/location.feature@locationsuccess')
      * print searchLocationResponseBody




