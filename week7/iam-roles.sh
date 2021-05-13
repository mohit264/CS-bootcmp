aws iam create-user --user-name mvd
aws iam create-group --group-name mvd-group
AWS iam add-user-to-group --user-name mvd --group-name mvd-group