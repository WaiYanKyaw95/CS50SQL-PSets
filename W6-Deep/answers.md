# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

We should use random partitioning when we want to ensure that we store all the data randomly in different locations (servers). As a trade-off, when you want to retrieve some information, this random partitioning is not helpful as you need to run your query(ies) in all the databases.

## Partitioning by Hour

We should partition by hour when we want to store information in a strict manner and retrieve any information easily (by querying the relevant database). However, as this example states that most observations occur only early morning or evening, the data will be stored unevenly and this type of partition will unbalance the load of the databases.

## Partitioning by Hash Value

We should partition by hash value when we want to evenly distribute data across all databases (servers) and when we want to retrieve an information that corresponds specifically to the input to the hash function (here it's the timestamp). However, this partitioning will not be effective when we have to query many information as it will need to run on all the databases.
