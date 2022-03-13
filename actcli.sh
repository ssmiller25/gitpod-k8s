#!/bin/bash

# Simple wrapper around act

act --dryrun -j docker -s QUAY_USERNAME -s QUAY_PASSWORD -s GITHUB_TOKEN
