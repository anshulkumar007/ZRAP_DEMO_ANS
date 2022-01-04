@AbapCatalog.sqlViewName: 'ZZZI_EMP_DETAILS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Interface View for Emp Details'
define root view ZI_EMP_DETAILS as select from zemp_details_un {
   key id            as ID,
       firstname     as FIRSTNAME,
       lastname      as LASTNAME,
       age           as Age,
       role          as Role,
       salary        as Salary, 
       active        as Active,
       @Semantics.systemDateTime.lastChangedAt: true
       last_changed_at as Last_Changed_At,
       @Semantics.systemDateTime.localInstanceLastChangedAt: true
      //@Semantics.systemDateTime.lastChangedAt: true
      local_last_changed_at as Local_Last_Changed_At
       
}
