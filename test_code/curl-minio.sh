#!/bin/bash
endpoint=${endpoint:-http://127.0.0.1:9000}
userid=${userid:-rootuser}
bucket=${bucket:-test}
objectname=${objectname:-test-curl.txt}
date=${date:-$(date -u +"%Y%m%d")}
time=${time:-$(date -u +"%H%M%S")}

curl -k -X PUT "${endpoint}/${bucket}/${objectname}" \
  -H "Accept-Encoding: identity" \
  -H "Amz-Sdk-Invocation-Id: deadbeef-dead-beef-beef-deadbeefbeef" \
  -H "Amz-Sdk-Request: attempt=1" \
  -H "Authorization: AWS4-HMAC-SHA256 Credential=${userid}/${date}/us-east-1/s3/aws4_request, SignedHeaders=invalidheader, Signature=deadbeefdeadbeefdeadbeeddeadbeeddeadbeefdeadbeefdeadbeefdeadbeef" \
  -H "Content-Encoding: aws-chunked" \
  -H "Content-Length: 49" \
  -H "Host: this.host.does.not.exist" \
  -H "User-Agent: A malicious shell script" \
  -H "X-Amz-Content-Sha256: STREAMING-UNSIGNED-PAYLOAD-TRAILER" \
  -H "X-Amz-Date: ${date}T${time}Z" \
  -H "X-Amz-Decoded-Content-Length: 8" \
  -H "X-Amz-Trailer: x-amz-checksum-crc32" \
  --data-binary $'8\r\nfoobar!\n\r\n0\r\nx-amz-checksum-crc32:rK0DXg==\r\n\r\n'