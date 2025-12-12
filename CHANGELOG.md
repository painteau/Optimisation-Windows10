# Changelog

Toutes les modifications notables apportées à ce projet seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/).

---

## [Enhanced Edition] - 2024-12-12

### 📦 Ajouts

#### Documentation
- ✨ **README.fr.md** - Documentation complète en français
  - Guide détaillé d'utilisation
  - Exemples concrets
  - Tableaux de comparaison
  - Avertissements de sécurité explicites
  - FAQ enrichie

#### Nouveaux Presets
- ✨ **Gaming.preset** - Configuration optimisée pour les performances gaming
  - Latence réseau minimale
  - Optimisations SSD
  - Performances maximales
  - ⚠️ Sécurité réduite (Defender/Firewall désactivés)

- ✨ **Privacy.preset** - Configuration axée sur la confidentialité
  - Protection maximale de la vie privée
  - Télémétrie complètement désactivée
  - Sécurité maintenue
  - OneDrive désinstallé

- ✨ **Balanced.preset** - Configuration équilibrée (recommandée)
  - Bon compromis privacy/performance/sécurité
  - Sécurité maintenue
  - Mises à jour activées
  - Idéal pour usage quotidien

#### Outils de Sauvegarde/Restauration
- ✨ **Backup-Settings.ps1** - Script de sauvegarde complet
  - Export des clés de registre critiques
  - Sauvegarde de la liste des applications
  - Sauvegarde de l'état des services
  - Création de point de restauration système

- ✨ **Restore-Settings.ps1** - Script de restauration
  - Interface interactive
  - Sélection de sauvegarde
  - Point de restauration de sécurité
  - Import automatique des clés de registre

- ✨ **Fichiers .cmd** - Lanceurs simplifiés
  - `Backup.cmd` - Lancement rapide de la sauvegarde
  - `Restore.cmd` - Lancement rapide de la restauration
  - `Gaming.cmd` - Lancement du preset Gaming
  - `Privacy.cmd` - Lancement du preset Privacy
  - `Balanced.cmd` - Lancement du preset Balanced

#### Documentation Supplémentaire
- ✨ **presets/README.md** - Guide des presets
  - Description détaillée de chaque preset
  - Tableau comparatif
  - Instructions de personnalisation
  - Recommandations de sécurité

- ✨ **tools/README.md** - Guide des outils
  - Documentation des scripts de backup/restore
  - Processus recommandé
  - Structure des sauvegardes
  - Utilisation avancée

### 📂 Nouvelle Structure

```
Optimisation-Windows10/
├── Win10.ps1                    # Script principal (inchangé)
├── Win10.psm1                   # Bibliothèque de tweaks (inchangé)
├── Default.cmd                  # Lanceur par défaut (inchangé)
├── Default.preset               # Preset par défaut (inchangé)
├── README.md                    # Documentation originale (inchangé)
├── README.fr.md                 # 📄 Nouvelle documentation FR
├── CHANGELOG.md                 # 📄 Ce fichier
├── LICENSE                      # Licence MIT (inchangé)
│
├── presets/                     # 📁 Nouveau dossier
│   ├── README.md                # Guide des presets
│   ├── Gaming.preset            # Preset gaming
│   ├── Gaming.cmd               # Lanceur gaming
│   ├── Privacy.preset           # Preset confidentialité
│   ├── Privacy.cmd              # Lanceur confidentialité
│   ├── Balanced.preset          # Preset équilibré
│   └── Balanced.cmd             # Lanceur équilibré
│
├── tools/                       # 📁 Nouveau dossier
│   ├── README.md                # Guide des outils
│   ├── Backup-Settings.ps1      # Script de sauvegarde
│   ├── Backup.cmd               # Lanceur de sauvegarde
│   ├── Restore-Settings.ps1     # Script de restauration
│   └── Restore.cmd              # Lanceur de restauration
│
└── backups/                     # 📁 Créé automatiquement
    └── Backup_YYYY-MM-DD_HH-MM-SS/
        ├── README.txt           # Infos sur la sauvegarde
        ├── SystemInfo.json      # Informations système
        ├── InstalledApps.csv    # Liste des apps
        ├── ServicesStatus.csv   # État des services
        └── *.reg                # Clés de registre exportées
```

### 🔄 Améliorations

#### Sécurité
- ⚠️ **Avertissements explicites** sur les risques liés à la désactivation de Defender/Firewall
- ✅ Nouveau preset "Balanced" qui maintient la sécurité activée
- ✅ Système de sauvegarde/restauration pour récupération rapide
- ✅ Points de restauration système automatiques

#### Facilité d'utilisation
- 📱 Fichiers .cmd pour lancement en un clic
- 📋 Documentation en français détaillée
- 🎯 Presets thématiques pour différents cas d'usage
- 🔍 Tableaux comparatifs pour choisir le bon preset

#### Maintenabilité
- 📁 Organisation en dossiers thématiques
- 📝 Documentation séparée par fonctionnalité
- 🔖 CHANGELOG pour suivre les modifications
- 📚 READMEs contextuels dans chaque dossier

