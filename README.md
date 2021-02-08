# Terraform Agent Snapshot

This repository contains the steps on what is required to consume Terraform Agents.

Terraform Agents run as a process or container on node behind a runtime or as a system service..

The goal of this demo is to perform the follow:

- Stand up agent on Linux node in an `enclave`
- Confirm agent has registered to Agent Portal
- Configure workspace to use agent
- Perform a code change to execute a run
- Validate the change
- Discuss design decisions
