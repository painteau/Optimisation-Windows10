# 🎯 Presets Windows 10

Ce dossier contient des configurations prédéfinies (presets) pour différents cas d'usage.

## 📋 Presets disponibles

### 🎮 Gaming.preset
**Pour qui ?** Gamers qui cherchent les meilleures performances et la latence minimale.

**Caractéristiques :**
- ✅ Performances maximales
- ✅ Latence réseau minimale
- ✅ Optimisations SSD
- ✅ Mode sombre
- ❌ **Sécurité réduite** (Defender et Firewall désactivés)

**⚠️ ATTENTION :**
- Windows Defender est DÉSACTIVÉ → Installez un antivirus tiers !
- Le pare-feu Windows est DÉSACTIVÉ → Votre PC est exposé !
- SmartScreen est DÉSACTIVÉ → Moins de protection web

**Utilisation :**
```cmd
Gaming.cmd
```
ou
```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ..\Win10.ps1 -include ..\Win10.psm1 -preset Gaming.preset
```

---

### 🔒 Privacy.preset
**Pour qui ?** Utilisateurs soucieux de leur vie privée.

**Caractéristiques :**
- ✅ Confidentialité maximale
- ✅ Télémétrie complètement désactivée
- ✅ OneDrive désinstallé
- ✅ Sécurité maintenue (Defender et Firewall activés)
- ✅ Caméra et micro désactivés

**Inclut :**
- Désactivation de toutes les fonctionnalités UWP de pistage
- Suppression des applications de télémétrie
- Désactivation du partage de fichiers
- Désactivation de la recherche web dans le menu démarrer

**Utilisation :**
```cmd
Privacy.cmd
```

---

### ⚖️ Balanced.preset
**Pour qui ?** La plupart des utilisateurs. Configuration équilibrée recommandée.

**Caractéristiques :**
- ✅ Bon compromis entre privacy, performance et sécurité
- ✅ Sécurité maintenue (Defender et Firewall activés)
- ✅ Mises à jour automatiques activées
- ✅ Confidentialité raisonnable
- ✅ Performances optimisées

**Idéal pour :**
- Utilisation quotidienne
- Travail de bureau
- Navigation web
- Multimédia

**Utilisation :**
```cmd
Balanced.cmd
```

---

## 🔄 Comparaison des presets

| Fonctionnalité | Gaming | Privacy | Balanced |
|----------------|--------|---------|----------|
| Windows Defender | ❌ Désactivé | ✅ Activé | ✅ Activé |
| Pare-feu | ❌ Désactivé | ✅ Activé | ✅ Activé |
| Télémétrie | ❌ Désactivé | ❌ Désactivé | ❌ Désactivé |
| Cortana | ❌ Désactivé | ❌ Désactivé | ❌ Désactivé |
| OneDrive | ⚠️ Activé | ❌ Désinstallé | ⚠️ Activé |
| Xbox Features | ✅ Activé | ❌ Désactivé | ❌ Désactivé |
| Indexation | ❌ Désactivé | ❌ Désactivé | ❌ Désactivé |
| Superfetch | ❌ Désactivé | ❌ Désactivé | ❌ Désactivé |
| IPv6 | ❌ Désactivé | ❌ Désactivé | ❌ Désactivé |
| Bloatwares | ❌ Supprimés | ❌ Supprimés | ❌ Supprimés |
| Points de restauration | ❌ Désactivés | ✅ Activés | ✅ Activés |
| Mises à jour auto | ❌ Désactivées | ⚠️ Partielles | ✅ Activées |

---

## 🛠️ Personnalisation

### Créer votre propre preset

1. Copiez un preset existant
2. Modifiez-le selon vos besoins
3. Commentez les tweaks que vous ne voulez pas (`#` au début de la ligne)
4. Décommentez ceux que vous voulez

**Exemple :**
```
# Cette ligne sera ignorée
DisableTelemetry    # Ceci sera exécuté
```

### Exclure un tweak spécifique

Utilisez `!` devant le nom du tweak :

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ..\Win10.ps1 `
    -include ..\Win10.psm1 `
    -preset Gaming.preset `
    !DisableDefender !DisableFirewall
```

Cela appliquera Gaming.preset SAUF DisableDefender et DisableFirewall.

---

## ⚠️ Recommandations de sécurité

### Si vous utilisez Gaming.preset

**Vous DEVEZ :**
1. Installer un antivirus tiers (Bitdefender, Kaspersky, ESET, etc.)
2. Utiliser un routeur avec pare-feu intégré
3. Ne pas télécharger de fichiers suspects
4. Garder vos logiciels à jour

**Alternative sécurisée :**
Modifiez Gaming.preset et commentez ces lignes :
```
# DisableDefender
# DisableFirewall
```

### Si vous utilisez Privacy.preset

**Attention :**
- La caméra et le micro sont désactivés système
- OneDrive est complètement supprimé
- Le partage réseau est désactivé
- Certaines applications Microsoft peuvent ne pas fonctionner

---

## 🔙 Annuler les changements

Pour chaque fonction dans un preset, il existe une fonction inverse.

**Exemples :**
- `DisableDefender` ↔️ `EnableDefender`
- `DisableTelemetry` ↔️ `EnableTelemetry`
- `UninstallOneDrive` ↔️ `InstallOneDrive`

Créez un preset de restauration avec les fonctions inverses.

---

## 📚 Ressources

- [Documentation complète (FR)](../README.fr.md)
- [Documentation originale (EN)](../README.md)
- [Liste complète des tweaks](../Win10.psm1)

---

**Dernière mise à jour :** 2024
