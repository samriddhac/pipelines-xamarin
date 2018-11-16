#!/bin/bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null

accountId=$1

basePath=$Env:BUILD_SOURCESDIRECTORY
sourcePath='\'
configFile='config.json'

configFilePath=$basePath$sourcePath$configFile

paramAccountId='AccountId'

cat $configFilePath | 
jq 'map(if .ParameterKey == "$paramAccountId"
          then . + {"ParameterValue"="$accountId"}
          else .
          end
         )' > populated_config.json 

echo $configFilePath


