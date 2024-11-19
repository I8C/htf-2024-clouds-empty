#$STACK_NAME="HTF23-i8c-<<GroupName>>-Stack"
$STACK_NAME="HTF24-i8c-TeamName-Stack"
$MY_REGION="eu-central-1"
$MY_DEV_BUCKET="htf24-cloudformation-bucket2"

$AWS_PROFILE="default"

# Package the cloudformation package
aws cloudformation package --template ./cfn-students.yml --s3-bucket $MY_DEV_BUCKET --output-template ./cfn-students-export.yml

# Deploy the package
sam deploy --template-file ./cfn-students-export.yml --stack-name $STACK_NAME --capabilities CAPABILITY_NAMED_IAM --region $MY_REGION
