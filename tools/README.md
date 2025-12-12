# 🛠️ Outils Windows 10

Ce dossier contient des outils utilitaires pour gérer vos optimisations Windows.

## 📦 Outils disponibles

### 💾 Backup-Settings.ps1 / Backup.cmd
Créé une sauvegarde complète de vos paramètres Windows actuels.

**Ce qui est sauvegardé :**
- ✅ Clés de registre critiques
- ✅ Liste des applications installées
- ✅ État des services Windows
- ✅ Informations système
- ✅ Point de restauration système

**Utilisation :**
```cmd
Backup.cmd
```

**Recommandé avant :**
- Appliquer un nouveau preset
- Faire une mise à jour majeure de Windows
- Modifier des paramètres système importants

---

### 🔄 Restore-Settings.ps1 / Restore.cmd
Restaure vos paramètres Windows à partir d'une sauvegarde.

**Fonctionnalités :**
- Liste toutes les sauvegardes disponibles
- Affiche les informations de chaque sauvegarde
- Crée un point de restauration de sécurité avant la restauration
- Restaure les clés de registre

**Utilisation :**
```cmd
Restore.cmd
```

**Quand l'utiliser :**
- Si un preset a causé des problèmes
- Pour revenir à une configuration antérieure
- Après une mise à jour Windows qui a réinitialisé vos paramètres

---

## 📋 Processus recommandé

### Première utilisation du script d'optimisation

1. **Créer une sauvegarde**
   ```cmd
   cd tools
   Backup.cmd
   ```

2. **Appliquer votre preset**
   ```cmd
   cd ..\presets
   Gaming.cmd
   ```
   (ou Privacy.cmd, Balanced.cmd)

3. **Tester le système**
   - Vérifiez que tout fonctionne
   - Testez vos applications
   - Vérifiez la connectivité réseau

4. **Si problème : Restaurer**
   ```cmd
   cd tools
   Restore.cmd
   ```

### Mises à jour Windows

Après chaque mise à jour majeure de Windows :

1. **Réappliquer votre preset** (Windows réinitialise certains paramètres)
   ```cmd
   cd presets
   Gaming.cmd
   ```

2. **Optionnel : Créer une nouvelle sauvegarde**
   ```cmd
   cd tools
   Backup.cmd
   ```

---

## 📂 Structure des sauvegardes

Les sauvegardes sont stockées dans `../backups/` avec la structure suivante :

```
backups/
├── Backup_2024-01-15_14-30-00/
│   ├── README.txt                                    # Informations sur la sauvegarde
│   ├── SystemInfo.json                               # Informations système
│   ├── InstalledApps.csv                             # Liste des apps
│   ├── ServicesStatus.csv                            # État des services
│   ├── HKLM_SOFTWARE_..._DataCollection.reg         # Clés de registre
│   ├── HKLM_SOFTWARE_..._Windows Defender.reg
│   └── ...
└── Backup_2024-01-20_09-15-30/
    └── ...
```

---

## ⚠️ Notes importantes

### Limitations

❌ **Ne sauvegarde PAS :**
- Les fichiers personnels
- Les programmes installés (seulement la liste)
- Les pilotes
- Les mises à jour Windows

✅ **Sauvegarde uniquement :**
- Les paramètres de registre
- La configuration système
- L'état des services

### Recommandations

1. **Créez des sauvegardes régulières**
   - Avant chaque modification importante
   - Après avoir trouvé une configuration stable
   - Avant les mises à jour Windows

2. **Gardez plusieurs sauvegardes**
   - Ne supprimez pas les anciennes sauvegardes immédiatement
   - Conservez au moins 2-3 sauvegardes

3. **Testez la restauration**
   - Vérifiez que vos sauvegardes fonctionnent
   - Testez dans un environnement sûr si possible

4. **Documentez vos changements**
   - Notez quel preset vous avez appliqué
   - Conservez une liste de vos tweaks personnalisés

---

## 🔧 Utilisation avancée

### Restauration manuelle d'une clé de registre

1. Naviguez vers le dossier de sauvegarde
2. Double-cliquez sur le fichier `.reg` que vous voulez restaurer
3. Confirmez l'import
4. Redémarrez l'ordinateur

### Comparer deux sauvegardes

```powershell
# Comparer les applications installées
$backup1 = Import-Csv "backups\Backup_2024-01-15_14-30-00\InstalledApps.csv"
$backup2 = Import-Csv "backups\Backup_2024-01-20_09-15-30\InstalledApps.csv"

Compare-Object $backup1 $backup2 -Property Name
```

---

## 📞 Aide

Si vous rencontrez des problèmes :

1. Vérifiez que vous exécutez les scripts en tant qu'administrateur
2. Consultez le fichier `README.txt` dans votre dossier de sauvegarde
3. Utilisez les points de restauration système si nécessaire
4. Consultez la documentation principale dans `../README.fr.md`

---

**Dernière mise à jour :** 2024
