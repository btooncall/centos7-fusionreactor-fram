#!/bin/bash

if [ ! -z "${FRLICENSE}" ]; then 
      license=" -Dfrlicense=${FRLICENSE} "
fi



/opt/fusionreactor/jre/bin/java -Dinstall4j.jvmDir=/opt/fusionreactor/jre -Dexe4j.moduleName=/opt/fusionreactor/instance/FRAM/framd \
      -Dinstall4j.launcherId=63 -Dinstall4j.swt=false -Di4jv=0 -javaagent:/opt/fusionreactor/instance/FRAM/fusionreactor.jar=name=FRAM,address=:8087 \
      -Dfrnopointcuts -Dfrstartupdelay=0 -Djava.awt.headless=true -Xmx64m -Di4j.vpt=true $license \
      -classpath /opt/fusionreactor/.install4j/i4jruntime.jar:/opt/fusionreactor/instance/FRAM/fusionreactor.jar \
      com.install4j.runtime.launcher.UnixLauncher start fabb687d  /opt/fusionreactor/instance/FRAM/framd.log /opt/fusionreactor/instance/FRAM/framd.log \
      com.intergral.fusionreactor.agent.service.Service 
