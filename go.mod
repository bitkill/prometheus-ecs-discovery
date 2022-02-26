module github.com/teralytics/prometheus-ecs-discovery

go 1.15

require (
	github.com/aws/aws-sdk-go-v2/config v1.1.4
	github.com/aws/aws-sdk-go-v2/credentials v1.1.4
	github.com/aws/aws-sdk-go-v2/internal/ini v1.3.6 // indirect
	github.com/aws/aws-sdk-go-v2/service/ec2 v1.3.0
	github.com/aws/aws-sdk-go-v2/service/ecs v1.17.0
	github.com/aws/aws-sdk-go-v2/service/sts v1.15.0
	github.com/aws/smithy-go v1.11.0
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/go-yaml/yaml v2.1.0+incompatible
)
