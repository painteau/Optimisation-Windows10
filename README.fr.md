# 🚀 Script d'Optimisation Windows 10 / Server 2016 / 2019

> **Version :** 3.10 | **Date :** 2020-07-15
> **Auteur :** Disassembler <disassembler@dasm.cz>
> **Source originale :** [Win10-Initial-Setup-Script](https://github.com/Disassembler0/Win10-Initial-Setup-Script)

## 📖 Table des matières

- [Description](#-description)
- [Fonctionnalités principales](#-fonctionnalités-principales)
- [Installation rapide](#-installation-rapide)
- [Utilisation avancée](#-utilisation-avancée)
- [Catégories de tweaks](#-catégories-de-tweaks)
- [Presets disponibles](#-presets-disponibles)
- [Avertissements de sécurité](#-avertissements-de-sécurité)
- [FAQ](#-faq)
- [Contribution](#-contribution)

---

## 📝 Description

Ce script PowerShell automatise l'optimisation et la configuration de Windows 10 et Windows Server 2016/2019 après une installation fraîche. Il permet de :

- ✅ **Améliorer la confidentialité** en désactivant la télémétrie
- ✅ **Optimiser les performances** pour le gaming et l'utilisation générale
- ✅ **Personnaliser l'interface** selon vos préférences
- ✅ **Désinstaller les bloatwares** préinstallés
- ✅ **Configurer le réseau** pour de meilleures performances

**Important :** Ce script n'est pas un outil "anti-espionnage" complet mais plutôt un ensemble de réglages personnels pour un système moins intrusif et plus performant.

---

## 🎯 Fonctionnalités principales

### Confidentialité & Vie privée
- Désactivation de la télémétrie Windows
- Suppression de Cortana et recherches Bing
- Désactivation de la localisation
- Blocage des publicités ciblées Microsoft
- Désactivation de l'historique des activités

### Performance & Gaming
- Désactivation de Windows Defender (⚠️ attention)
- Optimisation réseau (désactivation IPv6, NetBIOS)
- Désactivation de l'indexation (SSD)
- Suppression de Superfetch
- Optimisations visuelles

### Interface utilisateur
- Mode sombre par défaut
- Personnalisation de l'Explorateur Windows
- Suppression des animations inutiles
- Configuration de la barre des tâches

### Nettoyage système
- Désinstallation des applications préinstallées
- Suppression de OneDrive (optionnel)
- Désinstallation des bloatwares tiers

---

## 🚀 Installation rapide

### Méthode 1 : Fichier CMD (Recommandé pour débutants)

1. Téléchargez la [dernière version](https://github.com/Disassembler0/Win10-Initial-Setup-Script/releases)
2. Extrayez l'archive
3. **Faites un clic droit** sur `Default.cmd` → **Exécuter en tant qu'administrateur**
4. Confirmez l'invite UAC
5. Attendez la fin de l'exécution

### Méthode 2 : PowerShell (Pour utilisateurs avancés)

```powershell
# Naviguer vers le dossier du script
cd C:\chemin\vers\le\script

# Exécuter avec le preset par défaut
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 -include Win10.psm1 -preset Default.preset
```

---

## 🔧 Utilisation avancée

### Syntaxe complète

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 `
    [-include filename] `
    [-preset filename] `
    [-log logname] `
    [[!]tweakname]
```

### Paramètres

| Paramètre | Description |
|-----------|-------------|
| `-include filename` | Charge un module avec vos tweaks personnalisés |
| `-preset filename` | Charge un fichier preset avec les tweaks à appliquer |
| `-log logname` | Enregistre la sortie dans un fichier log |
| `tweakname` | Applique un tweak spécifique |
| `!tweakname` | Exclut un tweak de la sélection |

### Exemples d'utilisation

#### Exemple 1 : Appliquer uniquement certains tweaks

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 `
    -include Win10.psm1 `
    EnableFirewall EnableDefender DisableTelemetry
```

#### Exemple 2 : Utiliser un preset personnalisé

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 `
    -include Win10.psm1 `
    -preset Gaming.preset `
    -log optimisation.log
```

#### Exemple 3 : Preset avec exclusions

```powershell
# Appliquer le preset par défaut SAUF DisableDefender et DisableFirewall
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 `
    -include Win10.psm1 `
    -preset Default.preset `
    !DisableDefender !DisableFirewall
```

### Créer votre propre preset

Créez un fichier texte (ex: `MonPreset.txt`) avec un nom de fonction par ligne :

```
# Sécurité de base
RequireAdmin
EnableFirewall
EnableDefender

# Optimisations UI
ShowKnownExtensions
ShowHiddenFiles
EnableDarkMode

# Nettoyage
UninstallMsftBloat
DisableTelemetry
```

Puis exécutez :

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 `
    -include Win10.psm1 `
    -preset MonPreset.txt
```

---

## 📂 Catégories de tweaks

### 🔒 Confidentialité (Privacy)
| Fonction | Description |
|----------|-------------|
| `DisableTelemetry` | Désactive la télémétrie Windows |
| `DisableCortana` | Désactive Cortana |
| `DisableWebSearch` | Supprime les recherches Bing du menu démarrer |
| `DisableLocation` | Désactive la localisation |
| `DisableAdvertisingID` | Désactive l'ID publicitaire |
| `DisableActivityHistory` | Désactive l'historique des activités |

### 🛡️ Sécurité (Security)
| Fonction | Description | ⚠️ Attention |
|----------|-------------|--------------|
| `EnableFirewall` / `DisableFirewall` | Active/Désactive le pare-feu | Risque sécurité |
| `EnableDefender` / `DisableDefender` | Active/Désactive Windows Defender | Risque sécurité |
| `SetUACLow` / `SetUACHigh` | Niveau UAC bas/élevé | |
| `EnableDefenderCloud` | Active la protection cloud de Defender | |

### 🌐 Réseau (Network)
| Fonction | Description |
|----------|-------------|
| `DisableIPv6` | Désactive IPv6 (réduit latence) |
| `DisableNetBIOS` | Désactive NetBIOS (réduit latence) |
| `EnableSMB1` / `DisableSMB1` | Active/Désactive SMB 1.0 |
| `SetCurrentNetworkPrivate` | Passe le réseau en mode privé |
| `EnableQoS` | Active le Quality of Service |

### ⚡ Services & Performance
| Fonction | Description |
|----------|-------------|
| `DisableSuperfetch` | Désactive Superfetch (inutile sur SSD) |
| `DisableIndexing` | Désactive l'indexation (SSD) |
| `DisableHibernation` | Désactive la veille prolongée |
| `DisableFastStartup` | Désactive le démarrage rapide |
| `EnableStorageSense` | Active le nettoyage automatique |

### 🎨 Interface utilisateur (UI)
| Fonction | Description |
|----------|-------------|
| `SetAppsDarkMode` | Active le mode sombre |
| `DisableActionCenter` | Désactive le centre de notifications |
| `ShowKnownExtensions` | Affiche les extensions de fichiers |
| `ShowTaskManagerDetails` | Gestionnaire de tâches détaillé |
| `DisableAeroShake` | Désactive le "secouer pour réduire" |

### 📦 Applications
| Fonction | Description |
|----------|-------------|
| `UninstallMsftBloat` | Désinstalle les apps Microsoft préinstallées |
| `UninstallThirdPartyBloat` | Désinstalle les bloatwares tiers |
| `DisableOneDrive` / `UninstallOneDrive` | Désactive/Supprime OneDrive |
| `UninstallInternetExplorer` | Désinstalle Internet Explorer |

---

## 📋 Presets disponibles

### Default.preset
Configuration complète orientée **performance gaming** et **confidentialité maximale**.

**Inclut :**
- ✅ Désactivation télémétrie complète
- ✅ Désactivation Defender et Firewall (⚠️)
- ✅ Optimisations réseau gaming
- ✅ Désinstallation bloatwares
- ✅ Mode sombre
- ✅ Optimisations SSD

**À éviter si :**
- Vous avez besoin de Windows Defender
- Vous utilisez OneDrive
- Vous travaillez en entreprise

---

## ⚠️ Avertissements de sécurité

### 🔴 CRITIQUE - Lisez attentivement

#### Le preset par défaut DÉSACTIVE :
- ❌ **Windows Defender** → Installez un antivirus tiers !
- ❌ **Pare-feu Windows** → Votre PC est exposé !
- ❌ **SmartScreen** → Moins de protection web
- ❌ **Rapports d'erreurs** → Difficile de diagnostiquer problèmes

#### Recommandations de sécurité

Si vous souhaitez plus de sécurité, **commentez** ces lignes dans votre preset :

```
# DisableDefender              # ← Laissez Defender activé
# DisableFirewall              # ← Laissez le pare-feu activé
# DisableSmartScreen           # ← Gardez SmartScreen
```

Ou créez un preset "sécurisé" :

```powershell
# Preset sécurisé
RequireAdmin
EnableFirewall
EnableDefender
EnableDefenderCloud
SetUACHigh
DisableTelemetry
UninstallMsftBloat
```

---

## ❓ FAQ

### Puis-je exécuter le script en toute sécurité ?

**NON**, pas sans comprendre ce qu'il fait ! Certaines fonctions :
- Réduisent la sécurité
- Désinstallent des applications
- Modifient des paramètres système critiques

**Lisez le code** ou au minimum le fichier preset avant d'exécuter.

### Puis-je exécuter le script plusieurs fois ?

**OUI** ! Le script est idempotent. C'est même recommandé après les grosses mises à jour Windows qui réinitialisent certains paramètres.

### Comment annuler les changements ?

Chaque fonction a sa contrepartie inverse. Par exemple :
- `DisableTelemetry` ↔️ `EnableTelemetry`
- `DisableDefender` ↔️ `EnableDefender`

Créez un preset avec les fonctions inverses et exécutez-le.

### Quelles versions de Windows sont supportées ?

- ✅ Windows 10 (64-bit, Semi-Annual Channel)
- ✅ Windows Server 2016
- ✅ Windows Server 2019
- ✅ LTSB/LTSC (avec preset personnalisé)
- ❌ Windows 7, 8, 8.1 (non supportés)

### Le script fonctionne-t-il en environnement multi-utilisateurs ?

Partiellement. Certains tweaks (surtout UI) s'appliquent uniquement à l'utilisateur actuel. Vous devrez exécuter le script pour chaque utilisateur.

### Puis-je utiliser ce script en entreprise ?

À vos risques. Beaucoup de tweaks interfèrent avec :
- Les Group Policy Organizations (GPO)
- Microsoft Intune
- Windows Update for Business
- Les domaines Active Directory

### Le script a cassé quelque chose, que faire ?

1. Identifiez la fonction problématique dans les logs
2. Exécutez la fonction inverse
3. Redémarrez le PC
4. Si le problème persiste, utilisez un point de restauration

---

## 🔄 Versions de Windows 10

| Version | Nom de code | Nom marketing | Build |
|---------|-------------|---------------|-------|
| 1507 | Threshold 1 (RTM) | N/A | 10240 |
| 1511 | Threshold 2 | November Update | 10586 |
| 1607 | Redstone 1 | Anniversary Update | 14393 |
| 1703 | Redstone 2 | Creators Update | 15063 |
| 1709 | Redstone 3 | Fall Creators Update | 16299 |
| 1803 | Redstone 4 | April 2018 Update | 17134 |
| 1809 | Redstone 5 | October 2018 Update | 17763 |
| 1903 | 19H1 | May 2019 Update | 18362 |
| 1909 | 19H2 | November 2019 Update | 18363 |
| 2004 | 20H1 | May 2020 Update | 19041 |

---

## 🤝 Contribution

### Vous souhaitez contribuer ?

Les pull requests sont les bienvenues ! Voici les règles :

1. **Nommage des fonctions** : Verbes d'action (`Enable`, `Disable`, `Show`, `Hide`)
2. **Fonctions inverses** : Toujours créer la fonction inverse
3. **Répétabilité** : Les fonctions doivent pouvoir s'exécuter plusieurs fois sans erreur
4. **Documentation** : Commentaires clairs en anglais
5. **Pas de dépendances** : Pas de modules tiers (Chocolatey, NuGet, etc.)

### Licence

**MIT License** - Utilisez, modifiez et distribuez librement. N'oubliez pas de créditer l'auteur original.

---

## 📞 Support & Contact

- **Issues GitHub** : [Signaler un bug](https://github.com/Disassembler0/Win10-Initial-Setup-Script/issues)
- **Auteur original** : Disassembler <disassembler@dasm.cz>
- **Donations** : [PayPal](https://www.paypal.me/Disassembler)

---

## 📚 Ressources supplémentaires

- [Guide complet (EN)](https://checkthebenchmarks.com/2019/09/11/win10-initial-setup-script/)
- [Guide en français](https://www.pcsoleil.fr/optimisation-de-windows-10-grace-a-win10-initial-setup-script/)
- [Documentation Microsoft](https://docs.microsoft.com/fr-fr/windows/)

---

**Dernière mise à jour :** 2020-07-15
**Version du script :** 3.10
