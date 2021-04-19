existed=$(eksctl get cluster | egrep -i -o 'EKS-cluster')

if [[ $existed == *"EKS-cluster"* ]];then
    echo 'eksctl cluster existed and update config'
    aws eks --region $AWS_DEFAULT_REGION update-kubeconfig --name EKS-cluster
    exit 0;
else
    echo 'eksctl cluster not existed'
    eksctl create cluster -f .circleci/eks.yml
fi