FROM centos:centos7

# Prepare StarRocks Installer.
RUN yum -y install wget
RUN mkdir -p /data/deploy/
# RUN wget -SO /data/deploy/StarRocks-x.x.x.tar.gz <url_to_download_specific_ver_of_starrocks>
RUN wget -SO /data/deploy/StarRocks-2.5.5.tar.gz https://releases.starrocks.io/starrocks/StarRocks-2.5.5.tar.gz
# COPY StarRocks-2.3.3.tar.gz /data/deploy/StarRocks.tar.gz
RUN cd /data/deploy/ && tar zxf StarRocks-2.5.5.tar.gz && mv StarRocks-2.5.5 starrocks
RUN rm /data/deploy/StarRocks-2.5.5.tar.gz

# Install Java JDK.
RUN yum -y install java-1.8.0-openjdk-devel.x86_64
RUN rpm -ql java-1.8.0-openjdk-devel.x86_64 | grep bin$
RUN java -version

# Create directory for FE meta and BE storage in StarRocks.
RUN mkdir -p /data/deploy/starrocks/fe/meta
RUN jps
RUN mkdir -p /data/deploy/starrocks/be/storage

# Install relevant tools.
RUN yum -y install mysql net-tools telnet

# Run Setup script.
COPY run_script.sh /data/deploy/run_script.sh
RUN chmod +x /data/deploy/run_script.sh
CMD /data/deploy/run_script.sh