### 🎨 Caractéristiques des Presets

| Caractéristique | Gaming | Privacy | Balanced |
|-----------------|--------|---------|----------|
| **Objectif** | Performances max | Confidentialité max | Équilibre |
| **Defender** | ❌ Désactivé | ✅ Activé | ✅ Activé |
| **Firewall** | ❌ Désactivé | ✅ Activé | ✅ Activé |
| **Télémétrie** | ❌ Désactivée | ❌ Désactivée | ❌ Désactivée |
| **OneDrive** | ⚠️ Activé | ❌ Désinstallé | ⚠️ Activé |
| **Xbox** | ✅ Activé | ❌ Désactivé | ❌ Désactivé |
| **MAJ Auto** | ❌ Désactivées | ⚠️ Partielles | ✅ Activées |
| **Niveau sécurité** | 🔴 Faible | 🟢 Élevé | 🟡 Moyen |

### 📖 Documentation

#### README.fr.md comprend :
- Table des matières interactive
- Description détaillée du projet
- Guide d'installation pas à pas
- Exemples d'utilisation avancée
- Création de presets personnalisés
- Catégories de tweaks avec tableaux
- Presets disponibles avec descriptions
- Avertissements de sécurité explicites
- FAQ enrichie
- Tableau des versions Windows
- Guide de contribution
- Ressources et liens utiles

### 🛡️ Sécurité

#### Améliorations de sécurité
- ✅ Documentation claire des risques
- ✅ Preset "Balanced" sécurisé par défaut
- ✅ Système de backup avant modifications
- ✅ Points de restauration automatiques
- ✅ Avertissements visibles dans les .cmd

#### Recommandations ajoutées
- 💡 Installer un antivirus tiers si Defender désactivé
- 💡 Utiliser un routeur avec pare-feu si Firewall désactivé
- 💡 Tester les changements dans un environnement sûr
- 💡 Conserver plusieurs sauvegardes

### 🎯 Cas d'usage

#### Gaming.preset
**Pour :** Joueurs compétitifs cherchant performances maximales
**Avantages :**
- Latence minimale
- Performances optimales
- Ressources système libérées
**Inconvénients :**
- Sécurité réduite
- Nécessite antivirus tiers
- Nécessite routeur avec pare-feu

#### Privacy.preset
**Pour :** Utilisateurs soucieux de confidentialité
**Avantages :**
- Protection vie privée maximale
- Sécurité maintenue
- Télémétrie désactivée
**Inconvénients :**
- OneDrive désinstallé
- Caméra/micro désactivés
- Partage réseau limité

#### Balanced.preset
**Pour :** Usage quotidien, bureautique, multimédia
**Avantages :**
- Compromis optimal
- Sécurité maintenue
- Mises à jour automatiques
- Configuration stable
**Inconvénients :**
- Moins de performances que Gaming
- Moins de privacy que Privacy

### 🔧 Outils Backup/Restore

#### Backup-Settings.ps1 sauvegarde :
- ✅ Clés de registre critiques (privacy, defender, network, etc.)
- ✅ Liste des applications installées
- ✅ État et configuration des services
- ✅ Informations système complètes
- ✅ Point de restauration système
- ✅ README de la sauvegarde

#### Restore-Settings.ps1 permet de :
- ✅ Lister toutes les sauvegardes disponibles
- ✅ Afficher les informations de chaque sauvegarde
- ✅ Créer un point de sécurité avant restauration
- ✅ Restaurer les clés de registre
- ✅ Redémarrer automatiquement si souhaité

### 📝 Notes de migration

#### Pour les utilisateurs existants

Si vous utilisez déjà le script original :

1. **Sauvegardez votre configuration actuelle**
   ```cmd
   cd tools
   Backup.cmd
   ```

2. **Votre ancien Default.preset reste intact**
   - Vous pouvez continuer à l'utiliser
   - Les nouveaux presets sont des alternatives

3. **Pour tester un nouveau preset**
   ```cmd
   cd presets
   Balanced.cmd
   ```

4. **Pour revenir en arrière**
   ```cmd
   cd tools
   Restore.cmd
   ```

#### Compatibilité

- ✅ 100% compatible avec l'original
- ✅ Aucune modification des fichiers existants
- ✅ Ajouts uniquement dans nouveaux dossiers
- ✅ Peut coexister avec configurations existantes

### 🙏 Remerciements

- **Disassembler** - Auteur original du Win10-Initial-Setup-Script
- La communauté open-source pour les contributions continues

### 📜 Licence

Cette version améliorée conserve la licence **MIT** de l'original.

---

## [3.10] - 2020-07-15 (Version originale)

Version originale par Disassembler.
Voir [README.md](README.md) pour l'historique complet.

---

**Format du changelog :**
- ✨ Nouveauté
- 🔄 Modification
- 🐛 Correction de bug
- 🔒 Sécurité
- 📝 Documentation
- ⚠️ Dépréciation
- 🗑️ Suppression
