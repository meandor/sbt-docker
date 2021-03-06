FROM adoptopenjdk:15-jdk-hotspot
RUN apt-get update && apt-get install -y gnupg2
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
RUN apt-get update && apt-get install -y sbt
RUN apt-get update && apt-get install -y sbt && apt-get clean && apt-get autoclean -y
RUN cd /tmp && sbt sbtVersion
CMD ["/bin/bash"]
