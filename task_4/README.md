### Homework
* Create users deploy_view and deploy_edit. Give the user deploy_view rights only to view deployments, pods. Give the user deploy_edit full rights to the objects deployments, pods.
```bash
openssl genrsa -out deploy_view.key 2048
openssl genrsa -out deploy_edit.key 2048

openssl req -new -key deploy_view.key -out deploy_view.csr -subj "/CN=deploy_view"
openssl req -new -key deploy_edit.key -out deploy_edit.csr -subj "/CN=deploy_edit"

openssl x509 -req -in deploy_view.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out deploy_view.crt -days 500
openssl x509 -req -in deploy_edit.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out deploy_edit.crt -days 500

kubectl config set-credentials deploy_view --client-certificate=deploy_view.crt --client-key=deploy_view.key
kubectl config set-credentials deploy_edit --client-certificate=deploy_edit.crt --client-key=deploy_edit.key

kubectl config set-context deploy_view --cluster=minikube --user=deploy_view
kubectl config set-context deploy_edit --cluster=minikube --user=deploy_edit
```
![alt tag](screenshots/task4_1_1.png)

```bash
kubectl apply -f 1_1_CreateRoles.yaml
kubectl apply -f 1_2_BindRoles.yaml
```
![alt tag](screenshots/task4_1_2.png)
Okay, now let's check it out:
![alt tag](screenshots/task4_1_3.png)

* Create namespace prod. Create users prod_admin, prod_view. Give the user prod_admin admin rights on ns prod, give the user prod_view only view rights on namespace prod.
* Create a serviceAccount sa-namespace-admin. Grant full rights to namespace default. Create context, authorize using the created sa, check accesses.
```bash
¯\_(ツ)_/¯
```
