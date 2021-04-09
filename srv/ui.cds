using Accommodations from './service';

annotate Accommodations.Units with {
    emirate     @title : 'Emirate';
    area        @title : 'Area';
    description @title : 'Description';
    picture     @title : 'Picture' @UI.IsImageURL;
    beds        @title : 'Beds';
    baths       @title : 'Baths';
    sqft        @title : 'Size';
    capacity    @title : 'People';
    available   @title : 'Available';
    price       @title : 'Price';
    occupied    @title : 'Occupied';
    rating      @title : 'Luxury';
}

annotate Accommodations.Units with @(UI : {
    Identification           : [{Value : id}],
    HeaderInfo               : {
        TypeName       : 'Unit',
        TypeNamePlural : 'Units',
        TypeImageUrl: 'images/default_unit.jpg',
        ImageUrl: picture,
        Description: {Value:description}
    },
    SelectionFields          : [
    emirate,
    rating
    ],
    CreateHidden : true,
    DeleteHidden : true,
    
    LineItem                 : [
    {Value : picture},
    {Value : emirate},
    {Value : area},
    {
        $Type  : 'UI.DataFieldForAnnotation',
        Target : '@UI.DataPoint#Rate'
    },
    {
        Value                     : price,
        Criticality               : price_crit,
        CriticalityRepresentation : #WithoutIcon
    },
    {Value : beds},
    {Value : baths},
    {Value : sqft},
    {
        Value       : occupied,
        Criticality : occupied_crit
    },
    {
        Value                     : available,
        Criticality               : occupied_crit,
        CriticalityRepresentation : #WithoutIcon
    },
    {
        $Type       : 'UI.DataFieldForAction',
        Label       : 'Request',
        Determining : false,
        Action      : 'Accommodations.enquire',
        Inline      : true
    }
    ],
    DataPoint #Rate          : {
        $Type         : 'UI.DataPointType',
        Value         : rating,
        TargetValue   : 5,
        Visualization : #Rating
    }
}, );


annotate Accommodations.Employees with {
    id         @title : 'Employee ID';
    name       @title : 'Name';
    position   @title : 'Current Position';
    allowance  @title : 'Yearly Allowance';
    familysize @title : 'Your Family';
}

annotate Accommodations.Employees with @(UI : {
    Identification   : [{Value : id}],
    HeaderInfo       : {
        TypeName       : 'Employee',
        TypeNamePlural : 'Employees'
    },
    SelectionFields  : [name],
    LineItem         : [
    {Value : id},
    {Value : name},
    {Value : position},
    {Value : allowance},
    {Value : familysize}
    ],
    Facets           : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Main',
        Target : '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main : {Data : [{Value : name}]}
});
