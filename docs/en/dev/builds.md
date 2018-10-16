# Building

Dependencies:
  * meson
  * ninja
  * vala
  * gtk-3

To build the project, go to the project root, and execute `meson build` (for your own user only) or `meson build --prefix=/usr` (for all users of your system).

To install it, go to the `build/` directory and execute:
```
build/ $ ninja
build/ $ ninja install
```

### Translations

Tracked files are enumerated in `po/POTFILES`. If you add or rename a file with strings that will be displayed to users, make sure to update this file accordingly.

Supported languages are enumerated in `po/LINGUAS`. To add a language, add it there, then re-build the translations (as described below).

To re-build the translations files, from the `build/` directory, execute:

```
build/ $ ninja com.github.nwallace.fanboy-pot
build/ $ ninja com.github.nwallace.fanboy-update-po
```
