#!/bin/bash

java -cp target/cypher-0.4.0-SNAPSHOT.jar com.ldbc.driver.Client -dm CREATE_VALIDATION_PARAMS -P interactive-create-validation-parameters.properties
