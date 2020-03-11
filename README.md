# arcade
Interactive Science Platform for ALMA processing

## Overview
Arcade is a general purpose science platform built to support ALMA processing requirements.  It allows users to visually interact with docker containers that have been built for specialized tasks.

Because all components of arcade are containers, they can be scaled out on a cluster of nodes to meet the storage and processing demands of the scientific software containers.

## Components

### arcade
The arcade module provides the API for creating arcade sessions and launching applications within that session.  It is a Java war file running in tomcat 8 in a container.

### arcade-wsproxy
arcade-wsproxy is an apache httpd container whose job is to proxy NoVNC traffic to the containers running NoVNC sessions.

### arcade-desktop
arcade-desktop is a container representing an arcade session.  It is a NoVNC implementation, forked and modified from the ConSol project:  https://github.com/ConSol/docker-headless-vnc-container.
The current implementation of arcade-desktop as a NoVNC container will be replaced with another technology at some point.

## software-containers
These are some of the astronomy science containers that have been built for arcade.  They run as applications within arcade.  The graphical aspects of the containers are displayed in arcade-desktop by sending the DISPLAY to arcade-desktop.

## Deployment
The current implementation targets a Kubernetes deployment.  In the arcade/src/obsolete directory is a version which targets a Docker deployment.  This is no longer supported.

On session and application launch, arcade will interact with kubernetes to manifest these entities.  Two kubernetes configuration files are required for these operations.  Examples of these files can be found in arcade/src/examples.  The variables in these files are replaced by arcade at runtime.