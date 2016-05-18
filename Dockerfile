FROM btooncall/centos7:devel

RUN mkdir -p /opt/ 2>/dev/null; 
WORKDIR /opt/

ADD response.varfile /opt/response.varfile

RUN wget https://intergral-dl.s3.amazonaws.com/FR/FusionReactor-6.1.2/FusionReactor_linux-x64_6_1_2.sh \
      && sh /opt/FusionReactor_linux-x64_6_1_2.sh -q -varfile response.varfile \
      && rm -f /opt/FusionReactor_linux-x64_6_1_2.sh \
      && rm -f /opt/response.varfile
      
EXPOSE 8087

WORKDIR /opt/fusionreactor

ENTRYPOINT [ "./start.sh" ]
