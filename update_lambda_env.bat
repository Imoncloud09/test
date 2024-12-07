@echo off
REM Simple script to change environment variables for an AWS Lambda function

REM Set variables
set FUNCTION_NAME=test_function
set REGION=us-east-2

REM Check if AWS CLI is installed
aws --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo AWS CLI not found. Please install AWS CLI and try again.
    exit /b 1
)

REM Update environment variables for the Lambda function
aws lambda update-function-configuration ^
    --function-name %FUNCTION_NAME% ^
    --environment "Variables={MAINTENANCE=false}" ^
    --region %REGION%

REM Check if the update was successful
if %ERRORLEVEL% neq 0 (
    echo Failed to update environment variables for %FUNCTION_NAME%.
    exit /b 1
)

echo Environment variables updated successfully for %FUNCTION_NAME%.
