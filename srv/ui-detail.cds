using Accommodations from './service';

annotate Accommodations.Units with @(UI : {
    HeaderFacets             : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Location'
    }],
    Facets                   : [
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Availability',
        Target : '@UI.FieldGroup#Availability'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Floorplan',
        Target : '@UI.FieldGroup#Layout'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'More information',
        Target : '@UI.FieldGroup#Description'
    }
    ],
    FieldGroup #Location     : {Data : [
    {Value : emirate},
    {Value : area},
    {
        Value                     : price,
        Criticality               : price_crit,
        CriticalityRepresentation : #WithoutIcon
    },
    {
        $Type  : 'UI.DataFieldForAnnotation',
        Target : '@UI.DataPoint#Rate'
    }
    ]},
    FieldGroup #Layout       : {Data : [
    {Value : beds},
    {Value : baths},
    {Value : sqft}
    ]},
    FieldGroup #Availability : {Data : [
    {
        Value       : occupied,
        Criticality : occupied_crit
    },
    {
        Value                     : available,
        Criticality               : occupied_crit,
        CriticalityRepresentation : #WithoutIcon
    }
    ]},
    FieldGroup #Description  : {Data : [
    //{Value : picture},
    {
        $Type  : 'UI.DataFieldForAnnotation',
        Target : '@UI.DataPoint#Distance',
        Label  : 'Distance to Clinic'
    },
    {
        $Type  : 'UI.DataFieldForAnnotation',
        Target : '@UI.DataPoint#Other',
        Label  : 'Distance to School'        
    }
    ]},
    DataPoint #Distance      : {
        $Type         : 'UI.DataPointType',
        Value         : 8,
        TargetValue   : 10,
        Visualization : #Progress
    },
    DataPoint #Other      : {
        $Type         : 'UI.DataPointType',
        Value         : 7,
        TargetValue   : 10,
        Visualization : #Progress
    }
});
