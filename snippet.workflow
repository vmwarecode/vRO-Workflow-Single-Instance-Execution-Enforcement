
try{
	var thisWf = workflow.rootWorkflow;
	var tokens = new Array();
	tokens = thisWf.executions;
	var alreadyRunning = false;
	var runningCount = 0;
	
	for each (var token in tokens){
	//System.log("Token: "+token+" :: "+token.state);
		if (token.state == "running" || token.state == "waiting-signal" ){
			runningCount = runningCount + 1;
		}
	}
	if (runningCount > 1){
		alreadyRunning = true;
		System.log("Instance already running....exiting!");
	} else {
		System.log("No other instances found. Continuing...")
	}
} catch (error){
	System.log("Caught error: " + error + ". Assume workflow is running...");
	alreadyRunning = true;
}
return alreadyRunning;