@AbapCatalog.sqlViewName: 'ZIPURPRIORITY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Priority'
define view ZI_ANSH_POPRIORITY as select from zpo_priority {
@ObjectModel.text.element: ['Description']
    key priority as Priority,
    @Semantics.text: true
    description as Description
}
