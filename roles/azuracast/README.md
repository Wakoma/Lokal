# Azuracast

Azuracast is a radio broadcasting service that requires humongous number of UDP
ports to be open. It is tricky to open them one-by-one in this role so we put
them into the `prepare.yml` playbook. You can alway uncomment the local "include/firewall.yml`
and get similar results. The problem would be if `prepare.yml` was run again, it
would erase those locally opened ports. That's why it is part of prepare.yml already. 

# Notes

The azuracast team made a [change](https://github.com/AzuraCast/AzuraCast/commit/27260729bc432fe761f8cd62a7ba6cddd1ed22e2)
where they put all necessary software (MariaDB and Redis) into a single docker image. Therefor it is impossible to
use an external MySQL instance. `MYSQL_HOST` needs to be "localhost" otherwise DB is disabled completely.