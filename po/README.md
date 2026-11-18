# Translation catalogs

Catalogs use the KDE layout, so `ki18n_install(po)` in the top-level `CMakeLists.txt`
compiles and installs them without extra rules:

```
po/<locale>/<translation-domain>.po  ->  share/locale/<locale>/LC_MESSAGES/<translation-domain>.mo
```

The translation domain of a component is the id Plasma uses for it:

| Component | Domain |
|---|---|
| Plasmoids | `plasma_applet_<plugin-id>` |
| Shell | `plasma_shell_io.gitgud.wackyideas.desktop` |
| Setup wizard | `atpootb` |
| SDDM theme | `aerothemeplasma-sddm-theme` |

`zh_CN` covers the shell, every plasmoid, the setup wizard and the SDDM theme.
Strings are extracted from the QML sources with `xgettext`; when adding new
user-visible strings, run `xgettext` with the same keywords over the changed
files and merge the result into the matching catalog.
