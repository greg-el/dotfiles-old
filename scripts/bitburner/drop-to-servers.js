var targetServer = args[0];
var script = "serverHack.script";
var servers = getPurchasedServers();

for (i=0; i<servers.length; i++) {
    var server = servers[i];
    var serverRam = getServerRam(server)[0];
    var scriptRam = getScriptRam(script);
    var threads = Math.floor(serverRam/scriptRam);
    if (fileExists(script)) {
        kill(script, server);
        rm(script, server);
    }
    
    while (scriptRunning(script, server)){
        sleep(6000);
    }
    
    scp(script, server);
    exec(script, server, threads, targetServer);
    tprint(server);    
}