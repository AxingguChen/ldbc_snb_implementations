![LDBC_LOGO](https://raw.githubusercontent.com/wiki/ldbc/ldbc_snb_datagen/images/ldbc-logo.png)
LDBC SNB implementations
------------------------

[![Build Status](https://travis-ci.org/ldbc/ldbc_snb_implementations.svg?branch=master)](https://travis-ci.org/ldbc/ldbc_snb_implementations)

Implementations for the Workload components of the LDBC Social Network Benchmark ([specification](https://ldbc.github.io/ldbc_snb_docs/)).

For documentation on the PostgreSQL implementation, visit the [postgres](postgres/) directory.

1. Download and install the LDBC driver:

    You can find the detailed information about this task here:
    <https://github.com/ldbc/ldbc_snb_driver>

    After that, you can install the jar file of ldbc_driver to the local
    Maven repository. Go to the root directory of ldbc_driver, and run:

    ```
    mvn clean install -Dmaven.compiler.source=1.7 -Dmaven.compiler.target=1.7 -DskipTests
    ```

2. Compile Db class for the JDBC database:

    Run:

    ```
    mvn clean package
    ```

3. Running the driver against Postgres:

    You have to update the paths in the `run.sh` script, and use it for
    running the benchmark.  Before that, please update the 3 configuration
    files with your options. This process is explained here:
    <https://github.com/ldbc/ldbc_snb_driver/wiki>
