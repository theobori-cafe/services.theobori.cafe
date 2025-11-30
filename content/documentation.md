---
title: "Documentation"
---

## Détails sur le serveur

Le serveur virtuel privé est hébergé par [Contabo](https://contabo.com) et le nom de domaine [theobori.cafe](https://theobori.cafe) est enregistré chez [OVH](https://www.ovh.com).

Il est équipé de 6 vCPU Cores, 16 GB RAM et 400 GB SSD. La machine sur laquelle repose le serveur virtuel est équipée de CPUs AMD EPYC 7282.

Il fonctionne avec la distribution Linux [Debian 12](https://www.debian.org) (bookworm).

## Sauvegardes et stockage

Un snapshot de la machine virtuelle est réalisé une fois par semaine pour un maximum de deux snapshots au total (rétention de 2 semaines).

Les services et les bases de données sont sauvegardés et archivés journalièrement sur le serveur avec une rétention de 3 jours.

Ces sauvegardes sont copiées sur un disque dur externe (chiffré) personnel une fois par semaine.

{{< note >}}
Une amélioration intéressante serait l'acquisition d'un serveur dédié au stockage des sauvegardes utilisé à travers le standard [Wake-on-LAN](https://fr.wikipedia.org/wiki/Wake-on-LAN).
{{< /note >}}

{{< warning >}}
Comme précisé dans les [CGU](/cgu/#conditions), je vous recommande de toujours faire des sauvegardes de votre côté.
{{< /warning >}}

## Authentification

Un serveur OpenLDAP a été mis en place pour que l'authentification sur les différents services soit gérée par un seul compte utilisateur au lieu d'avoir un compte par service.

## Sécurité

`fail2ban`, `nginx` et `ufw` sont des logiciels installés directement sur le système, ils permettent la sécurisation de l'ensemble des services et de la machine.

La configuration `fail2ban` ([disponible ici](https://git.theobori.cafe/theobori.cafe/ansible-playbook/src/branch/main/roles/security/files/fail2ban/jail.d)) est volontairement très stricte, les services demandant une authentification ont une marge d'erreur de 7 essaies. Au-delà, l'utilisateur se retrouve banni sur l'ensemble des ports du serveur.

Autres points importants:
- Tous les services sont conteneurisés grâce à Docker ([disponibles ici](https://git.theobori.cafe/theobori.cafe/ansible-playbook/src/branch/main/roles)).
- Les mises à jour de sécurité des services sont effectuées le plus rapidement possible après leur parution.
- Aucun outil d'administration installé sur le serveur n'est exposé à Internet.

## Replicabilité et automatismes

Les opérations réalisées sur le serveur ont été automatisées avec Ansible, Terraform et quelques scripts.

Les sources sont ouvertes et disponibles sur la [forge logicielle](https://git.theobori.cafe/theobori.cafe).

## Observabilité

Le système et les conteneurs des services sont surveillés par Grafana couplé à Prometheus. Des alertes Grafana ont été mises en places et me notifient directement lorsqu'il y a un incident.

Une vision global de l'état des services est disponible [sur cette page](https://status.theobori.cafe). Des alertes Uptime Kuma ont été configurées et me notifient quand les services ne sont plus disponible depuis Internet.

## Statistiques utilisateurs

Des rapport d'utilisation des services sont générées hebdomadairement et mensuellement, Ils sont respectivement disponibles sur [cette page](/report/week) et sur [celle-ci](/report/month). 

## Administration

L'administration du serveur est gérée exclusivement par Théo Bori possédant un accès `root`.
