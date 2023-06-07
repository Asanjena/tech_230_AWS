
## How to CRUD using python


### Accessing s3

First, we will need to import the boto3 library:

```
import boto3
```

Then, we need to connect to s3:

```
s3 = boto3.resource("s3")
```

To lists all the buckets available, we use the following command:

```
for bucket in s3.buckets.all():
    print(bucket.name)
```




### Creating a bucket 

1. Make  a python file for creating a bucket

2. For all parts of the CRUD, we will first need to import the boto3 library:

```
import boto3
```

2. We will also have to connect to s3 for each part of CRUD:

```
s3 = boto3.client("s3")
```

**note** - .client is used to create a completely new bucket. 

3. We will then input the command to creat a bucket:

```
bucket_name = s3.create_bucket(Bucket = "tech230-alema-boto", CreateBucketConfiguration={"LocationConstraint": "eu-west-1"})
```

**note** make sure that you captialise in the right places e.g. Bucket and CreateBucketConfiguration. After 'Bucket', we input the name of our bucket we will create. We then are areating a key to identify the region. 

4. You can add a print command to return:

```
print(bucket_name)
```

### Upload to bucket

Follow the first two steps above 

2. We then need to open the file we want to send (e.g. a sample.txt file) and store it in a variable:

```
data = open("sample.txt", "rb")
```

3. Finally, we need to specify which bucket we would like to send the file too:

```
s3.Bucket("tech230-alema-boto").put_object(Key="sample.txt", Body=data)
```
Using '.put_object' names the file we want, and then sends it to the bucket identified


### Downloading from bucket

1. Follow the first two steps from 'creatine a bucket' above again

2. To download from an s3 bucket:

```
s3.download_file("tech230-alema-boto", "sample.txt", "sampletext1.txt")
```

**Note** - The first part of this line states the bucket we want to download from. The second part identifies the file. The third part gives the file a new name.

3. You can also add a print statement here:

```
print(s3.download_file)
```


### Delete from bucket - contents

Before you can delete a bucket, you have to delete it's contents:

1. Follow the first two steps from 'creatine a bucket' above

2. To delete a file in a bucket:

```
s3.Object("tech230-alema-boto", "sample.txt").delete()
```
Here you are first stating the bucket name, and then the file you would like removed.


### Deleting the bucket

Make sure that you have deleted the buckets content.

1. Follow the first two steps from 'creatine a bucket'

2. State the bucket:

```
bucket = s3.Bucket("tech230-alema-boto")

```
3. State the action:
```
response = bucket.delete()
```

4. You can also add a print statement:

```
print(response)
```








