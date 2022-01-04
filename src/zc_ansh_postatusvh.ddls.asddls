@AbapCatalog.sqlViewName: 'ZCPOSTATUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Status Value Help'
@Search.searchable: true
define view ZC_ANSH_POSTATUSVH as select from ZI_ANSH_POSTATUS {
@ObjectModel.text.element: ['Description']
    key Status,
 @Semantics.text: true
 @EndUserText.label: 'Purchase Status'
 @Search.defaultSearchElement: true
 @Search.fuzzinessThreshold: 0.8
 @Search.ranking: #MEDIUM
    Description
}
