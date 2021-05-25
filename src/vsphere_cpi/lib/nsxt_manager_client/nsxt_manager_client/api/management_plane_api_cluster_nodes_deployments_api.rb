=begin
#NSX-T Manager API

#VMware NSX-T Manager REST API

OpenAPI spec version: 2.5.1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.19

=end

require 'uri'

module NSXT
  class ManagementPlaneApiClusterNodesDeploymentsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Deploy and register a cluster node VM
    # Deploys a cluster node VM as specified by the deployment config. Once the VM is deployed and powered on, it will automatically join the existing cluster. 
    # @param add_cluster_node_vm_info 
    # @param [Hash] opts the optional parameters
    # @return [ClusterNodeVMDeploymentRequestList]
    def add_cluster_node_vm(add_cluster_node_vm_info, opts = {})
      data, _status_code, _headers = add_cluster_node_vm_with_http_info(add_cluster_node_vm_info, opts)
      data
    end

    # Deploy and register a cluster node VM
    # Deploys a cluster node VM as specified by the deployment config. Once the VM is deployed and powered on, it will automatically join the existing cluster. 
    # @param add_cluster_node_vm_info 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ClusterNodeVMDeploymentRequestList, Fixnum, Hash)>] ClusterNodeVMDeploymentRequestList data, response status code and response headers
    def add_cluster_node_vm_with_http_info(add_cluster_node_vm_info, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagementPlaneApiClusterNodesDeploymentsApi.add_cluster_node_vm ...'
      end
      # verify the required parameter 'add_cluster_node_vm_info' is set
      if @api_client.config.client_side_validation && add_cluster_node_vm_info.nil?
        fail ArgumentError, "Missing the required parameter 'add_cluster_node_vm_info' when calling ManagementPlaneApiClusterNodesDeploymentsApi.add_cluster_node_vm"
      end
      # resource path
      local_var_path = '/cluster/nodes/deployments'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(add_cluster_node_vm_info)
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ClusterNodeVMDeploymentRequestList')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagementPlaneApiClusterNodesDeploymentsApi#add_cluster_node_vm\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Attempt to delete an auto-deployed cluster node VM
    # Attempts to unregister and undeploy a specified auto-deployed cluster node VM. If it is a member of a cluster, then the VM will be automatically detached from the cluster before being unregistered and undeployed. Alternatively, if the original deployment attempt failed or the VM is not found, cleans up the deployment information associated with the deployment attempt. Note: If a VM has been successfully auto-deployed, then the associated deployment information will not be deleted unless and until the VM is successfully deleted. 
    # @param node_id 
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :force_delete Delete by force
    # @return [nil]
    def delete_auto_deployed_cluster_node_vm_delete(node_id, opts = {})
      delete_auto_deployed_cluster_node_vm_delete_with_http_info(node_id, opts)
      nil
    end

    # Attempt to delete an auto-deployed cluster node VM
    # Attempts to unregister and undeploy a specified auto-deployed cluster node VM. If it is a member of a cluster, then the VM will be automatically detached from the cluster before being unregistered and undeployed. Alternatively, if the original deployment attempt failed or the VM is not found, cleans up the deployment information associated with the deployment attempt. Note: If a VM has been successfully auto-deployed, then the associated deployment information will not be deleted unless and until the VM is successfully deleted. 
    # @param node_id 
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :force_delete Delete by force
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_auto_deployed_cluster_node_vm_delete_with_http_info(node_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagementPlaneApiClusterNodesDeploymentsApi.delete_auto_deployed_cluster_node_vm_delete ...'
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling ManagementPlaneApiClusterNodesDeploymentsApi.delete_auto_deployed_cluster_node_vm_delete"
      end
      # resource path
      local_var_path = '/cluster/nodes/deployments/{node-id}?action=delete'.sub('{' + 'node-id' + '}', node_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'force_delete'] = opts[:'force_delete'] if !opts[:'force_delete'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagementPlaneApiClusterNodesDeploymentsApi#delete_auto_deployed_cluster_node_vm_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Synchronizes the repository data between nsx managers.
    # Returns the synchronization status for the manager represented by given <node-id>. 
    # @param node_id 
    # @param [Hash] opts the optional parameters
    # @return [RepoSyncStatusReport]
    def get_repo_sync_status(node_id, opts = {})
      data, _status_code, _headers = get_repo_sync_status_with_http_info(node_id, opts)
      data
    end

    # Synchronizes the repository data between nsx managers.
    # Returns the synchronization status for the manager represented by given &lt;node-id&gt;. 
    # @param node_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(RepoSyncStatusReport, Fixnum, Hash)>] RepoSyncStatusReport data, response status code and response headers
    def get_repo_sync_status_with_http_info(node_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagementPlaneApiClusterNodesDeploymentsApi.get_repo_sync_status ...'
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling ManagementPlaneApiClusterNodesDeploymentsApi.get_repo_sync_status"
      end
      # resource path
      local_var_path = '/cluster/nodes/{node-id}/repo_sync/status'.sub('{' + 'node-id' + '}', node_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RepoSyncStatusReport')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagementPlaneApiClusterNodesDeploymentsApi#get_repo_sync_status\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Returns info for all cluster node VM auto-deployment attempts
    # Returns request information for every attempted deployment of a cluster node VM. 
    # @param [Hash] opts the optional parameters
    # @return [ClusterNodeVMDeploymentRequestList]
    def list_cluster_node_vm_deployment_requests(opts = {})
      data, _status_code, _headers = list_cluster_node_vm_deployment_requests_with_http_info(opts)
      data
    end

    # Returns info for all cluster node VM auto-deployment attempts
    # Returns request information for every attempted deployment of a cluster node VM. 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ClusterNodeVMDeploymentRequestList, Fixnum, Hash)>] ClusterNodeVMDeploymentRequestList data, response status code and response headers
    def list_cluster_node_vm_deployment_requests_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagementPlaneApiClusterNodesDeploymentsApi.list_cluster_node_vm_deployment_requests ...'
      end
      # resource path
      local_var_path = '/cluster/nodes/deployments'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ClusterNodeVMDeploymentRequestList')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagementPlaneApiClusterNodesDeploymentsApi#list_cluster_node_vm_deployment_requests\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Synchronizes the repository data between nsx managers.
    # Attempts to synchronize the repository partition on nsx manager. Repository partition contains packages required for the install and upgrade of nsx components.Normally there is no need to call this API explicitely by the user. 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def perform_repo_sync_repo_sync(opts = {})
      perform_repo_sync_repo_sync_with_http_info(opts)
      nil
    end

    # Synchronizes the repository data between nsx managers.
    # Attempts to synchronize the repository partition on nsx manager. Repository partition contains packages required for the install and upgrade of nsx components.Normally there is no need to call this API explicitely by the user. 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def perform_repo_sync_repo_sync_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagementPlaneApiClusterNodesDeploymentsApi.perform_repo_sync_repo_sync ...'
      end
      # resource path
      local_var_path = '/cluster/node?action=repo_sync'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagementPlaneApiClusterNodesDeploymentsApi#perform_repo_sync_repo_sync\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Returns info for a cluster-node VM auto-deployment attempt
    # Returns deployment request information for a specific attempted deployment of a cluster node VM. 
    # @param node_id 
    # @param [Hash] opts the optional parameters
    # @return [ClusterNodeVMDeploymentRequest]
    def read_cluster_node_vm_deployment_request(node_id, opts = {})
      data, _status_code, _headers = read_cluster_node_vm_deployment_request_with_http_info(node_id, opts)
      data
    end

    # Returns info for a cluster-node VM auto-deployment attempt
    # Returns deployment request information for a specific attempted deployment of a cluster node VM. 
    # @param node_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ClusterNodeVMDeploymentRequest, Fixnum, Hash)>] ClusterNodeVMDeploymentRequest data, response status code and response headers
    def read_cluster_node_vm_deployment_request_with_http_info(node_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagementPlaneApiClusterNodesDeploymentsApi.read_cluster_node_vm_deployment_request ...'
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling ManagementPlaneApiClusterNodesDeploymentsApi.read_cluster_node_vm_deployment_request"
      end
      # resource path
      local_var_path = '/cluster/nodes/deployments/{node-id}'.sub('{' + 'node-id' + '}', node_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ClusterNodeVMDeploymentRequest')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagementPlaneApiClusterNodesDeploymentsApi#read_cluster_node_vm_deployment_request\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Returns the status of the VM creation/deletion
    # Returns the current deployment or undeployment status for a VM along with any other relevant current information, such as error messages. 
    # @param node_id 
    # @param [Hash] opts the optional parameters
    # @return [ClusterNodeVMDeploymentStatusReport]
    def read_cluster_node_vm_deployment_status(node_id, opts = {})
      data, _status_code, _headers = read_cluster_node_vm_deployment_status_with_http_info(node_id, opts)
      data
    end

    # Returns the status of the VM creation/deletion
    # Returns the current deployment or undeployment status for a VM along with any other relevant current information, such as error messages. 
    # @param node_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ClusterNodeVMDeploymentStatusReport, Fixnum, Hash)>] ClusterNodeVMDeploymentStatusReport data, response status code and response headers
    def read_cluster_node_vm_deployment_status_with_http_info(node_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ManagementPlaneApiClusterNodesDeploymentsApi.read_cluster_node_vm_deployment_status ...'
      end
      # verify the required parameter 'node_id' is set
      if @api_client.config.client_side_validation && node_id.nil?
        fail ArgumentError, "Missing the required parameter 'node_id' when calling ManagementPlaneApiClusterNodesDeploymentsApi.read_cluster_node_vm_deployment_status"
      end
      # resource path
      local_var_path = '/cluster/nodes/deployments/{node-id}/status'.sub('{' + 'node-id' + '}', node_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ClusterNodeVMDeploymentStatusReport')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ManagementPlaneApiClusterNodesDeploymentsApi#read_cluster_node_vm_deployment_status\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end