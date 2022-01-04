@EndUserText.label: 'Consumption View for Emp Details'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_EMP_DETAILS as projection on ZI_EMP_DETAILS as EMPDetails {
    @EndUserText.label: 'Id'
    key ID,
    @EndUserText.label: 'First Name'
    @Search.defaultSearchElement: true
    FIRSTNAME,
     @EndUserText.label: 'Last Name'
    @Search.defaultSearchElement: true
    LASTNAME,
    @EndUserText.label: 'Age'
    Age,
     @EndUserText.label: 'Role'
    @Search.defaultSearchElement: true
    Role,
    @EndUserText.label: 'Salary'
    Salary,
    @EndUserText.label: 'Active'
    Active,
    Last_Changed_At,
    Local_Last_Changed_At

}
