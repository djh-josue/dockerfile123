# study
# VERSION       0.1
# MAINTAINER    kongou_ae

# use RHEL Atomic
FROM fedora

# import RPM key
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-20-x86_64

#Install Packages
#RUN yum update -y systemd.x86_64
#RUN yum update -y iputils.x86_64
#RUN yum update -y

RUN yum install -y passwd openssh openssh-server openssh-clients sudo gcc
RUN yum install -y python-devel
RUN yum install -y make

# SSH setting
RUN mkdir /var/run/sshd
RUN echo 'root:password' |chpasswd
RUN /usr/bin/ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''

# sphinx setting
RUN curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
RUN pip install sphinx
RUN pip install graphviz   
RUN pip install rst2pdf   

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
#CMD /bin/bash