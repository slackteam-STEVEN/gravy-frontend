#!/bin/zsh
# アップロード対象バケット名
BUCKET=gravy-cloudfront
# AWS cliのプロファイル
PROFILE=default
# nuxt.jsの前のコンテンツ削除
rm -rf dist
# nuxt.jsのコンテンツ作成
npm run build
# .DS_Store削除
rm dist/.DS_Store
# S3バケット内の前のコンテンツ削除
aws s3 rm "s3://${BUCKET}/" --include '*' --recursive --profile ${PROFILE}
# S3バケット内にコンテンツ配置
aws s3 cp ./dist "s3://${BUCKET}/" --recursive --profile ${PROFILE}
