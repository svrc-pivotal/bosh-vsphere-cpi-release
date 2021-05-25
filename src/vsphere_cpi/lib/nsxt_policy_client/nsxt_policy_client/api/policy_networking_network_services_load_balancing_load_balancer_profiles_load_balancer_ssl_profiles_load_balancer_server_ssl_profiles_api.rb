=begin
#NSX-T Data Center Policy API

#VMware NSX-T Data Center Policy REST API

OpenAPI spec version: 3.1.0.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.19

=end

require 'uri'

module NSXTPolicy
  class PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Delete LBServerSslProfile and all the entities contained by this LBServerSslProfile 
    # Delete the LBServerSslProfile along with all the entities contained by this LBServerSslProfile. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :force Force delete the resource even if it is being used somewhere  (default to false)
    # @return [nil]
    def delete_lb_server_ssl_profile(lb_server_ssl_profile_id, opts = {})
      delete_lb_server_ssl_profile_with_http_info(lb_server_ssl_profile_id, opts)
      nil
    end

    # Delete LBServerSslProfile and all the entities contained by this LBServerSslProfile 
    # Delete the LBServerSslProfile along with all the entities contained by this LBServerSslProfile. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :force Force delete the resource even if it is being used somewhere 
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_lb_server_ssl_profile_with_http_info(lb_server_ssl_profile_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.delete_lb_server_ssl_profile ...'
      end
      # verify the required parameter 'lb_server_ssl_profile_id' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile_id.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile_id' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.delete_lb_server_ssl_profile"
      end
      # resource path
      local_var_path = '/global-infra/lb-server-ssl-profiles/{lb-server-ssl-profile-id}'.sub('{' + 'lb-server-ssl-profile-id' + '}', lb_server_ssl_profile_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'force'] = opts[:'force'] if !opts[:'force'].nil?

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
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#delete_lb_server_ssl_profile\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Delete LBServerSslProfile and all the entities contained by this LBServerSslProfile 
    # Delete the LBServerSslProfile along with all the entities contained by this LBServerSslProfile. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :force Force delete the resource even if it is being used somewhere  (default to false)
    # @return [nil]
    def delete_lb_server_ssl_profile_0(lb_server_ssl_profile_id, opts = {})
      delete_lb_server_ssl_profile_0_with_http_info(lb_server_ssl_profile_id, opts)
      nil
    end

    # Delete LBServerSslProfile and all the entities contained by this LBServerSslProfile 
    # Delete the LBServerSslProfile along with all the entities contained by this LBServerSslProfile. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :force Force delete the resource even if it is being used somewhere 
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_lb_server_ssl_profile_0_with_http_info(lb_server_ssl_profile_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.delete_lb_server_ssl_profile_0 ...'
      end
      # verify the required parameter 'lb_server_ssl_profile_id' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile_id.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile_id' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.delete_lb_server_ssl_profile_0"
      end
      # resource path
      local_var_path = '/infra/lb-server-ssl-profiles/{lb-server-ssl-profile-id}'.sub('{' + 'lb-server-ssl-profile-id' + '}', lb_server_ssl_profile_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'force'] = opts[:'force'] if !opts[:'force'].nil?

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
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#delete_lb_server_ssl_profile_0\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List LBServerSslProfiles
    # Paginated list of all LBServerSslProfiles. 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :cursor Opaque cursor to be used for getting next page of records (supplied by current result page)
    # @option opts [BOOLEAN] :include_mark_for_delete_objects Include objects that are marked for deletion in results (default to false)
    # @option opts [String] :included_fields Comma separated list of fields that should be included in query result
    # @option opts [Integer] :page_size Maximum number of results to return in this page (server may return fewer) (default to 1000)
    # @option opts [BOOLEAN] :sort_ascending 
    # @option opts [String] :sort_by Field by which records are sorted
    # @return [LBServerSslProfileListResult]
    def list_lb_server_ssl_profiles(opts = {})
      data, _status_code, _headers = list_lb_server_ssl_profiles_with_http_info(opts)
      data
    end

    # List LBServerSslProfiles
    # Paginated list of all LBServerSslProfiles. 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :cursor Opaque cursor to be used for getting next page of records (supplied by current result page)
    # @option opts [BOOLEAN] :include_mark_for_delete_objects Include objects that are marked for deletion in results
    # @option opts [String] :included_fields Comma separated list of fields that should be included in query result
    # @option opts [Integer] :page_size Maximum number of results to return in this page (server may return fewer)
    # @option opts [BOOLEAN] :sort_ascending 
    # @option opts [String] :sort_by Field by which records are sorted
    # @return [Array<(LBServerSslProfileListResult, Fixnum, Hash)>] LBServerSslProfileListResult data, response status code and response headers
    def list_lb_server_ssl_profiles_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.list_lb_server_ssl_profiles ...'
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 1000
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.list_lb_server_ssl_profiles, must be smaller than or equal to 1000.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 0
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.list_lb_server_ssl_profiles, must be greater than or equal to 0.'
      end

      # resource path
      local_var_path = '/global-infra/lb-server-ssl-profiles'

      # query parameters
      query_params = {}
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?
      query_params[:'include_mark_for_delete_objects'] = opts[:'include_mark_for_delete_objects'] if !opts[:'include_mark_for_delete_objects'].nil?
      query_params[:'included_fields'] = opts[:'included_fields'] if !opts[:'included_fields'].nil?
      query_params[:'page_size'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'sort_ascending'] = opts[:'sort_ascending'] if !opts[:'sort_ascending'].nil?
      query_params[:'sort_by'] = opts[:'sort_by'] if !opts[:'sort_by'].nil?

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
        :return_type => 'LBServerSslProfileListResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#list_lb_server_ssl_profiles\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List LBServerSslProfiles
    # Paginated list of all LBServerSslProfiles. 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :cursor Opaque cursor to be used for getting next page of records (supplied by current result page)
    # @option opts [BOOLEAN] :include_mark_for_delete_objects Include objects that are marked for deletion in results (default to false)
    # @option opts [String] :included_fields Comma separated list of fields that should be included in query result
    # @option opts [Integer] :page_size Maximum number of results to return in this page (server may return fewer) (default to 1000)
    # @option opts [BOOLEAN] :sort_ascending 
    # @option opts [String] :sort_by Field by which records are sorted
    # @return [LBServerSslProfileListResult]
    def list_lb_server_ssl_profiles_0(opts = {})
      data, _status_code, _headers = list_lb_server_ssl_profiles_0_with_http_info(opts)
      data
    end

    # List LBServerSslProfiles
    # Paginated list of all LBServerSslProfiles. 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :cursor Opaque cursor to be used for getting next page of records (supplied by current result page)
    # @option opts [BOOLEAN] :include_mark_for_delete_objects Include objects that are marked for deletion in results
    # @option opts [String] :included_fields Comma separated list of fields that should be included in query result
    # @option opts [Integer] :page_size Maximum number of results to return in this page (server may return fewer)
    # @option opts [BOOLEAN] :sort_ascending 
    # @option opts [String] :sort_by Field by which records are sorted
    # @return [Array<(LBServerSslProfileListResult, Fixnum, Hash)>] LBServerSslProfileListResult data, response status code and response headers
    def list_lb_server_ssl_profiles_0_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.list_lb_server_ssl_profiles_0 ...'
      end
      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] > 1000
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.list_lb_server_ssl_profiles_0, must be smaller than or equal to 1000.'
      end

      if @api_client.config.client_side_validation && !opts[:'page_size'].nil? && opts[:'page_size'] < 0
        fail ArgumentError, 'invalid value for "opts[:"page_size"]" when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.list_lb_server_ssl_profiles_0, must be greater than or equal to 0.'
      end

      # resource path
      local_var_path = '/infra/lb-server-ssl-profiles'

      # query parameters
      query_params = {}
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?
      query_params[:'include_mark_for_delete_objects'] = opts[:'include_mark_for_delete_objects'] if !opts[:'include_mark_for_delete_objects'].nil?
      query_params[:'included_fields'] = opts[:'included_fields'] if !opts[:'included_fields'].nil?
      query_params[:'page_size'] = opts[:'page_size'] if !opts[:'page_size'].nil?
      query_params[:'sort_ascending'] = opts[:'sort_ascending'] if !opts[:'sort_ascending'].nil?
      query_params[:'sort_by'] = opts[:'sort_by'] if !opts[:'sort_by'].nil?

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
        :return_type => 'LBServerSslProfileListResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#list_lb_server_ssl_profiles_0\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create or update a LBServerSslProfile
    # If a LBServerSslProfile with the lb-server-ssl-profile-id is not already present, create a new LBServerSslProfile. If it already exists, update the LBServerSslProfile. This is a full replace. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param lb_server_ssl_profile 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def patch_lb_server_ssl_profile(lb_server_ssl_profile_id, lb_server_ssl_profile, opts = {})
      patch_lb_server_ssl_profile_with_http_info(lb_server_ssl_profile_id, lb_server_ssl_profile, opts)
      nil
    end

    # Create or update a LBServerSslProfile
    # If a LBServerSslProfile with the lb-server-ssl-profile-id is not already present, create a new LBServerSslProfile. If it already exists, update the LBServerSslProfile. This is a full replace. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param lb_server_ssl_profile 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def patch_lb_server_ssl_profile_with_http_info(lb_server_ssl_profile_id, lb_server_ssl_profile, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.patch_lb_server_ssl_profile ...'
      end
      # verify the required parameter 'lb_server_ssl_profile_id' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile_id.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile_id' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.patch_lb_server_ssl_profile"
      end
      # verify the required parameter 'lb_server_ssl_profile' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.patch_lb_server_ssl_profile"
      end
      # resource path
      local_var_path = '/global-infra/lb-server-ssl-profiles/{lb-server-ssl-profile-id}'.sub('{' + 'lb-server-ssl-profile-id' + '}', lb_server_ssl_profile_id.to_s)

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
      post_body = @api_client.object_to_http_body(lb_server_ssl_profile)
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#patch_lb_server_ssl_profile\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create or update a LBServerSslProfile
    # If a LBServerSslProfile with the lb-server-ssl-profile-id is not already present, create a new LBServerSslProfile. If it already exists, update the LBServerSslProfile. This is a full replace. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param lb_server_ssl_profile 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def patch_lb_server_ssl_profile_0(lb_server_ssl_profile_id, lb_server_ssl_profile, opts = {})
      patch_lb_server_ssl_profile_0_with_http_info(lb_server_ssl_profile_id, lb_server_ssl_profile, opts)
      nil
    end

    # Create or update a LBServerSslProfile
    # If a LBServerSslProfile with the lb-server-ssl-profile-id is not already present, create a new LBServerSslProfile. If it already exists, update the LBServerSslProfile. This is a full replace. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param lb_server_ssl_profile 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def patch_lb_server_ssl_profile_0_with_http_info(lb_server_ssl_profile_id, lb_server_ssl_profile, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.patch_lb_server_ssl_profile_0 ...'
      end
      # verify the required parameter 'lb_server_ssl_profile_id' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile_id.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile_id' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.patch_lb_server_ssl_profile_0"
      end
      # verify the required parameter 'lb_server_ssl_profile' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.patch_lb_server_ssl_profile_0"
      end
      # resource path
      local_var_path = '/infra/lb-server-ssl-profiles/{lb-server-ssl-profile-id}'.sub('{' + 'lb-server-ssl-profile-id' + '}', lb_server_ssl_profile_id.to_s)

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
      post_body = @api_client.object_to_http_body(lb_server_ssl_profile)
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#patch_lb_server_ssl_profile_0\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Read LBServerSslProfile
    # Read a LBServerSslProfile. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param [Hash] opts the optional parameters
    # @return [LBServerSslProfile]
    def read_lb_server_ssl_profile(lb_server_ssl_profile_id, opts = {})
      data, _status_code, _headers = read_lb_server_ssl_profile_with_http_info(lb_server_ssl_profile_id, opts)
      data
    end

    # Read LBServerSslProfile
    # Read a LBServerSslProfile. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(LBServerSslProfile, Fixnum, Hash)>] LBServerSslProfile data, response status code and response headers
    def read_lb_server_ssl_profile_with_http_info(lb_server_ssl_profile_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.read_lb_server_ssl_profile ...'
      end
      # verify the required parameter 'lb_server_ssl_profile_id' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile_id.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile_id' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.read_lb_server_ssl_profile"
      end
      # resource path
      local_var_path = '/global-infra/lb-server-ssl-profiles/{lb-server-ssl-profile-id}'.sub('{' + 'lb-server-ssl-profile-id' + '}', lb_server_ssl_profile_id.to_s)

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
        :return_type => 'LBServerSslProfile')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#read_lb_server_ssl_profile\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Read LBServerSslProfile
    # Read a LBServerSslProfile. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param [Hash] opts the optional parameters
    # @return [LBServerSslProfile]
    def read_lb_server_ssl_profile_0(lb_server_ssl_profile_id, opts = {})
      data, _status_code, _headers = read_lb_server_ssl_profile_0_with_http_info(lb_server_ssl_profile_id, opts)
      data
    end

    # Read LBServerSslProfile
    # Read a LBServerSslProfile. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(LBServerSslProfile, Fixnum, Hash)>] LBServerSslProfile data, response status code and response headers
    def read_lb_server_ssl_profile_0_with_http_info(lb_server_ssl_profile_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.read_lb_server_ssl_profile_0 ...'
      end
      # verify the required parameter 'lb_server_ssl_profile_id' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile_id.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile_id' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.read_lb_server_ssl_profile_0"
      end
      # resource path
      local_var_path = '/infra/lb-server-ssl-profiles/{lb-server-ssl-profile-id}'.sub('{' + 'lb-server-ssl-profile-id' + '}', lb_server_ssl_profile_id.to_s)

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
        :return_type => 'LBServerSslProfile')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#read_lb_server_ssl_profile_0\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create or update a LBServerSslProfile
    # If a LBServerSslProfile with the lb-server-ssl-profile-id is not already present, create a new LBServerSslProfile. If it already exists, update the LBServerSslProfile. This is a full replace. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param lb_server_ssl_profile 
    # @param [Hash] opts the optional parameters
    # @return [LBServerSslProfile]
    def update_lb_server_ssl_profile(lb_server_ssl_profile_id, lb_server_ssl_profile, opts = {})
      data, _status_code, _headers = update_lb_server_ssl_profile_with_http_info(lb_server_ssl_profile_id, lb_server_ssl_profile, opts)
      data
    end

    # Create or update a LBServerSslProfile
    # If a LBServerSslProfile with the lb-server-ssl-profile-id is not already present, create a new LBServerSslProfile. If it already exists, update the LBServerSslProfile. This is a full replace. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param lb_server_ssl_profile 
    # @param [Hash] opts the optional parameters
    # @return [Array<(LBServerSslProfile, Fixnum, Hash)>] LBServerSslProfile data, response status code and response headers
    def update_lb_server_ssl_profile_with_http_info(lb_server_ssl_profile_id, lb_server_ssl_profile, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.update_lb_server_ssl_profile ...'
      end
      # verify the required parameter 'lb_server_ssl_profile_id' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile_id.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile_id' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.update_lb_server_ssl_profile"
      end
      # verify the required parameter 'lb_server_ssl_profile' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.update_lb_server_ssl_profile"
      end
      # resource path
      local_var_path = '/global-infra/lb-server-ssl-profiles/{lb-server-ssl-profile-id}'.sub('{' + 'lb-server-ssl-profile-id' + '}', lb_server_ssl_profile_id.to_s)

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
      post_body = @api_client.object_to_http_body(lb_server_ssl_profile)
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'LBServerSslProfile')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#update_lb_server_ssl_profile\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create or update a LBServerSslProfile
    # If a LBServerSslProfile with the lb-server-ssl-profile-id is not already present, create a new LBServerSslProfile. If it already exists, update the LBServerSslProfile. This is a full replace. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param lb_server_ssl_profile 
    # @param [Hash] opts the optional parameters
    # @return [LBServerSslProfile]
    def update_lb_server_ssl_profile_0(lb_server_ssl_profile_id, lb_server_ssl_profile, opts = {})
      data, _status_code, _headers = update_lb_server_ssl_profile_0_with_http_info(lb_server_ssl_profile_id, lb_server_ssl_profile, opts)
      data
    end

    # Create or update a LBServerSslProfile
    # If a LBServerSslProfile with the lb-server-ssl-profile-id is not already present, create a new LBServerSslProfile. If it already exists, update the LBServerSslProfile. This is a full replace. 
    # @param lb_server_ssl_profile_id LBServerSslProfile ID
    # @param lb_server_ssl_profile 
    # @param [Hash] opts the optional parameters
    # @return [Array<(LBServerSslProfile, Fixnum, Hash)>] LBServerSslProfile data, response status code and response headers
    def update_lb_server_ssl_profile_0_with_http_info(lb_server_ssl_profile_id, lb_server_ssl_profile, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.update_lb_server_ssl_profile_0 ...'
      end
      # verify the required parameter 'lb_server_ssl_profile_id' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile_id.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile_id' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.update_lb_server_ssl_profile_0"
      end
      # verify the required parameter 'lb_server_ssl_profile' is set
      if @api_client.config.client_side_validation && lb_server_ssl_profile.nil?
        fail ArgumentError, "Missing the required parameter 'lb_server_ssl_profile' when calling PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi.update_lb_server_ssl_profile_0"
      end
      # resource path
      local_var_path = '/infra/lb-server-ssl-profiles/{lb-server-ssl-profile-id}'.sub('{' + 'lb-server-ssl-profile-id' + '}', lb_server_ssl_profile_id.to_s)

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
      post_body = @api_client.object_to_http_body(lb_server_ssl_profile)
      auth_names = ['BasicAuth']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'LBServerSslProfile')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PolicyNetworkingNetworkServicesLoadBalancingLoadBalancerProfilesLoadBalancerSSLProfilesLoadBalancerServerSSLProfilesApi#update_lb_server_ssl_profile_0\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end