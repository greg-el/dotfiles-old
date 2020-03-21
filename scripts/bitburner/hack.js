var servers = ["foodnstuff", "sigma-cosmetics", "joesguns", "nectar-net",
        "hong-fang-tea", "harakiri-sushi", "neo-net", "CSEC", "zer0", 
        "max-hardware", "iron-gym", "phantasy", "silver-helix", "avmnite-02h",
        "omega-net", "crush-fitness", "johnson-ortho","the-hub", "comptek"
        , "netlink"];

var script = "serverHack.script";
var targetServer = args[0];


function hackServer(servers, script, targetServer) {
    for (i=0; i<servers.length; i++) {
        server = servers[i];
        while (getServerRequiredHackingLevel(server) > getHackingLevel()) {
            tprint("Hacking level for " + server + " not high enough, sleeping.");
            sleep(60000);
        }
        var serverRam = getServerRam(server)[0];
        var scriptRam = getScriptRam(script);
        var ports = getServerNumPortsRequired(server);

        while (!hasRootAccess(server)) {
            openPorts(ports, server);
            ports--;

        }

        if (fileExists(script)) {
            kill(script, server);
        }

        while (scriptRunning(script, server)){
            sleep(6000);
        }

        scp(script, server);
        var threads = Math.floor(serverRam/scriptRam);
        exec(script, server, threads, targetServer);        
        tprint("Hacking server " + server + 
               " | Running script " + script + " on " + threads + " threads");
    }
}

function openPorts(ports, server) {
    switch(ports) {
        case 0: nuke(server); break;
        case 1: brutessh(server); break;
        case 2: ftpcrack(server); break;
        case 3: relaysmtp(server); break;
    }
}


hackServer(servers, script, targetServer);