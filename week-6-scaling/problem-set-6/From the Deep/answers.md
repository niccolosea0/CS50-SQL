# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning
Random partitioning sends each observation to a random boat, so observations will be evenly distributed regardless of when they are collected. This helps balance storage and load evenly across all boats. However, since observations are spread randomly, queries for a specific time range (like midnight to 1am) need to be executed on all boats, which can be inefficient and slow. Additionally, this design complicates query coordination and aggregation.

## Partitioning by Hour

Partitioning by hour groups observations based on the timestamp hour, such as sending all observations within 0–7 hours to Boat A. This means observations will not be evenly distributed, because most observations occur between midnight and 1am, causing Boat A to receive most of the data while other boats get less. The upside is that queries for a specific time range only need to be run on one boat, improving query efficiency for time-bound searches. However, this can cause uneven storage use and load on boats.

## Partitioning by Hash Value

Partitioning by the hash value of timestamps evenly distributes observations over boats, regardless of when the observations occur. This provides balanced storage and load, like random partitioning, but with a consistent and deterministic placement for each specific observation. While queries for a range of timestamps still require running on all boats due to how hash values scatter data, queries for a single known timestamp can target only the boat where its hash maps to, improving lookup speed. The downside is that range queries become more complex and less efficient.
