using my.realestate as my from '../db/schema';

@path : 'service/accommodations'
service Accommodations {
    @odata.draft.enabled
    entity Units            as projection on my.Units actions {
        @cds.odata.bindingparameter.name : 'unit'
        @Core.OperationAvailable         : unit.enquireEnabled
        action enquire(
        @title :                           'Date you want to move in'
        movein : Date);
    }

    entity Employees        as projection on my.Employees

    @readonly
    entity distinctEmirates as select distinct emirate from my.Units
}
