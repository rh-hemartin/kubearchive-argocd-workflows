# KubeArchive for KubeFlow

It needs at least Kubernetes 1.30, so you may need to update your `kind` version:


```
kind create cluster
bash install.sh

python -m venv venv
source venv/bin/activate
python -m pip install -r requirements.txt
bash run.sh
```

```
<...a bunch of omitted output...>
kind   | namespace |                       name
----------+-----------+---------------------------------------------------
Workflow | kubeflow  | hello-pipeline-rnsv2
Workflow | kubeflow  | hello-pipeline-g8j4d
Pod      | kubeflow  | hello-pipeline-g8j4d-system-dag-driver-1598473481
Pod      | kubeflow  | hello-pipeline-rnsv2-system-dag-driver-3873569999
(4 rows)
```
