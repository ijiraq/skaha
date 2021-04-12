# skaha - A Container-based Science Platform in CANFAR

#### Table of contents
  * [Overview](#overview)
  * [System Components](#system-components)
  * [Session Containers](#session-containers)
  * [Software Containers](#software-containers)
  * [Dependencies](#dependencies)
  * [Deployment](#deployment)

## Overview
skaha is a general purpose online platform for running science containers interactively.  It is part of the CANFAR science platform for containers.  In the architecture diagram below, skaha is the main API to the Science Platform.

![canfar-architecture](canfar-platform-architecture-0.2.png)

skaha in the CANFAR Science Platform Architecture

The implementation of some parts of this architecture is ongoing.

![skaha-architecture](skaha-architecture-0.2.png)

Skaha architecture

## System Components

Components of skaha are containers that can be scaled out on a cluster of nodes to meet the storage and processing demands of the scientific software containers.

### skaha
The skaha module provides the API for:
- Listing published container images that the calling user is allowed to run
- Creating skaha sessions from published container images
- Launching container images to be displayed in desktop sessions

The complete API of skaha can be viewed here: ![skaha-api][https://ws-uv.canfar.net/skaha]

### skaha-wsproxy
skaha-wsproxy is an apache httpd container that proxies traffic to session containers.

## Session Containers

Session containers are HTML5/websocket applications that can run in shaka.  Currently this consists of Jupyter Labs, CARTA Visualization, and NoVNC desktops.  More information on session containers and how they can be used in skaha can be found in the [Skaha Containers](skaha-containers) directory.

## Software Containers

These are some of the astronomy science containers that have been built for skaha.  They run as applications within skaha.  The graphical aspects of the containers are displayed in skaha-desktop by sending the DISPLAY to skaha-desktop.

More information on software containers can be found in the [Skaha Containers](skaha-containers) directory.

## Dependencies

skaha relies on a number of other opencadc modules to operate.
* registry (reg) web service (https://github.com/opencadc/reg) -- A registry service will be used to read the capabilities and locations of other web services used by skaha.
* access control (ac) web service (https://github.com/opencadc/ac) -- If the IdentityManager implementation is configured to use cadc-access-control-server for authentication an operational ac web service is required to be running.
* credential delegation (cdp) web service (https://github.com/opencadc/cdp) -- The cdp service is used to obtain users' delegated proxy certificates.
* cavern -- skaha is complimented by having the cavern VOSpace implementation mounted as a shared POSIX file system.  (https://github.com/opencadc/vos/tree/master/cavern).  cavern is a vospace implementation where both the data and metadata are based on the contents of a file system.  If the software-containers have access to the cavern file system the contents of that file system can be accessed and shared through the cavern web service.
* posix/sssd -- Containers in skaha are always run _as the user_ and with the users' group memberships.  If skaha-desktop and software-containers are run with a SSSD configuration that points to the same LDAP instance as used by ac, the names of those uids and gids can be resolved.

## Deployment
The current implementation targets a Kubernetes deployment.

On session and application launch, skaha will interact with kubernetes to manifest these entities.  Two kubernetes configuration files are required for these operations.  Examples of these files can be found in skaha/src/examples.  The variables in these files are replaced by skaha at runtime.

