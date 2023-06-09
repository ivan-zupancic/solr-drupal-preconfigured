# Stage 1: Build stage
FROM docker.io/bitnami/solr:8 as builder
LABEL stage=builder

# Set the SOLR_CORE_CONF_DIR to a temporary directory
ENV SOLR_CORE_CONF_DIR=/tmp/search_api_solr_4

# Copy the SOLR_CORE_CONF_DIR from the host to the container
COPY ./solr_drupal_config ${SOLR_CORE_CONF_DIR}

# Stage 2: Final stage
FROM docker.io/bitnami/solr:8

# Copy the SOLR_CORE_CONF_DIR from the builder stage to the final image
COPY --from=builder /tmp/search_api_solr_4 /data/search_api_solr_4