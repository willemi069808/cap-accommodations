using Accommodations from './service';

annotate Accommodations.Units with {
    emirate @(	
        Common: {
            //Text: emirate  , 
            ValueList: {
                Label: 'List of Emirates',
                CollectionPath: 'distinctEmirates',
                Parameters: [
                    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'emirate' }     					                                   
                ]
            }
        }
    );
}
