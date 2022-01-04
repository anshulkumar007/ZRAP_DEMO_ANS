@AbapCatalog.sqlViewName: 'ZCANSHPOTOTAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Document Total Price'
@Metadata.allowExtensions: true
@Search.searchable: true
define view ZC_ANSH_TOTAL_PRICE as select from ZI_ANSH_PURCHASEDOCTOTALPRICE {
    key PurchaseDoc,
    ItemTotalPrice,
    Currency,
    @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7, ranking: #HIGH}
    Description,
    CompanyCode,
    DocCategory,
    PruchOrg,
    @Consumption.valueHelpDefinition: [{entity: { name: 'ZC_ANSH_POSTATUSVH', element: 'Status'} }]
    Status,
    Priority,
    CrTimeDate,
    CreateBy,
    ChTimeDate,
    ChangeBy,
    /* Associations */
    _PurchaseItem,
    _PurchasePriority,
    _PurchaseStatus
}
