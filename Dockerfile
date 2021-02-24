FROM java:openjdk-8-jdk 
#Add mule runtime in Docker Container ENV MULE_HOME /opt/mule
ENV MULE_HOME /opt/mule
ENV MULE_VERSION=4.2.0
ADD mule-standalone-$MULE_VERSION-hf1.zip /opt 
ADD tcbpoc.jar /opt

RUN set -x \
        && cd /opt \
        && unzip mule-standalone-$MULE_VERSION-hf1.zip \ 
        && mv mule-standalone-$MULE_VERSION-hf1 mule
 
WORKDIR $MULE_HOME
VOLUME $MULE_HOME/apps 
VOLUME $MULE_HOME/conf 
VOLUME $MULE_HOME/domains 
VOLUME $MULE_HOME/logs

# Copy and install license
# CMD echo "------ Copy and install license	"
# COPY	muleLicenseKey.lic $MULE_HOME/conf/
#RUN $MULE_HOME/bin/mule -installLicense $MULE_HOME/conf/muleLicenseKey.lic


#Check if Mule Licence installed #RUN ls -ltr $MULE_HOME/conf/
#CMD echo "------ Licence installed !	"


#Copy and deploy mule application in runtime
CMD echo "------ Deploying mule application in runtime !	"
COPY tcbpoc.jar $MULE_HOME/apps/ 
RUN ls -ltr $MULE_HOME/apps/

# HTTP Service Port
# Expose the necessary port ranges as required by the Mule Apps

EXPOSE	8082-8091
EXPOSE	9000
EXPOSE	9082


# Mule remote debugger EXPOSE	5000
# Mule JMX port (must match Mule config file) EXPOSE	1098
# Mule MMC agent port EXPOSE	7777
# AMC agent port EXPOSE	9997
# Start Mule runtime


# Start Mule runtime
CMD echo "------ Start Mule runtime	"
ENTRYPOINT ["./bin/mule"]
