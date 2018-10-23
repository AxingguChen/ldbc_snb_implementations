#!/bin/bash

# exit upon error
set -e

PG_DATA_DIR=${PG_DATA_DIR:-$(pwd)/../../../ldbc_snb_datagen/social_network/}
PG_DB_NAME=${PG_DB_NAME:-ldbcsf1}
PG_USER=${PG_USER:-$USER}

cat $PG_DATA_DIR/post_0_0.csv | \
  awk -F '|' '{ print $1"|"$2"|"$3"|"$4"|"$5"|"$6"|"$7"|"$8"|"$9"|"$11"|"$10"|"}' > \
  $PG_DATA_DIR/post_0_0-postgres.csv
cat $PG_DATA_DIR/comment_0_0.csv | \
  awk -F '|' '{print $1"||"$2"|"$3"|"$4"||"$5"|"$6"|"$7"|"$8"||"$9 $10}' > \
  $PG_DATA_DIR/comment_0_0-postgres.csv

/usr/bin/dropdb --if-exists $PG_DB_NAME -U $PG_USER
/usr/bin/createdb $PG_DB_NAME -U $PG_USER --template template0 -l "C"
/usr/bin/psql -d $PG_DB_NAME -U $PG_USER -a -f schema.sql
(cat snb-load.sql | sed "s|PATHVAR|$PG_DATA_DIR|g"; echo "\q\n") | /usr/bin/psql -d $PG_DB_NAME -U $PG_USER
/usr/bin/psql -d $PG_DB_NAME -U $PG_USER -a -f schema_constraints.sql
