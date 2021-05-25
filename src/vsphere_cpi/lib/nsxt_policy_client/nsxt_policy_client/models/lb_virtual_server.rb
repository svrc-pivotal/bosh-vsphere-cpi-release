=begin
#NSX-T Data Center Policy API

#VMware NSX-T Data Center Policy REST API

OpenAPI spec version: 3.1.0.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.19

=end

require 'date'

module NSXTPolicy
  # All the types of LBVirtualServer extend from this abstract class. This is present for extensibility. 
  class LBVirtualServer
    # Link to this resource
    attr_accessor :_self

    # The server will populate this field when returing the resource. Ignored on PUT and POST.
    attr_accessor :_links

    # Schema for this resource
    attr_accessor :_schema

    # The _revision property describes the current revision of the resource. To prevent clients from overwriting each other's changes, PUT operations must include the current _revision of the resource, which clients should obtain by issuing a GET operation. If the _revision provided in a PUT request is missing or stale, the operation will be rejected.
    attr_accessor :_revision

    # Indicates system owned resource
    attr_accessor :_system_owned

    # Defaults to ID if not set
    attr_accessor :display_name

    # Description of this resource
    attr_accessor :description

    # Opaque identifiers meaningful to the API user
    attr_accessor :tags

    # ID of the user who created this resource
    attr_accessor :_create_user

    # Protection status is one of the following: PROTECTED - the client who retrieved the entity is not allowed             to modify it. NOT_PROTECTED - the client who retrieved the entity is allowed                 to modify it REQUIRE_OVERRIDE - the client who retrieved the entity is a super                    user and can modify it, but only when providing                    the request header X-Allow-Overwrite=true. UNKNOWN - the _protection field could not be determined for this           entity. 
    attr_accessor :_protection

    # Timestamp of resource creation
    attr_accessor :_create_time

    # Timestamp of last modification
    attr_accessor :_last_modified_time

    # ID of the user who last modified this resource
    attr_accessor :_last_modified_user

    # Unique identifier of this resource
    attr_accessor :id

    # The type of this resource.
    attr_accessor :resource_type

    # Absolute path of this object
    attr_accessor :path

    # Path of its parent
    attr_accessor :parent_path

    # This is a UUID generated by the GM/LM to uniquely identify entites in a federated environment. For entities that are stretched across multiple sites, the same ID will be used on all the stretched sites. 
    attr_accessor :unique_id

    # Path relative from its parent
    attr_accessor :relative_path

    # subtree for this type within policy tree containing nested elements. 
    attr_accessor :children

    # Global intent objects cannot be modified by the user. However, certain global intent objects can be overridden locally by use of this property. In such cases, the overridden local values take precedence over the globally defined values for the properties. 
    attr_accessor :overridden

    # Intent objects are not directly deleted from the system when a delete is invoked on them. They are marked for deletion and only when all the realized entities for that intent object gets deleted, the intent object is deleted. Objects that are marked for deletion are not returned in GET call. One can use the search API to get these objects. 
    attr_accessor :marked_for_delete

    # Path to optional object that enables persistence on a virtual server allowing related client connections to be sent to the same backend server. Persistence is disabled by default. 
    attr_accessor :lb_persistence_profile_path

    # Specifies the access list control to define how to filter the connections from clients. 
    attr_accessor :access_list_control

    # The server pool(LBPool) contains backend servers. Server pool consists of one or more servers, also referred to as pool members, that are similarly configured and are running the same application. 
    attr_accessor :pool_path

    # The property log_significant_event_only can take effect only when access_log_enabled is true. If log_significant_event_only is true, significant events are logged in access log. For L4 virtual server, significant event means unsuccessful(error or dropped) TCP/UDP connections. For L7 virtual server, significant event means unsuccessful connections or HTTP/HTTPS requests which have error response code(e.g. 4xx, 5xx). 
    attr_accessor :log_significant_event_only

    # Load balancer rules allow customization of load balancing behavior using match/action rules. Currently, load balancer rules are supported for only layer 7 virtual servers with LBHttpProfile. 
    attr_accessor :rules

    # Default pool member ports when member port is not defined. 
    attr_accessor :default_pool_member_ports

    # The setting is used when load balancer acts as an SSL client and establishing a connection to the backend server. 
    attr_accessor :server_ssl_profile_binding

    # The application profile defines the application protocol characteristics. It is used to influence how load balancing is performed. Currently, LBFastTCPProfile, LBFastUDPProfile and LBHttpProfile, etc are supported. 
    attr_accessor :application_profile_path

    # If access log is enabled, all HTTP requests sent to L7 virtual server are logged to the access log file. Both successful returns information responses(1xx), successful responses(2xx), redirection messages(3xx) and unsuccessful requests, backend server returns 4xx or 5xx, are logged to access log, if enabled. All L4 virtual server connections are also logged to the access log if enabled. The non-significant events such as successful requests are not logged if log_significant_event_only is set to true. 
    attr_accessor :access_log_enabled

    # To ensure one virtual server does not over consume resources, affecting other applications hosted on the same LBS, connections to a virtual server can be capped. If it is not specified, it means that connections are unlimited. 
    attr_accessor :max_concurrent_connections

    # To ensure one virtual server does not over consume resources, connections to a member can be rate limited. If it is not specified, it means that connection rate is unlimited. 
    attr_accessor :max_new_connection_rate

    # virtual servers can be associated to LBService(which is similar to physical/virtual load balancer), LB virtual servers, pools and other entities could be defined independently, the LBService identifier list here would be used to maintain the relationship of LBService and other LB entities. 
    attr_accessor :lb_service_path

    # The setting is used when load balancer acts as an SSL server and terminating the client SSL connection 
    attr_accessor :client_ssl_profile_binding

    # When load balancer can not select a backend server to serve the request in default pool or pool in rules, the request would be served by sorry server pool. 
    attr_accessor :sorry_pool_path

    # Configures the IP address of the LBVirtualServer where it receives all client connections and distributes them among the backend servers. 
    attr_accessor :ip_address

    # Ports contains a list of at least one port or port range such as \"80\", \"1234-1236\". Each port element in the list should be a single port or a single port range. 
    attr_accessor :ports

    # Flag to enable the load balancer virtual server.
    attr_accessor :enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'_self' => :'_self',
        :'_links' => :'_links',
        :'_schema' => :'_schema',
        :'_revision' => :'_revision',
        :'_system_owned' => :'_system_owned',
        :'display_name' => :'display_name',
        :'description' => :'description',
        :'tags' => :'tags',
        :'_create_user' => :'_create_user',
        :'_protection' => :'_protection',
        :'_create_time' => :'_create_time',
        :'_last_modified_time' => :'_last_modified_time',
        :'_last_modified_user' => :'_last_modified_user',
        :'id' => :'id',
        :'resource_type' => :'resource_type',
        :'path' => :'path',
        :'parent_path' => :'parent_path',
        :'unique_id' => :'unique_id',
        :'relative_path' => :'relative_path',
        :'children' => :'children',
        :'overridden' => :'overridden',
        :'marked_for_delete' => :'marked_for_delete',
        :'lb_persistence_profile_path' => :'lb_persistence_profile_path',
        :'access_list_control' => :'access_list_control',
        :'pool_path' => :'pool_path',
        :'log_significant_event_only' => :'log_significant_event_only',
        :'rules' => :'rules',
        :'default_pool_member_ports' => :'default_pool_member_ports',
        :'server_ssl_profile_binding' => :'server_ssl_profile_binding',
        :'application_profile_path' => :'application_profile_path',
        :'access_log_enabled' => :'access_log_enabled',
        :'max_concurrent_connections' => :'max_concurrent_connections',
        :'max_new_connection_rate' => :'max_new_connection_rate',
        :'lb_service_path' => :'lb_service_path',
        :'client_ssl_profile_binding' => :'client_ssl_profile_binding',
        :'sorry_pool_path' => :'sorry_pool_path',
        :'ip_address' => :'ip_address',
        :'ports' => :'ports',
        :'enabled' => :'enabled'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'_self' => :'SelfResourceLink',
        :'_links' => :'Array<ResourceLink>',
        :'_schema' => :'String',
        :'_revision' => :'Integer',
        :'_system_owned' => :'BOOLEAN',
        :'display_name' => :'String',
        :'description' => :'String',
        :'tags' => :'Array<Tag>',
        :'_create_user' => :'String',
        :'_protection' => :'String',
        :'_create_time' => :'Integer',
        :'_last_modified_time' => :'Integer',
        :'_last_modified_user' => :'String',
        :'id' => :'String',
        :'resource_type' => :'String',
        :'path' => :'String',
        :'parent_path' => :'String',
        :'unique_id' => :'String',
        :'relative_path' => :'String',
        :'children' => :'Array<ChildPolicyConfigResource>',
        :'overridden' => :'BOOLEAN',
        :'marked_for_delete' => :'BOOLEAN',
        :'lb_persistence_profile_path' => :'String',
        :'access_list_control' => :'LBAccessListControl',
        :'pool_path' => :'String',
        :'log_significant_event_only' => :'BOOLEAN',
        :'rules' => :'Array<LBRule>',
        :'default_pool_member_ports' => :'Array<String>',
        :'server_ssl_profile_binding' => :'LBServerSslProfileBinding',
        :'application_profile_path' => :'String',
        :'access_log_enabled' => :'BOOLEAN',
        :'max_concurrent_connections' => :'Integer',
        :'max_new_connection_rate' => :'Integer',
        :'lb_service_path' => :'String',
        :'client_ssl_profile_binding' => :'LBClientSslProfileBinding',
        :'sorry_pool_path' => :'String',
        :'ip_address' => :'String',
        :'ports' => :'Array<String>',
        :'enabled' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'_self')
        self._self = attributes[:'_self']
      end

      if attributes.has_key?(:'_links')
        if (value = attributes[:'_links']).is_a?(Array)
          self._links = value
        end
      end

      if attributes.has_key?(:'_schema')
        self._schema = attributes[:'_schema']
      end

      if attributes.has_key?(:'_revision')
        self._revision = attributes[:'_revision']
      end

      if attributes.has_key?(:'_system_owned')
        self._system_owned = attributes[:'_system_owned']
      end

      if attributes.has_key?(:'display_name')
        self.display_name = attributes[:'display_name']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'tags')
        if (value = attributes[:'tags']).is_a?(Array)
          self.tags = value
        end
      end

      if attributes.has_key?(:'_create_user')
        self._create_user = attributes[:'_create_user']
      end

      if attributes.has_key?(:'_protection')
        self._protection = attributes[:'_protection']
      end

      if attributes.has_key?(:'_create_time')
        self._create_time = attributes[:'_create_time']
      end

      if attributes.has_key?(:'_last_modified_time')
        self._last_modified_time = attributes[:'_last_modified_time']
      end

      if attributes.has_key?(:'_last_modified_user')
        self._last_modified_user = attributes[:'_last_modified_user']
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'resource_type')
        self.resource_type = attributes[:'resource_type']
      end

      if attributes.has_key?(:'path')
        self.path = attributes[:'path']
      end

      if attributes.has_key?(:'parent_path')
        self.parent_path = attributes[:'parent_path']
      end

      if attributes.has_key?(:'unique_id')
        self.unique_id = attributes[:'unique_id']
      end

      if attributes.has_key?(:'relative_path')
        self.relative_path = attributes[:'relative_path']
      end

      if attributes.has_key?(:'children')
        if (value = attributes[:'children']).is_a?(Array)
          self.children = value
        end
      end

      if attributes.has_key?(:'overridden')
        self.overridden = attributes[:'overridden']
      else
        self.overridden = false
      end

      if attributes.has_key?(:'marked_for_delete')
        self.marked_for_delete = attributes[:'marked_for_delete']
      else
        self.marked_for_delete = false
      end

      if attributes.has_key?(:'lb_persistence_profile_path')
        self.lb_persistence_profile_path = attributes[:'lb_persistence_profile_path']
      end

      if attributes.has_key?(:'access_list_control')
        self.access_list_control = attributes[:'access_list_control']
      end

      if attributes.has_key?(:'pool_path')
        self.pool_path = attributes[:'pool_path']
      end

      if attributes.has_key?(:'log_significant_event_only')
        self.log_significant_event_only = attributes[:'log_significant_event_only']
      else
        self.log_significant_event_only = false
      end

      if attributes.has_key?(:'rules')
        if (value = attributes[:'rules']).is_a?(Array)
          self.rules = value
        end
      end

      if attributes.has_key?(:'default_pool_member_ports')
        if (value = attributes[:'default_pool_member_ports']).is_a?(Array)
          self.default_pool_member_ports = value
        end
      end

      if attributes.has_key?(:'server_ssl_profile_binding')
        self.server_ssl_profile_binding = attributes[:'server_ssl_profile_binding']
      end

      if attributes.has_key?(:'application_profile_path')
        self.application_profile_path = attributes[:'application_profile_path']
      end

      if attributes.has_key?(:'access_log_enabled')
        self.access_log_enabled = attributes[:'access_log_enabled']
      else
        self.access_log_enabled = false
      end

      if attributes.has_key?(:'max_concurrent_connections')
        self.max_concurrent_connections = attributes[:'max_concurrent_connections']
      end

      if attributes.has_key?(:'max_new_connection_rate')
        self.max_new_connection_rate = attributes[:'max_new_connection_rate']
      end

      if attributes.has_key?(:'lb_service_path')
        self.lb_service_path = attributes[:'lb_service_path']
      end

      if attributes.has_key?(:'client_ssl_profile_binding')
        self.client_ssl_profile_binding = attributes[:'client_ssl_profile_binding']
      end

      if attributes.has_key?(:'sorry_pool_path')
        self.sorry_pool_path = attributes[:'sorry_pool_path']
      end

      if attributes.has_key?(:'ip_address')
        self.ip_address = attributes[:'ip_address']
      end

      if attributes.has_key?(:'ports')
        if (value = attributes[:'ports']).is_a?(Array)
          self.ports = value
        end
      end

      if attributes.has_key?(:'enabled')
        self.enabled = attributes[:'enabled']
      else
        self.enabled = true
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@display_name.nil? && @display_name.to_s.length > 255
        invalid_properties.push('invalid value for "display_name", the character length must be smaller than or equal to 255.')
      end

      if !@description.nil? && @description.to_s.length > 1024
        invalid_properties.push('invalid value for "description", the character length must be smaller than or equal to 1024.')
      end

      if @application_profile_path.nil?
        invalid_properties.push('invalid value for "application_profile_path", application_profile_path cannot be nil.')
      end

      if !@max_concurrent_connections.nil? && @max_concurrent_connections > 2147483647
        invalid_properties.push('invalid value for "max_concurrent_connections", must be smaller than or equal to 2147483647.')
      end

      if !@max_concurrent_connections.nil? && @max_concurrent_connections < 1
        invalid_properties.push('invalid value for "max_concurrent_connections", must be greater than or equal to 1.')
      end

      if !@max_new_connection_rate.nil? && @max_new_connection_rate > 2147483647
        invalid_properties.push('invalid value for "max_new_connection_rate", must be smaller than or equal to 2147483647.')
      end

      if !@max_new_connection_rate.nil? && @max_new_connection_rate < 1
        invalid_properties.push('invalid value for "max_new_connection_rate", must be greater than or equal to 1.')
      end

      if @ip_address.nil?
        invalid_properties.push('invalid value for "ip_address", ip_address cannot be nil.')
      end

      if @ports.nil?
        invalid_properties.push('invalid value for "ports", ports cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@display_name.nil? && @display_name.to_s.length > 255
      return false if !@description.nil? && @description.to_s.length > 1024
      return false if @application_profile_path.nil?
      return false if !@max_concurrent_connections.nil? && @max_concurrent_connections > 2147483647
      return false if !@max_concurrent_connections.nil? && @max_concurrent_connections < 1
      return false if !@max_new_connection_rate.nil? && @max_new_connection_rate > 2147483647
      return false if !@max_new_connection_rate.nil? && @max_new_connection_rate < 1
      return false if @ip_address.nil?
      return false if @ports.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] display_name Value to be assigned
    def display_name=(display_name)
      if !display_name.nil? && display_name.to_s.length > 255
        fail ArgumentError, 'invalid value for "display_name", the character length must be smaller than or equal to 255.'
      end

      @display_name = display_name
    end

    # Custom attribute writer method with validation
    # @param [Object] description Value to be assigned
    def description=(description)
      if !description.nil? && description.to_s.length > 1024
        fail ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 1024.'
      end

      @description = description
    end

    # Custom attribute writer method with validation
    # @param [Object] max_concurrent_connections Value to be assigned
    def max_concurrent_connections=(max_concurrent_connections)
      if !max_concurrent_connections.nil? && max_concurrent_connections > 2147483647
        fail ArgumentError, 'invalid value for "max_concurrent_connections", must be smaller than or equal to 2147483647.'
      end

      if !max_concurrent_connections.nil? && max_concurrent_connections < 1
        fail ArgumentError, 'invalid value for "max_concurrent_connections", must be greater than or equal to 1.'
      end

      @max_concurrent_connections = max_concurrent_connections
    end

    # Custom attribute writer method with validation
    # @param [Object] max_new_connection_rate Value to be assigned
    def max_new_connection_rate=(max_new_connection_rate)
      if !max_new_connection_rate.nil? && max_new_connection_rate > 2147483647
        fail ArgumentError, 'invalid value for "max_new_connection_rate", must be smaller than or equal to 2147483647.'
      end

      if !max_new_connection_rate.nil? && max_new_connection_rate < 1
        fail ArgumentError, 'invalid value for "max_new_connection_rate", must be greater than or equal to 1.'
      end

      @max_new_connection_rate = max_new_connection_rate
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          _self == o._self &&
          _links == o._links &&
          _schema == o._schema &&
          _revision == o._revision &&
          _system_owned == o._system_owned &&
          display_name == o.display_name &&
          description == o.description &&
          tags == o.tags &&
          _create_user == o._create_user &&
          _protection == o._protection &&
          _create_time == o._create_time &&
          _last_modified_time == o._last_modified_time &&
          _last_modified_user == o._last_modified_user &&
          id == o.id &&
          resource_type == o.resource_type &&
          path == o.path &&
          parent_path == o.parent_path &&
          unique_id == o.unique_id &&
          relative_path == o.relative_path &&
          children == o.children &&
          overridden == o.overridden &&
          marked_for_delete == o.marked_for_delete &&
          lb_persistence_profile_path == o.lb_persistence_profile_path &&
          access_list_control == o.access_list_control &&
          pool_path == o.pool_path &&
          log_significant_event_only == o.log_significant_event_only &&
          rules == o.rules &&
          default_pool_member_ports == o.default_pool_member_ports &&
          server_ssl_profile_binding == o.server_ssl_profile_binding &&
          application_profile_path == o.application_profile_path &&
          access_log_enabled == o.access_log_enabled &&
          max_concurrent_connections == o.max_concurrent_connections &&
          max_new_connection_rate == o.max_new_connection_rate &&
          lb_service_path == o.lb_service_path &&
          client_ssl_profile_binding == o.client_ssl_profile_binding &&
          sorry_pool_path == o.sorry_pool_path &&
          ip_address == o.ip_address &&
          ports == o.ports &&
          enabled == o.enabled
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [_self, _links, _schema, _revision, _system_owned, display_name, description, tags, _create_user, _protection, _create_time, _last_modified_time, _last_modified_user, id, resource_type, path, parent_path, unique_id, relative_path, children, overridden, marked_for_delete, lb_persistence_profile_path, access_list_control, pool_path, log_significant_event_only, rules, default_pool_member_ports, server_ssl_profile_binding, application_profile_path, access_log_enabled, max_concurrent_connections, max_new_connection_rate, lb_service_path, client_ssl_profile_binding, sorry_pool_path, ip_address, ports, enabled].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = NSXTPolicy.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end