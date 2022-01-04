@AbapCatalog.sqlViewName: 'ZCANSHPOREPOR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO ITEM Report'
define view ZC_ANSH_PO_ITEM as select from ZI_ANSH_PURCHASEITEMS {
    key PurchaseDoc,
    key PurchaseItem,
    ShortText,
    Price,
    Currency,
    TotalPrice,
    Quantity,
    Unit,
    ChangeDateTime,
    /* Associations */
    _Currency,
    _PurchaseHeader,
    _UOM
}
