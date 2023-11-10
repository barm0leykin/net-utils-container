#!/bin/bash

# cat /etc/resolv.conf

echo "nslookup:"
nslookup kubernetes.default
nslookup kube-dns.kube-system

echo "check nodelocaldns:"
echo "dig @169.254.20.10 kubernetes.default.svc.cluster.local +short :"
dig @169.254.20.10 kubernetes.default.svc.cluster.local +short

echo "check coredns:"
echo "dig @10.96.0.10 kubernetes.default.svc.cluster.local +short :"
dig @10.96.0.10 kubernetes.default.svc.cluster.local +short
