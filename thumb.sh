#!/bin/bash

rm *_thumb.jpg

docker run --rm -v ${PWD}:/tmp ezthumb ezthumb -g 2x4 *.mp4 *.mpg *.wmv *.avi
#docker run --rm -v ${PWD}:/tmp ezthumb

