# admin-prod-us1 environment  
# -------------------------------------  
  
Inputs for creating the admin infrastructure in prod-us-east-1 environment should be placed in this directory. Input details are typically in .tfvars file, user-data file and task definition files for various ecs services.  
  
This directory also has the .tfstate pertaining to the admin-prod-us1 environment.

# Crowd aip service - FIX for Authentication issue

"Connection to authentication server failed. Please review the logs for more information"

docker exec -ti ecs-crowd-xx-postgres-xxxxxxxxxxxxxxxxxxxxxx sh

psql --username=pgadmin -d crowddb


crowddb=# \d+ cwd_application_address;
                           Table "public.cwd_application_address"
     Column     |          Type          | Modifiers | Storage  | Stats target | Description
----------------+------------------------+-----------+----------+--------------+-------------
 application_id | bigint                 | not null  | plain    |              |
 remote_address | character varying(255) | not null  | extended |              |
Indexes:
    "cwd_application_address_pkey" PRIMARY KEY, btree (application_id, remote_address)
Foreign-key constraints:
    "fk_application_address" FOREIGN KEY (application_id) REFERENCES cwd_application(id)
Has OIDs: no

crowddb=# select * from cwd_application_address;
 application_id |   remote_address
----------------+--------------------
              2 | 10.85.4.242
              2 | localhost
              2 | 172.17.0.4
              2 | e08edc02eb2d
              2 | 127.0.0.1
              2 | crowd.aipadmin.com
(6 rows)

crowddb=# INSERT INTO cwd_application_address VALUES (2,'<Nginx container IP address>');

crowddb-# select * from cwd_application_address;

 application_id |   remote_address
----------------+--------------------
              2 | 10.85.4.242
              2 | localhost
              2 | 172.17.0.4
              2 | e08edc02eb2d
              2 | 127.0.0.1
              2 | crowd.aipadmin.com
              2 | 172.17.0.5
(7 rows)