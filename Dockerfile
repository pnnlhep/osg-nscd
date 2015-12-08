FROM kfox1111/osg-base
MAINTAINER Kevin Fox "Kevin.Fox@pnnl.gov"

RUN yum install -y nscd nss-pam-ldapd

RUN useradd -r -g condor -d /var/lib/condor -s /sbin/nologin \
    -c "Owner of HTCondor Daemons" condor
RUN groupadd -r condor

ADD ./start.sh /etc/start.sh
RUN chmod +x /etc/start.sh

CMD ["/etc/start.sh"]
