#!/usr/bin/env bash

helm upgrade \
  --install \
  tailscale-operator \
  tailscale/tailscale-operator \
  --namespace=tailscale \
  --create-namespace \
  --set-string oauth.clientId=$(cat ~/.ssh/tailscale/oauth | cut -d ' ' -f3 | head -1) \
  --set-string oauth.clientSecret=$(cat ~/.ssh/tailscale/oauth | cut -d ' ' -f3 | tail -1) \
  --set-string apiServerProxyConfig.mode="true" \
  --wait
