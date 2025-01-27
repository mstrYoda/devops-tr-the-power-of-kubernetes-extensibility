CLUSTER_NAME = vault-csi-provider-demo

GREEN=\033[0;32m

.PHONY: create-cluster setup-vault setup-secrets-store-csi-driver

create-cluster:
	@echo "$(GREEN) gcloud container clusters create $(CLUSTER_NAME) \n"
	@read -n 1 -s -r -p "Press any key to continue"
	@echo "\n"
	@gcloud container clusters create $(CLUSTER_NAME)

setup-vault:
	@echo "$(GREEN) $ ./scripts/setup-vault.sh \n"
	@sh ./scripts/setup-vault.sh

setup-secrets-store-csi-driver:
	@echo "$(GREEN) $ ./scripts/setup-secrets-store-csi-driver.sh \n"
	@sh ./scripts/setup-secrets-store-csi-driver.sh

test:
	@echo "$(GREEN) $ ./scripts/test.sh \n"
	@sh ./scripts/test.sh
