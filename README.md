# Puppet ::netbox Module

[![Puppet Forge](http://img.shields.io/puppetforge/v/jmkeyes/netbox.svg)](https://forge.puppetlabs.com/jmkeyes/netbox)
[![Build Status](https://travis-ci.org/jmkeyes/puppet-netbox.svg?branch=master)](https://travis-ci.org/jmkeyes/puppet-netbox)

#### Table of Contents

 1. [Overview](#overview)
 2. [Description](#description)
 3. [Todo](#todo)

## Overview

This is a Puppet module to manage a DigialOcean Netbox application server.

It currently targets the latest stable release of Puppet, and should support both RedHat and Debian family distributions.

## Description

To use this module, use either an include-like or resource-like declaration:

    # An include-like declaration for Hiera integration.
    include ::netbox

    # A resource-like declaration for manual overrides.
    class { '::netbox': }

This module is intended to work with Puppet 4.x.

## Configuration

All configuration can be handled either through Hiera or by arguments to the `netbox` class.

## Todo

 * TBD. 
