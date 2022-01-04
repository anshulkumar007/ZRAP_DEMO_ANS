@AbapCatalog.sqlViewName: 'ZIPURSTATUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Status'
define view ZI_ANSH_POSTATUS as select from zpo_status1 {
@ObjectModel.text.element: ['Description']
    key status as Status,
    @Semantics.text: true
    description as Description
}
