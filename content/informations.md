---
title: "Informations"
---

## Hébergement

Le serveur virtuel privé est hébergé par [Contabo](https://contabo.com). Il est équipé de 6 vCPU Cores, 16 GB RAM et 400 GB SSD. La machine sur laquelle repose le serveur virtuel est équipée de CPUs AMD EPYC 7282.

Il fonctionne avec la distribution Linux [Debian 12](https://www.debian.org).

## Sauvegardes et stockage

Un snapshot de la machine virtuelle est réalisé une fois par semaine pour un maximum de deux snapshots au total.

Les services et les bases de données sont sauvegardés et archivés journalièrement sur le serveur avec une retention de 3 jours.

Ces sauvegardes sont copiées sur un disque dur externe (chiffré) personnel une fois par semaine.

{{< note >}}
Une potentielle future amélioration serait d'avoir un serveur dédié au stockage de ces sauvegardes utilisé à travers le standard [Wake-on-LAN](https://fr.wikipedia.org/wiki/Wake-on-LAN).
{{< /note >}}

## Authentification

Un serveur OpenLDAP a été mis en place pour que l'authentification des différents services soit gérée par un seul compte utilisateur au lieu d'avoir un compte par service.

## Sécurité

`fail2ban`, `nginx` et `ufw` sont des logiciels installés directement sur le système, ils permettent la sécurisation de l'ensemble des services et de la machine.

La configuration `fail2ban` ([disponible ici](https://git.theobori.cafe/theobori.cafe/ansible-playbook/src/branch/main/roles/security/files/fail2ban/jail.d)) est volontairement très stricte, les services demandant une authentification ont une marge d'erreur de 7 essaies. Au-delà, l'utilisateur se retrouvent banni sur l'ensemble des ports du serveur.

Tous les services sont conteuneurisés et isolés grâce à Docker.

Les mises à jour de sécurité des services sont effectuées le plus tôt possible après leur parution.

Aucun outil d'administration installé sur le serveur n'est exposé à Internet.

## Replicabilité et automatismes

Les opérations réalisées sur le serveur ont été automatisées avec un notebook Ansible et des fichiers de configuration Terraform.

Les sources sont ouvertes et disponibles sur la [forge logicielle](https://git.theobori.cafe/theobori.cafe).

## Observabilité

Le système et les conteneurs des services sont surveillés par Grafana couplé à Prometheus. Des alertes Grafana ont été mises en places et me sont notifiés directement lorsqu'il y a un incident.

Un vision global du status des services est disponible [sur cette page](https://status.theobori.cafe) gérée par Uptime Kuma. Des alertes ont été configurées et me notifient quand les services ne sont plus disponible depuis Internet.

## Administration

L'administration du serveur est gérée activement et entièrement par Théo Bori.
