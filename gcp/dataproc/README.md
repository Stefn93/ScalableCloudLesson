# Dataproc Example with BigQuery connector

📝 Docs: [Use the BigQuery connector with Spark](https://cloud.google.com/dataproc/docs/tutorials/bigquery-connector-spark-example)

Samples showing how to create and run a simple [Apache Spark](https://spark.apache.org/) data pipeline that reads and write data from and to [Google Bigquery](https://cloud.google.com/bigquery).

## Before you begin

Make sure that you have an active GCP project.
Create a cluster following the [Dataproc Quickstarts](https://cloud.google.com/dataproc/docs/quickstarts).
Provide the BigQuery connector to your application in one of the following ways:
- Add the connector at runtime using the `--jars parameter`, which can be used with the Dataproc API or spark-submit.
    - If you are using Dataproc image 1.5, add the following parameter:
    `--jars=gs://spark-lib/bigquery/spark-bigquery-latest_2.12.jar`
    - If you are using Dataproc image 1.4 or below, add the following parameter:
    `--jars=gs://spark-lib/bigquery/spark-bigquery-latest.jar`
- Include the jar in your Scala or Java Spark application as a dependency 


## Create Resources
Use the bq command to create the `wordcount_dataset` in your project:
```sh
bq mk wordcount_dataset
```
Use the gsutil command to create a Cloud Storage bucket:
```sh
gsutil mb gs://[BUCKET_NAME]
```
    
## Execute MapReduce Spark job

1. Make sure that the bucket name in `mapReduce.scala` accord to the name of your bucket
2. Run the code in your cluster, 
    - SSH into the Dataproc cluster's master node via UI
    - copy `mapReduce.scala` file in the cluster or git clone this folder inside the cluster
    - launch the spark-shell passing the Bigquery jar connector
        ```sh
        $ spark-shell --jars=gs://spark-lib/bigquery/spark-bigquery-latest_2.12.jar
        ```
    - launch the wordcount.scala 
         ```sh
        :load /path/to/wordcount.scala
        ```
### Cleaning up

After you've finished this tutorial, you can clean up the resources you created
on Google Cloud so **you won't be billed** for them in the future.
The following sections describe how to delete or turn off these resources.

#### Clean up Google Cloud project resources

1. Delete the cluster.

    ```sh
    gcloud dataproc clusters delete (CLUSTER : --region=REGION)
    ```

1. Delete the bucket in Cloud Storage.

    > ⚠️ The following command also deletes all objects in the bucket.
    > These objects cannot be recovered.
    >
    > ```sh
    > gsutil rm -r gs://[BUCKET_NAME]
    > ```

1. Delete the Bigquery dataset.
    > ⚠️ The following command also deletes all tables in the dataset.
    > The tables and data cannot be recovered.
    >
    > ```sh
    > bq rm -r -d wordcount_dataset
    > ```
