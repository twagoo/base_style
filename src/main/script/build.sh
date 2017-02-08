#!/bin/sh
set -e

#gcp can be installed on MacOS via brew. Run "brew install coreutils" to do so.
CP=`which gcp||which cp` #if gcp available (on Mac), use it instead of BSD cp

npm set progress='false'

if ! which grunt > /dev/null
then
	npm --silent install --global 'grunt-cli'
fi

echo "Downloading bootstrap version ${BOOTSTRAP_VER}..."
curl --fail --location --proto '=https' --silent --show-error --tlsv1 \
    "https://github.com/twbs/bootstrap/archive/v${BOOTSTRAP_VER}.zip" \
    | bsdtar -xf -

## Apply CLARIN base style.
echo "Applying CLARIN flavour..."
cd -- "bootstrap-${BOOTSTRAP_VER}/"
### Put CLARIN root wrapper in place
${CP} -f -- '../src/main/less/clarin-bootstrap.less' 'less/clarin-bootstrap.less'
### CLARIN customisations
${CP} -f -- '../src/main/less/clarin-additions.less' 'less/clarin-additions.less'
${CP} -f -- '../src/main/less/variables.less' 'less/variables.less'

### Adapt Gruntfile to use CLARIN root wrapper
sed -i -e "s/'less\\/bootstrap\\.less'/'less\\/clarin-bootstrap.less'/g" Gruntfile.js

## Build bootstrap
echo "Building CLARIN bootstrap distribution..."
npm --silent install
grunt dist
tar -f "../bootstrap-clarin-${STYLE_VERSION}.tgz" -c -v -z 'dist/'

cd - > /dev/null

echo "Done: $(ls bootstrap-clarin-${STYLE_VERSION}.tgz)"
