#!/bin/bash
endpoint=${endpoint:-http://127.0.0.1:9000}
userid=${userid:-rootuser}
bucket=${bucket:-test}
objectname=${objectname:-test-curl.txt}
date=${date:-20250402}

curl -k -X PUT "${endpoint}/${bucket}/${objectname}" \
  -H "Accept-Encoding: identity" \
  -H "Amz-Sdk-Invocation-Id: f1f4aa97-31b2-4537-bbea-ed27afde5546" \
  -H "Amz-Sdk-Request: attempt=1" \
  -H "Authorization: AWS4-HMAC-SHA256 Credential=${userid}/${date}/us-east-1/s3/aws4_request, SignedHeaders=content-encoding;host;x-amz-content-sha256;x-amz-date;x-amz-decoded-content-length;x-amz-sdk-checksum-algorithm;x-amz-trailer, Signature=deadbeefdeadbeefdeadbeeddeadbeeddeadbeefdeadbeefdeadbeefdeadbeef" \
  -H "Content-Encoding: aws-chunked" \
  -H "Content-Length: 49" \
  -H "Host: minio-dev-lark.arc-unified-ai.condenser.arc.ucl.ac.uk" \
  -H "User-Agent: Boto3/1.37.24 md/Botocore#1.37.24 ua/2.1 os/linux#5.14.0-427.13.1.el9_4.x86_64 md/arch#x86_64 lang/python#3.9.18 md/pyimpl#CPython m/G,N cfg/retry-mode#legacy Botocore/1.37.24" \
  -H "X-Amz-Content-Sha256: STREAMING-UNSIGNED-PAYLOAD-TRAILER" \
  -H "X-Amz-Date: 20250402T102849Z" \
  -H "X-Amz-Decoded-Content-Length: 8" \
  -H "X-Amz-Sdk-Checksum-Algorithm: CRC32" \
  -H "X-Amz-Trailer: x-amz-checksum-crc32" \
  -H "X-Forwarded-For: 10.134.15.132" \
  -H "X-Forwarded-Host: minio-dev-lark.arc-unified-ai.condenser.arc.ucl.ac.uk" \
  -H "X-Forwarded-Port: 443" \
  -H "X-Forwarded-Proto: https" \
  -H "X-Forwarded-Scheme: https" \
  -H "X-Real-Ip: 10.134.15.132" \
  -H "X-Request-Id: 76cc1b369effb9705e95051cf7fc673b" \
  -H "X-Scheme: https" \
  --data-binary $'8\r\nfoobar!\n\r\n0\r\nx-amz-checksum-crc32:rK0DXg==\r\n\r\n'
