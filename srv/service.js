module.exports = async (srv) => {
    const myProfile = await SELECT().from(cds.entities.Employees, '20466922-7d57-4e76-b14c-e53fd97dcb23');
    
    srv.after('READ', 'Units', (units) => {
        if (Array.isArray(units)) {
            units.forEach(unit => calculateCriticality(unit));
        } else {
            calculateCriticality(units);
        }
    });
    calculateCriticality = unit => {
        const now = new Date();
        if (new Date(unit.available) >= now) {
            unit.occupied = 'occupied';
            unit.occupied_crit = 1;
            unit.enquireEnabled = false;
        } else {
            unit.occupied = 'available';
            unit.occupied_crit = 3;
            unit.enquireEnabled = true;
        }
        unit.price_crit = (unit.price > myProfile.allowance) ? 2 : 0;
    };

    srv.on('enquire', async (req) => {
        const identity = req.params[0];
        const context = {
            "request": {
                "employee": myProfile.id,
                "accommodation": identity.id,
                "date": req.data.movein
            }
        };
        
        const workflow = await cds.connect.to('workflowService')
        const response = await workflow.tx(req).post('/v1/workflow-instances', {
            "definitionId": "approveaccommodation",
            "context": context
        });
    });
};
