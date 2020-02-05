CLUSTER_NAME := kubectl-tree-e2e-test
OUTPUT_DIR := $(CURDIR)/output

KUBECONFIG := $(OUTPUT_DIR)/kubeconfig.yaml
export KUBECONFIG

.PHONY: test
test: cluster
	# run kubectl-tree
	kubectl tree -n echoserver deployment echoserver | tee $(OUTPUT_DIR)/actual
	# make sure the output contains the expected lines
	egrep --color '^echoserver +Deployment/echoserver' $(OUTPUT_DIR)/actual
	egrep --color '^echoserver +└─ReplicaSet/echoserver-' $(OUTPUT_DIR)/actual
	egrep --color '^echoserver +└─Pod/echoserver-' $(OUTPUT_DIR)/actual

.PHONY: cluster
cluster: $(OUTPUT_DIR)/kubeconfig.yaml
$(OUTPUT_DIR)/kubeconfig.yaml:
	# create a cluster
	kind create cluster --name $(CLUSTER_NAME)
	kubectl cluster-info
	# deploy the echoserver
	kubectl apply -f fixture.yaml
	# wait for the deployment
	kubectl -n echoserver rollout status deployment/echoserver

.PHONY: clean
clean:
	-rm -r $(OUTPUT_DIR)

.PHONY: delete-cluster
delete-cluster:
	kind delete cluster --name $(CLUSTER_NAME)
	-rm $(KUBECONFIG)
