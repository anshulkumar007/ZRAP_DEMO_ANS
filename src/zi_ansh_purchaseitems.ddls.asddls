@AbapCatalog.sqlViewName: 'ZIANSHPURITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase ITEMS'
define view ZI_ANSH_PURCHASEITEMS as select from zpurchase_item1 
association[1] to ZI_ANSH_PURCHASEDETAILS as _PurchaseHeader on $projection.PurchaseDoc = _PurchaseHeader.PurchaseDoc
association[1..1] to I_Currency as _Currency on $projection.Currency = _Currency.Currency
association[1..1] to I_UnitOfMeasure as _UOM on $projection.Unit = _UOM.UnitOfMeasure
{
    key purchase_doc as PurchaseDoc,
    @ObjectModel.text.element: ['ShortText']
    key purchase_item as PurchaseItem,
    @Semantics.text: true
    short_text as ShortText,
    
    @Semantics.amount.currencyCode: 'Currency'
    price as Price,
    @Semantics.currencyCode: true
    currency as Currency,
    (price * quantity) as TotalPrice,
    @Semantics.quantity.unitOfMeasure: 'Unit'
    quantity as Quantity,
    @Semantics.unitOfMeasure: true
    unit as Unit,
    
    change_date_time as ChangeDateTime,
    _PurchaseHeader,
    _Currency,
    _UOM
}
