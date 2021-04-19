existed=$(eksctl get cluster | egrep -i -o 'EKS-cluster')

if [[ $existed == *"EKS-cluster"* ]];then
    echo 'eksctl cluster existed'
    exit 0;
else
    echo 'eksctl cluster not existed'
    eksctl create cluster -f .circleci/eks.yaml
fi