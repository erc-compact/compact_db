#!/usr/bin/env bash

dot_file=$1
er_diagram_filename=$2
dot -Tpdf $dot_file > $er_diagram_filename

