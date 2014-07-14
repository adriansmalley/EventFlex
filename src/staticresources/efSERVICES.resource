eventFlex.service('efSERVICES', function(){
         return{
            getAllEvents : function(callback){
             	var data = new SObjectModel.evt();
               // var whereOb = { where : {OwnerId : {eq:uId}}};
               
                data.retrieve({},function(err, records){
                    //if failure
                    if(err) alert(err.message);
                    else {
                        console.debug(records);
                        callback(records);       
                    }
                });
            },
            getSessionsForEvent : function(eventId, callback){
            	var data = new SObjectModel.session();
            	var whereOb = { where : {Event__c : {eq:eventId}}};

            	data.retrieve(whereOb,function(err, records){
                    //if failure
                    if(err) alert(err.message);
                    else {
                        console.debug(records);
                        callback(records);       
                    }
                });
            }
         }
       });