Image Validate Example
===

This is our discuss in [5xRuby](https://5xruby.tw) internal channel for add image validation to our blog CI to prevent upload too large image.

## Usage

Build Docker Image

    docker build -t image-validation .

Execute with specify location

    docker run --rm -v /app/my-repo:/home/ruby image-validation

If success will return `0` as status code otherwise will return `1`

> This is design for GitLab CI

## Options

|Option|Name|Description|
|------|----|-----------|
|`-b`|branch| The branch to compare
|`-s`|size| The max size allowed (kb)
|`-w`|width| The max width allowed (size)
