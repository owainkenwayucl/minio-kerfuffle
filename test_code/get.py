import boto3
import logging
import configparser
import sys
import time

if len(sys.argv) != 2:
    print(f"Please run with an argument containing an ini file with configuration.")
    sys.exit(1)

configfile = sys.argv[1]
config = configparser.ConfigParser()
config.read(configfile)

endpoint = config["endpoint"]["url"]
username = config["endpoint"]["username"]
secretkey = config["endpoint"]["secretkey"]
bucketname = config["bucket"]["bucketname"]
objectname = config["bucket"]["objectname"] 
instance = time.time()

logfile = f"{configfile}.log"
logging.basicConfig(filename=logfile, filemode='a', level=logging.DEBUG)
logging.info(f"Running {configfile} at {instance} ")
boto3.set_stream_logger('', logging.DEBUG)

filepath = "payload.txt"

s3client = boto3.client(
    "s3",
    endpoint_url=endpoint,  # Custom S3 endpoint
    aws_access_key_id=username,
    aws_secret_access_key=secretkey,
    verify=False # do not check tls keys as may be self-signed
)

response = s3client.get_object(Bucket=bucketname, Key=objectname)
content = response["Body"].read().decode("utf-8")  # Read and decode the content
print(f"File Content:\n{content}")