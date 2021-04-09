namespace my.realestate;

using {managed} from '@sap/cds/common';

entity Units : managed {
    key id                     : UUID @(Core.Computed : true);
        emirate                : String;
        area                   : String;
        description            : String;
        picture                : String;
        beds                   : Integer;
        baths                  : Integer;
        sqft                   : Integer;
        rating                 : Integer;
        available              : Date;
        price                  : Integer;
        virtual price_crit     : Integer;
        virtual occupied       : String;
        virtual enquireEnabled : Boolean;
        virtual occupied_crit  : Integer;
}

entity Employees : managed {
    key id         : UUID @(Core.Computed : true);
        name       : String;
        position   : String;
        allowance  : Integer;
        familysize : String;
}
