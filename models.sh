#!/usr/bin/env bash
ModelDirectory="models"
      mkdir "models"
      touch "models/$2.js"
if [[ $1 == "models" ]]; then
    printf "const mongoose = require('mongoose');
            const Schema = mongoose.Schema;
            const $2Schema = new Schema({" >"$ModelDirectory/$2.js"
    for i in $@; do
      if [[ $i != $1 && $i != $2 ]]; then
        printf "${i}: {
          type: String,
          required: true
        }," >>"$ModelDirectory/$2.js"; \
      fi
    done
    printf " },{timestamp: true})
    module.exports = mongoose.model('$2', $2Schema)
    " >>"$ModelDirectory/$2.js"
  else
    echo "not found"
fi
