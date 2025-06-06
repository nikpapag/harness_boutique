FROM us-docker.pkg.dev/gar-prod-setup/harness-public/harness/delegate:25.05.85801

#Use root user to install binaries and certs
USER root

#Remove if not needed
RUN microdnf install -y \
unzip \
python3 \
python3-pip \
which

#Install binaries required for chrome
RUN microdnf update && microdnf install -y \
    wget gnupg    \
    dbus-libs           \
    mesa-libgbm         \
    nss                 \
    libXcomposite       \
    libXcursor          \
    libXdamage          \
    libXext             \
    libXfixes           \
    libXi               \
    libX11              \
    libXrandr           \
    libXrender          \
    libXScrnSaver       \
    libXtst             \
    atk                 \
    at-spi2-atk         \
    cairo               \
    pango               \
    gtk3                \
    cups-libs           \
    expat               \
    # Clean up microdnf cache
    && microdnf clean all \
    && rm -rf /var/cache/yum/* /var/tmp/*


#Install Chrome
RUN wget https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/137.0.7151.68/linux64/chromedriver-linux64.zip
RUN unzip chromedriver-linux64.zip
RUN mv chromedriver-linux64/chromedriver /usr/local/bin/

#Install chromedriver for selenium
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
RUN rpm -Uvh --nodeps google-chrome-stable_current_x86_64.rpm

#Install selenium and webdriver
RUN pip3 install selenium webdriver-manager



RUN pip3 install requests
#Install python binaries for python to run 
#Remove if not needed
RUN pip3 install botocore
RUN pip3 install boto3

# Install OpenSSL
RUN microdnf install openssl

#Install Certs (copy folder with all certs to target container)
COPY ./custom-ca /opt/harness-delegate/my-ca-bundle/
RUN bash -c "/opt/harness-delegate/load_certificates.sh /opt/harness-delegate/my-ca-bundle/"



# Install ca-certificates if not already present
RUN microdnf install -y ca-certificates && microdnf clean all
RUN mv /opt/harness-delegate/my-ca-bundle/* /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust extract


#Install the aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN bash -c "./aws/install"
RUN bash -c "aws --version"



# Install Terraform
RUN microdnf install yum && yum install -y yum-utils
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo \
&& microdnf install -y terraform




ENV PATH=/opt/harness-delegate/tools/:$PATH

USER harness
