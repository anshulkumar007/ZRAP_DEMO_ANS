@AbapCatalog.sqlViewName: 'ZIANSHPOTOTAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Document Total Price'
define view ZI_ANSH_PURCHASEDOCTOTALPRICE 
as select from ZI_ANSH_PURCHASEDETAILS 
{
    key PurchaseDoc,
    @Semantics.amount.currencyCode: 'Currency'
    sum( _PurchaseItem.TotalPrice) as ItemTotalPrice,
    @Semantics.currencyCode: true
    _PurchaseItem.Currency as Currency,
    Description,
    CompanyCode,
    DocCategory,
    PruchOrg,
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
} group by
PurchaseDoc,
_PurchaseItem.Currency,
Description,
CompanyCode,
    DocCategory,
    PruchOrg,
    Status,
    Priority,
    CrTimeDate,
    CreateBy,
    ChTimeDate,
    ChangeBy;
