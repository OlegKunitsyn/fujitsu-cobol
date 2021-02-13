# Fujitsu Cobol 3.0, June 1997, Serial: 103-2001-1699-03811-10092
# Source: https://archive.org/details/FujitsuCobol3 
# Build: docker build --tag olegkunitsyn/fujitsu-cobol:3.0 .
# Publish: docker push olegkunitsyn/fujitsu-cobol:3.0
FROM solarkennedy/wine-x11-novnc-docker
COPY ./FSC /root/prefix32/drive_c/FSC
WORKDIR /root/prefix32/drive_c/src

