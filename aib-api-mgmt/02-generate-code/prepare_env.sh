#!/bin/bash
apt install -y libarchive-tools

# install zipfs extension
curl -L https://marketplace.visualstudio.com/_apis/public/gallery/publishers/slevesque/vsextensions/vscode-zipexplorer/0.3.1/vspackage | bsdtar -xvf - extension
mv extension /opt/.katacodacode/extensions/zipexplorer-extension

# Modify vscode config
mkdir -p /opt/.katacodacode/user-data/User/
cat > /opt/.katacodacode/user-data/User/settings.json << VSCODEEOF
{ 
  "workbench.startupEditor": "none", 
  "files.autoSave": "afterDelay",
  "editor.minimap.enabled": false,
  "window.autoDetectColorScheme": false,
  "workbench.colorCustomizations": {},
  "workbench.colorTheme": "Default Dark+",
  "editor.semanticHighlighting.enabled": false,
  "editor.tokenColorCustomizations": {
      "semanticHighlighting": true
  },
  "files.exclude": {
    "**/.*": true
  }
}
VSCODEEOF

cat >$HOME/.mavenrc <<MAVENRC_EOF
MAVEN_OPTS="--add-opens java.base/java.lang=ALL-UNNAMED"
MAVENRC_EOF

# clone playground repository
git clone -b 02_1_attach_openapi https://github.com/maddingo/api-handling.git