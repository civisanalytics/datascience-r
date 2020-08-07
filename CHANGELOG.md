
# Change Log

All changes to this project will be documented in this file.

Version number changes (major.minor.micro) in this package denote the following:
- A micro version will increase if the only change in a release is incrementing micro versions (bugfix-only releases) on the packages contained in this image.
- A minor version will increase if one or more packages contained in the Docker image add new, backwards-compatible features, or if a new package is added to the Docker image.
- A major version will increase if there are any backwards-incompatible changes in any of the packages contained in this Docker image, or any other backwards-incompabile changes in the execution environment.

## [4.0.1] - 2020-05-23

- rocker/verse -> 4.0.1
- python is removed, replaced by explicit calls to either python2 or python3
- added patchwork, gt, and packrat R packages
- civis-r -> 3.0.0
- civis-python -> 1.14.0 (installed by default in python3)

## [3.3.0] - 2020-04-13

- rocker/verse -> 3.6.2

## [3.2.1] - 2020-02-24

- civis-r -> 2.1.2

## [3.2.0] - 2019-12-20

- rocker/verse -> 3.6.1
- 30+ packages added to `requirements.txt`
- Geospatial system dependencies

## [3.1.0] - 2019-09-09

- rocker/verse -> 3.6.0
- civis-r -> 2.1.0
- civis-python -> 1.11.0

### Added
- added buildspecs for autobuilding and pushing Docker image to Amazon ECR 

## [3.0.0] - 2019-06-21

- rocker/verse -> 3.5.3
- civis-r -> 2.0.0
- civis-python -> 1.10.0
- added `requirements.txt`
- added package `zoo`

## [2.8.0] - 2019-02-12

- rocker/verse -> 3.5.2
- civis-r -> 1.6.1
- civis-python -> 1.9.3

## [2.7.4] - 2018-08-14

- Added build time test for `civis`.

## [2.7.3] - 2018-08-13

- Patch release to fix broken build, due to transient MRAN failure.

## [2.7.0] - 2018-06-21

- Update civis-r to 1.5.0

## [2.6.0] - 2018-05-08

- Update civis-r to 1.4.0
- Update rocker/verse to 3.5.0
- Update civis-python to 1.9.0

## [2.5.0] - 2018-02-19

- Update rocker/verse to 3.4.3 (#21).
- Update civis-python to 1.8.1 (#21).

## [2.4.0] - 2018-01-25

- update civis-r to 1.2.0
- update civis-python to 1.8.0

## [2.3.0] - 2017-11-28

- Update civis-r to 1.1.1
- Update civis-python to 1.7.1

## [2.2.0]

- Update civis-r to 1.1.0

## [2.1.0] - 2017-10-25

- Updated civis-r to 1.0.2 (minor)
- Updated R to 3.4.2 (minor)

## [2.0.0] - 2017-09-12

### Added
- Added the public Civis API client (#13).

### Changed
- Moved the base image to rocker/verse (#14).

## [1.4.1] - 2017-07-27

### Fixed
- Updated the locale settings so that unicode works as expected (#11, #12).

## [1.4.1] - 2017-07-13

### Added
- Added the Civis Python API client (#9).

## [1.3.0] - 2017-04-07

## [1.2.0] - 2017-01-11

## [1.1.0] - 2016-10-24

## [1.0.0] - 2016-09-16

* Initial Release
