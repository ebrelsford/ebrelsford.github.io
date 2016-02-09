#!/bin/bash

cat modules/*.md > course.md
markdown-pdf --cwd modules --runnings-path modules/runnings.js --remarkable-options '{ "html": true }' --css-path course.css course.md
