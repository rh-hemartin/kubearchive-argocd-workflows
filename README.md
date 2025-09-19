# KubeArchive for ArgoCD Workflows

It needs at least Kubernetes 1.30, so you may need to update your `kind` version:


```
kind create cluster
bash install.sh
bash run.sh
```

```
<...a bunch of omitted output...>
   kind   | namespace |       name        
----------+-----------+-------------------
 Workflow | argo      | hello-world-6rkkn
 Pod      | argo      | hello-world-6rkkn
(2 rows)
```
