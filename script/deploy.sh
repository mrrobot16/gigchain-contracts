#!/bin/bash
# Below script is to define environment variables used inside this script.
. ./script/env.sh

# NOTE: Below is a working example of ```forge create``` command. 
# Such command below is to unsure our Foundry config is working as expected.

forge create Counter --rpc-url=$RPC_URL --private-key=$PRIVATE_KEY

# TODO: Need figure out how to pass an array of strings as an argument for --constructor-args.
# forge create OrganizationV1 --rpc-url=$RPC_URL --private-key=$PRIVATE_KEY --constructor-args MyOrganizationV0 [`0x5Db06acd673531218B10430bA6dE9b69913Ad545`, `0x11bb17983E193A3cB0691505232331634B8FCa01`]