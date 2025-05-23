# minio-kerfuffle

This repository contains our orginal exploit code for CVE-2025-31489: https://github.com/minio/minio/security/advisories/GHSA-wg47-6jq2-q2hh

This is fixed in Min.io RELEASE.2025-04-03T14-56-28Z which is now well over a month old.

Write-up here: https://www.linkedin.com/pulse/we-found-my-first-ever-exploitable-vulnerability-owain-kenway-qy1we/

If you look at the script in `test_code/curl-minio.sh` you will see that it is a simple shell script which will put an object into a bucket which is a text file that says "foobar!" without doing any authentication. This is caused by the specific header STREAMING-UNSIGNED-PAYLOAD-TRAILER which caused affected version of Min.io to skip the S3 signature verification step and hence skip all authentication beyond userid.

You can modify the bucket/user/endpoint/opbectname to match a user who has write access to a particular bucket.

There is an older tagged release (https://github.com/owainkenwayucl/minio-kerfuffle/releases/tag/snapshot-at-report) which has python code using the boto3 library. This is how the exploit was found - versions of boto3 > 1.36 send the headers set in this curl script to Min.io servers in specific circumstances, e.g. if the Min.io server is using TLS.