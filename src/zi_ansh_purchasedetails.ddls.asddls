@AbapCatalog.sqlViewName: 'ZIANSHPODOC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Document Details'
define view ZI_ANSH_PURCHASEDETAILS as select from zpurchase_doc1
association[1..*] to ZI_ANSH_PURCHASEITEMS as _PurchaseItem on $projection.PurchaseDoc = _PurchaseItem.PurchaseDoc
association[1] to ZI_ANSH_POSTATUS as _PurchaseStatus on $projection.Status = _PurchaseStatus.Status
association[1] to ZI_ANSH_POPRIORITY as _PurchasePriority on $projection.Priority = _PurchasePriority.Priority
 {
 @ObjectModel.text.element: ['Description']
    key purchase_doc as PurchaseDoc,
    @Semantics.text: true
    description as Description,
    
    company_code as CompanyCode,
    doc_category as DocCategory,
    pruch_org as PruchOrg,
    status as Status,
    priority as Priority,
    cr_time_date as CrTimeDate,
    create_by as CreateBy,
    ch_time_date as ChTimeDate,
    change_by as ChangeBy,
    _PurchaseItem,
    _PurchaseStatus,
    _PurchasePriority
}
