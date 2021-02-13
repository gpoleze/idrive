  
FROM ubuntu

WORKDIR /opt/idrive

# Preparing the Environment
RUN apt-get update && \
    apt-get install -y \
    unzip \
    curl \
    libfile-spec-native-perl \
    python3 \
    vim \
    iproute2

# Installing idrive
RUN curl -O https://www.idrivedownloads.com/downloads/linux/download-for-linux/IDrive_Scripts/IDriveForLinux.zip && \
    unzip IDriveForLinux.zip && \
    rm IDriveForLinux.zip &&\
    mv -v IDriveForLinux/scripts/* . &&\
    rmdir -p IDriveForLinux/scripts && \
    chmod a+x *.pl

ENTRYPOINT [ "/bin/bash" ]