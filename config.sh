#!/bin/sh

echo $(which apimcli)
apimcli version

rm -rf $HOME/.wso2apimcli

echo 'setting up test environment'
apimcli add-env -n test \
                      --registration https://localhost:9443/client-registration/v0.14/register \
                      --apim https://localhost:9443/publisher \
                      --token https://localhost:8243/token \
                      --import-export https://localhost:9443/api-import-export-2.6.0-v10 \
                      --admin https://localhost:9443/api/am/admin/v0.14 \
                      --api_list https://localhost:9443/api/am/publisher/v0.14/apis \
                      --app_list https://localhost:9443/api/am/store/v0.14/applications
echo 'logging into test'
apimcli login test -u $USERNAME -p $PASSWORD -k

echo 'setting up staging environment'
apimcli add-env -n staging \
                      --registration https://localhost:9444/client-registration/v0.14/register \
                      --apim https://localhost:9444/publisher \
                      --token https://localhost:8244/token \
                      --import-export https://localhost:9444/api-import-export-2.6.0-v10 \
                      --admin https://localhost:9444/api/am/admin/v0.14 \
                      --api_list https://localhost:9444/api/am/publisher/v0.14/apis \
                      --app_list https://localhost:9444/api/am/store/v0.14/applications
echo 'logging into staging'
apimcli login staging -u $USERNAME -p $PASSWORD -k

echo 'setting up prod environment'
apimcli add-env -n prod \
                      --registration https://localhost:9443/client-registration/v0.14/register \
                      --apim https://localhost:9443/publisher \
                      --token https://localhost:8243/token \
                      --import-export https://localhost:9443/api-import-export-2.6.0-v10 \
                      --admin https://localhost:9443/api/am/admin/v0.14 \
                      --api_list https://localhost:9443/api/am/publisher/v0.14/apis \
                      --app_list https://localhost:9443/api/am/store/v0.14/applications
echo 'logging into prod'
apimcli login prod -u $USERNAME -p $PASSWORD -k

