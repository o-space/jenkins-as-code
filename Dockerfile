FROM jenkins/jenkins:lts

ARG WORKDIR=/usr/share/jenkins
WORKDIR ${WORKDIR}

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY jenkins/config.yml ${WORKDIR}/jenkins.yaml
ENV CASC_JENKINS_CONFIG=${WORKDIR}/jenkins.yaml

COPY jenkins/plugins.txt ${WORKDIR}/plugins.txt
RUN /usr/local/bin/install-plugins.sh < ${WORKDIR}/plugins.txt

EXPOSE 8080 ${SLAVE_PORT}
