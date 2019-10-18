## About
The docker image contains Azkaban Solo Server. Alpine Linux has been used as basic OS.

## Running
### Environment and configuration
You have a possibility to change some options of running Azkaban Solo Server with using next environments:
* `DEFAULT_TIME_ZIME_ID` - time zone, by default the environment has value 'Etc/GMT-3'. It is Moscow time zone (+03:00)
* `LOCKDOWN_CREATE_PROJECTS` - if the parameter is true then only users who has role ADMIN can create new projects, by default is 'true'
* `AZKABAN_NAME` - name of your Azkaban web interface, by default is 'Project name'
* `AZKABAN_LABEL` - little description of your Azkaban web interface, by default is 'Project description'
* `AZKABAN_COLOR` - custom color of your Azkaban web interface, by default is '#FF3601'
* `AZKABAN_PORT` - port of your Azkaban web interface, by default is '8081'
* `AZKABAN_MAIL_SENDER` - sender of email with statuses of completing jobs, by default is empty
* `AZKABAN_MAIL_HOST` - host for sending emails, by default is empty
* `AZKABAN_JOB_FAILURE_EMAIL` - default email address for messages about 'failure' status of completing jobs, by default is empty
* `AZKABAN_JOB_SUCCESS_EMAIL` - default email address for messages about 'success' status of completing jobs, by default is empty

You also have a possibility to override data directory of Azkaban. Inside docker contaimer Azkaban uses directory /var/azkaban for saving all information about projects, plugins, configuration of users. Local h2 database saved in this directory too.

File /var/azkaban/azkaban-users.xml contains information about users and their roles.

```bash
docker run -d --name "azkaban_solo_server" \
    -p 8081:8081 \
    -v /your_local_azkaban_data_dir:/var/azkaban \
    -e DEFAULT_TIME_ZIME_ID="Etc/GMT-3" \
    -e LOCKDOWN_CREATE_PROJECTS="true" \
    -e AZKABAN_NAME="Project name" \
    -e AZKABAN_LABEL="Project description" \
    -e AZKABAN_COLOR="#FF3601" \
    -e AZKABAN_PORT=8081 \
    entony/azkaban-solo-server:3.30.1-alpine
```

## Versions description
### 3.30.1-alpine
The version contains:
* Alpine Linux 3.10.2
* Azkaban Solo Server 3.30.1
* Open JRE 8
* Bash
* tzdate

## References
Docker image: https://hub.docker.com/r/entony/azkaban-solo-server