# CLARIN base style
[![Build Status](https://travis-ci.org/clarin-eric/base_style.svg?branch=master)](https://travis-ci.org/clarin-eric/base_style)

A bootstrap based CLARIN style implementing the [CLARIN interface guidelines](https://github.com/clarin-eric/interface_guidelines). Additional information about branding and styling in CLARIN can be found on the [CLARIN Trac](https://trac.clarin.eu/wiki/Branding).

## Using the CLARIN style

### Compiled CSS output
A compiled CSS file is made available for each [release](https://github.com/clarin-eric/base_style/releases). See releases within the [main base_style repository](https://github.com/clarin-eric/base_style). The best way to use this CSS file in your project, is to use it as is and make any overrides or other adjustments in separate CSS files local to the project. This way you can easily upgrade the CLARIN CSS when a new release is made available.

### Less file
The [variables.less](variables.less) file can be obtained form the Git repository and is also made available with each release. 

Use this Less file in place of the supplied file of the same name when building CSS from Bootstrap sources (see Bootstrap's [instructions for building CSS](https://getbootstrap.com/getting-started/#grunt)). 

Make sure to use a compatible version of Bootstrap when compiling! The version for which the style was developed and tested can be found in the [Travis configuration file](.travis.yml).

As with the CSS file (see above), its best to use it as is (preferably including it build time based on the style's version number) and make any overrides or other adjustments in separate Less files local to the project. This way you can easily upgrade the CLARIN style when a new release is made available.

### Using the style in a Maven project
You can use the following artifact:

```xml
<groupId>eu.clarin.style</groupId>
<artifactId>base-style</artifactId>
<version>0.1.2</version>
<!-- available classifiers: 'css-with-bootstrap', 'less-with-bootstrap' and 'less-without-bootstrap' -->
<classifier>css-with-bootstrap</classifier>
```

This can be used in combination with, for example, the [unpack goal of the maven-dependency-plugin](https://maven.apache.org/plugins/maven-dependency-plugin/unpack-mojo.html)
so that the CLARIN base style CSS or LESS is included among your resources before compiling or packaging. See the [VLO project](https://github.com/clarin-eric/VLO) for an example.

JARs are also bundled with releases.

If you would like to build one of these JARs yourself, pass the following parameters:
```
-Dstyle.version=${STYLE_VERSION}
-Dbootstrap.version=${BOOTSTRAP_VERSION}
-P${PROFILE}
```

where `${PROFILE}` should match one of the classifiers and the style and bootstrap versions should match the respective values specified in `.travis.yml`

### Using the style in a drupal website
See the [www-clarin-eu_src](https://github.com/clarin-eric/www-clarin-eu_src) project. Dependency of [alpine-httpd-drupal](https://gitlab.com/CLARIN-ERIC/alpine-httpd-drupal).

## Making changes to the CLARIN style

1. Edit the Less file(s)
 - Make a _branch or fork_ (please **don't** commit anything not ready for release to master!) of the base_style repository.
 - Make any desired changes to the `variables.less` file or add new style code as required.
1. Check the results
 - Build the Less output using your desired method (see Bootstrap's [instructions for building CSS](https://getbootstrap.com/getting-started/#grunt) but you can use [other Less compilers](http://lesscss.org/usage/) as well) and check the results.
 - Make further changes as required.
1. Make or request a release
 - **IMPORTANT**: increase the version number in [.travis.yml](.travis.yml)
 - Merge into 'master' or make a pull request.
 - Make a tag or ask someone with the right permissions. This will trigger a [Travis job](https://travis-ci.org/clarin-eric/base_style), which will result in a deployment of the artifacts into a [release](https://github.com/clarin-eric/base_style/releases).
