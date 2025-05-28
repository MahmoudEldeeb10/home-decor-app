#!/bin/bash

#chmod +x scripts/create_feature.sh
#./scripts/create_feature.sh chat


# --------- COLORS ---------
GREEN=$'\033[0;32m'
RED=$'\033[0;91m'
NC=$'\033[0m' # No Color

# --------- INPUT ---------
if [ -z "$1" ]; then
  echo "${RED}❌ Please provide a feature name.${NC}"
  echo "Usage: ./scripts/create_feature.sh chat"
  exit 1
fi

FEATURE_NAME=$1
BASE_PATH="lib/src/features/$FEATURE_NAME"

# --------- FOLDERS ---------
echo "${GREEN}✅ Creating folders for feature: $FEATURE_NAME...${NC}"

mkdir -p $BASE_PATH/domain/entities
mkdir -p $BASE_PATH/domain/repositories
mkdir -p $BASE_PATH/domain/usecases

mkdir -p $BASE_PATH/data/models
mkdir -p $BASE_PATH/data/datasources
mkdir -p $BASE_PATH/data/repositories

mkdir -p $BASE_PATH/presentation/manager/bloc
mkdir -p $BASE_PATH/presentation/pages
mkdir -p $BASE_PATH/presentation/widgets

# --------- DUMMY FILES ---------
touch $BASE_PATH/domain/entities/${FEATURE_NAME}_entity.dart
touch $BASE_PATH/domain/repositories/${FEATURE_NAME}_repository.dart
touch $BASE_PATH/domain/usecases/${FEATURE_NAME}_usecase.dart

touch $BASE_PATH/data/models/${FEATURE_NAME}_model.dart
touch $BASE_PATH/data/datasources/${FEATURE_NAME}_remote_datasource.dart
touch $BASE_PATH/data/repositories/${FEATURE_NAME}_repository_impl.dart

touch $BASE_PATH/presentation/manager/bloc/${FEATURE_NAME}_event.dart
touch $BASE_PATH/presentation/manager/bloc/${FEATURE_NAME}_state.dart
touch $BASE_PATH/presentation/manager/bloc/${FEATURE_NAME}_bloc.dart

touch $BASE_PATH/presentation/pages/${FEATURE_NAME}_page.dart
touch $BASE_PATH/presentation/widgets/${FEATURE_NAME}_widget.dart

echo "${GREEN}🎉 Feature '$FEATURE_NAME' created successfully!${NC}"
