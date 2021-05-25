=begin
#NSX-T Manager API

#VMware NSX-T Manager REST API

OpenAPI spec version: 2.5.1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.19

=end

require 'date'

module NSXT
  class BgpNeighbor
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

    # BGP Graceful Restart mode. If specified, then it will take precedence over global Graceful Restart mode configured in logical router BgpConfig otherwise BgpConfig level Graceful Restart mode will be applicable for peer. 
    attr_accessor :graceful_restart_mode

    # This is a deprecated property, Please use 'remote_as_num' instead.
    attr_accessor :remote_as

    # This is a deprecated property, Please use 'address_family' instead.
    attr_accessor :filter_out_ipprefixlist_id

    # Wait period (seconds) before declaring peer dead
    attr_accessor :hold_down_timer

    # BGP neighborship will be formed from all these source addresses to this neighbour.
    attr_accessor :source_addresses

    # This value is set on TTL(time to live) of BGP header. When router receives the BGP packet, it decrements the TTL. The default value of TTL is one when BPG request is initiated.So in the case of a BGP peer multiple hops away and and value of TTL is one, then  next router in the path will decrement the TTL to 0, realize it cant forward the packet and will drop it. If the hop count value to reach neighbor is equal to or less than the maximum_hop_limit value then intermediate router decrements the TTL count by one and forwards the request to BGP neighour. If the hop count value is greater than the maximum_hop_limit value then intermediate router discards the request when TTL becomes 0. 
    attr_accessor :maximum_hop_limit

    # Flag to enable this BGP Neighbor
    attr_accessor :enabled

    # 4 Byte ASN of the neighbor in ASPLAIN/ASDOT Format
    attr_accessor :remote_as_num

    # User can enable the neighbor for the specific address families and also define filters per address family. When the neighbor is created, it is default enabled for IPV4_UNICAST address family for backward compatibility reasons. User can change that if required, by defining the address family configuration. 
    attr_accessor :address_families

    # By specifying these paramaters BFD config for this given peer can be overriden | (the globally configured values will not apply for this peer)
    attr_accessor :bfd_config

    # Logical router id
    attr_accessor :logical_router_id

    # This is a deprecated property, Please  use 'address_family' instead.
    attr_accessor :filter_in_ipprefixlist_id

    # This is a deprecated property, Please use 'address_family' instead.
    attr_accessor :filter_out_routemap_id

    # This is a deprecated property, Please use 'address_family' instead.
    attr_accessor :filter_in_routemap_id

    # Frequency (seconds) with which keep alive messages are sent to peers
    attr_accessor :keep_alive_timer

    # User can create (POST) the neighbor with or without the password. The view (GET) on the neighbor, would never reveal if the password is set or not. The password can be set later using edit neighbor workFlow (PUT) On the edit neighbor (PUT), if the user does not specify the password property, the older value is retained. Maximum length of this field is 20 characters. 
    attr_accessor :password

    # Deprecated - do not provide a value for this field. Use source_addresses instead.
    attr_accessor :source_address

    # Flag to enable allowas_in option for BGP neighbor
    attr_accessor :allow_as_in

    # Flag to enable BFD for this BGP Neighbor. Enable this if the neighbor supports BFD as this will lead to faster convergence.
    attr_accessor :enable_bfd

    # Neighbor IP Address
    attr_accessor :neighbor_address

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

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
        :'graceful_restart_mode' => :'graceful_restart_mode',
        :'remote_as' => :'remote_as',
        :'filter_out_ipprefixlist_id' => :'filter_out_ipprefixlist_id',
        :'hold_down_timer' => :'hold_down_timer',
        :'source_addresses' => :'source_addresses',
        :'maximum_hop_limit' => :'maximum_hop_limit',
        :'enabled' => :'enabled',
        :'remote_as_num' => :'remote_as_num',
        :'address_families' => :'address_families',
        :'bfd_config' => :'bfd_config',
        :'logical_router_id' => :'logical_router_id',
        :'filter_in_ipprefixlist_id' => :'filter_in_ipprefixlist_id',
        :'filter_out_routemap_id' => :'filter_out_routemap_id',
        :'filter_in_routemap_id' => :'filter_in_routemap_id',
        :'keep_alive_timer' => :'keep_alive_timer',
        :'password' => :'password',
        :'source_address' => :'source_address',
        :'allow_as_in' => :'allow_as_in',
        :'enable_bfd' => :'enable_bfd',
        :'neighbor_address' => :'neighbor_address'
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
        :'graceful_restart_mode' => :'String',
        :'remote_as' => :'Integer',
        :'filter_out_ipprefixlist_id' => :'String',
        :'hold_down_timer' => :'Integer',
        :'source_addresses' => :'Array<String>',
        :'maximum_hop_limit' => :'Integer',
        :'enabled' => :'BOOLEAN',
        :'remote_as_num' => :'String',
        :'address_families' => :'Array<BgpNeighborAddressFamily>',
        :'bfd_config' => :'BfdConfigParameters',
        :'logical_router_id' => :'String',
        :'filter_in_ipprefixlist_id' => :'String',
        :'filter_out_routemap_id' => :'String',
        :'filter_in_routemap_id' => :'String',
        :'keep_alive_timer' => :'Integer',
        :'password' => :'String',
        :'source_address' => :'String',
        :'allow_as_in' => :'BOOLEAN',
        :'enable_bfd' => :'BOOLEAN',
        :'neighbor_address' => :'String'
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

      if attributes.has_key?(:'graceful_restart_mode')
        self.graceful_restart_mode = attributes[:'graceful_restart_mode']
      end

      if attributes.has_key?(:'remote_as')
        self.remote_as = attributes[:'remote_as']
      end

      if attributes.has_key?(:'filter_out_ipprefixlist_id')
        self.filter_out_ipprefixlist_id = attributes[:'filter_out_ipprefixlist_id']
      end

      if attributes.has_key?(:'hold_down_timer')
        self.hold_down_timer = attributes[:'hold_down_timer']
      else
        self.hold_down_timer = 180
      end

      if attributes.has_key?(:'source_addresses')
        if (value = attributes[:'source_addresses']).is_a?(Array)
          self.source_addresses = value
        end
      end

      if attributes.has_key?(:'maximum_hop_limit')
        self.maximum_hop_limit = attributes[:'maximum_hop_limit']
      else
        self.maximum_hop_limit = 1
      end

      if attributes.has_key?(:'enabled')
        self.enabled = attributes[:'enabled']
      else
        self.enabled = true
      end

      if attributes.has_key?(:'remote_as_num')
        self.remote_as_num = attributes[:'remote_as_num']
      end

      if attributes.has_key?(:'address_families')
        if (value = attributes[:'address_families']).is_a?(Array)
          self.address_families = value
        end
      end

      if attributes.has_key?(:'bfd_config')
        self.bfd_config = attributes[:'bfd_config']
      end

      if attributes.has_key?(:'logical_router_id')
        self.logical_router_id = attributes[:'logical_router_id']
      end

      if attributes.has_key?(:'filter_in_ipprefixlist_id')
        self.filter_in_ipprefixlist_id = attributes[:'filter_in_ipprefixlist_id']
      end

      if attributes.has_key?(:'filter_out_routemap_id')
        self.filter_out_routemap_id = attributes[:'filter_out_routemap_id']
      end

      if attributes.has_key?(:'filter_in_routemap_id')
        self.filter_in_routemap_id = attributes[:'filter_in_routemap_id']
      end

      if attributes.has_key?(:'keep_alive_timer')
        self.keep_alive_timer = attributes[:'keep_alive_timer']
      else
        self.keep_alive_timer = 60
      end

      if attributes.has_key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.has_key?(:'source_address')
        self.source_address = attributes[:'source_address']
      end

      if attributes.has_key?(:'allow_as_in')
        self.allow_as_in = attributes[:'allow_as_in']
      else
        self.allow_as_in = false
      end

      if attributes.has_key?(:'enable_bfd')
        self.enable_bfd = attributes[:'enable_bfd']
      else
        self.enable_bfd = false
      end

      if attributes.has_key?(:'neighbor_address')
        self.neighbor_address = attributes[:'neighbor_address']
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

      if !@remote_as.nil? && @remote_as > 4294967296
        invalid_properties.push('invalid value for "remote_as", must be smaller than or equal to 4294967296.')
      end

      if !@remote_as.nil? && @remote_as < 1
        invalid_properties.push('invalid value for "remote_as", must be greater than or equal to 1.')
      end

      if !@hold_down_timer.nil? && @hold_down_timer > 65535
        invalid_properties.push('invalid value for "hold_down_timer", must be smaller than or equal to 65535.')
      end

      if !@hold_down_timer.nil? && @hold_down_timer < 1
        invalid_properties.push('invalid value for "hold_down_timer", must be greater than or equal to 1.')
      end

      if !@maximum_hop_limit.nil? && @maximum_hop_limit > 255
        invalid_properties.push('invalid value for "maximum_hop_limit", must be smaller than or equal to 255.')
      end

      if !@maximum_hop_limit.nil? && @maximum_hop_limit < 1
        invalid_properties.push('invalid value for "maximum_hop_limit", must be greater than or equal to 1.')
      end

      if !@keep_alive_timer.nil? && @keep_alive_timer > 65535
        invalid_properties.push('invalid value for "keep_alive_timer", must be smaller than or equal to 65535.')
      end

      if !@keep_alive_timer.nil? && @keep_alive_timer < 1
        invalid_properties.push('invalid value for "keep_alive_timer", must be greater than or equal to 1.')
      end

      if !@password.nil? && @password.to_s.length < 1
        invalid_properties.push('invalid value for "password", the character length must be great than or equal to 1.')
      end

      if @neighbor_address.nil?
        invalid_properties.push('invalid value for "neighbor_address", neighbor_address cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@display_name.nil? && @display_name.to_s.length > 255
      return false if !@description.nil? && @description.to_s.length > 1024
      graceful_restart_mode_validator = EnumAttributeValidator.new('String', ['DISABLE', 'HELPER_ONLY', 'GR_AND_HELPER'])
      return false unless graceful_restart_mode_validator.valid?(@graceful_restart_mode)
      return false if !@remote_as.nil? && @remote_as > 4294967296
      return false if !@remote_as.nil? && @remote_as < 1
      return false if !@hold_down_timer.nil? && @hold_down_timer > 65535
      return false if !@hold_down_timer.nil? && @hold_down_timer < 1
      return false if !@maximum_hop_limit.nil? && @maximum_hop_limit > 255
      return false if !@maximum_hop_limit.nil? && @maximum_hop_limit < 1
      return false if !@keep_alive_timer.nil? && @keep_alive_timer > 65535
      return false if !@keep_alive_timer.nil? && @keep_alive_timer < 1
      return false if !@password.nil? && @password.to_s.length < 1
      return false if @neighbor_address.nil?
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] graceful_restart_mode Object to be assigned
    def graceful_restart_mode=(graceful_restart_mode)
      validator = EnumAttributeValidator.new('String', ['DISABLE', 'HELPER_ONLY', 'GR_AND_HELPER'])
      unless validator.valid?(graceful_restart_mode)
        fail ArgumentError, 'invalid value for "graceful_restart_mode", must be one of #{validator.allowable_values}.'
      end
      @graceful_restart_mode = graceful_restart_mode
    end

    # Custom attribute writer method with validation
    # @param [Object] remote_as Value to be assigned
    def remote_as=(remote_as)
      if !remote_as.nil? && remote_as > 4294967296
        fail ArgumentError, 'invalid value for "remote_as", must be smaller than or equal to 4294967296.'
      end

      if !remote_as.nil? && remote_as < 1
        fail ArgumentError, 'invalid value for "remote_as", must be greater than or equal to 1.'
      end

      @remote_as = remote_as
    end

    # Custom attribute writer method with validation
    # @param [Object] hold_down_timer Value to be assigned
    def hold_down_timer=(hold_down_timer)
      if !hold_down_timer.nil? && hold_down_timer > 65535
        fail ArgumentError, 'invalid value for "hold_down_timer", must be smaller than or equal to 65535.'
      end

      if !hold_down_timer.nil? && hold_down_timer < 1
        fail ArgumentError, 'invalid value for "hold_down_timer", must be greater than or equal to 1.'
      end

      @hold_down_timer = hold_down_timer
    end

    # Custom attribute writer method with validation
    # @param [Object] maximum_hop_limit Value to be assigned
    def maximum_hop_limit=(maximum_hop_limit)
      if !maximum_hop_limit.nil? && maximum_hop_limit > 255
        fail ArgumentError, 'invalid value for "maximum_hop_limit", must be smaller than or equal to 255.'
      end

      if !maximum_hop_limit.nil? && maximum_hop_limit < 1
        fail ArgumentError, 'invalid value for "maximum_hop_limit", must be greater than or equal to 1.'
      end

      @maximum_hop_limit = maximum_hop_limit
    end

    # Custom attribute writer method with validation
    # @param [Object] keep_alive_timer Value to be assigned
    def keep_alive_timer=(keep_alive_timer)
      if !keep_alive_timer.nil? && keep_alive_timer > 65535
        fail ArgumentError, 'invalid value for "keep_alive_timer", must be smaller than or equal to 65535.'
      end

      if !keep_alive_timer.nil? && keep_alive_timer < 1
        fail ArgumentError, 'invalid value for "keep_alive_timer", must be greater than or equal to 1.'
      end

      @keep_alive_timer = keep_alive_timer
    end

    # Custom attribute writer method with validation
    # @param [Object] password Value to be assigned
    def password=(password)
      if !password.nil? && password.to_s.length < 1
        fail ArgumentError, 'invalid value for "password", the character length must be great than or equal to 1.'
      end

      @password = password
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
          graceful_restart_mode == o.graceful_restart_mode &&
          remote_as == o.remote_as &&
          filter_out_ipprefixlist_id == o.filter_out_ipprefixlist_id &&
          hold_down_timer == o.hold_down_timer &&
          source_addresses == o.source_addresses &&
          maximum_hop_limit == o.maximum_hop_limit &&
          enabled == o.enabled &&
          remote_as_num == o.remote_as_num &&
          address_families == o.address_families &&
          bfd_config == o.bfd_config &&
          logical_router_id == o.logical_router_id &&
          filter_in_ipprefixlist_id == o.filter_in_ipprefixlist_id &&
          filter_out_routemap_id == o.filter_out_routemap_id &&
          filter_in_routemap_id == o.filter_in_routemap_id &&
          keep_alive_timer == o.keep_alive_timer &&
          password == o.password &&
          source_address == o.source_address &&
          allow_as_in == o.allow_as_in &&
          enable_bfd == o.enable_bfd &&
          neighbor_address == o.neighbor_address
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [_self, _links, _schema, _revision, _system_owned, display_name, description, tags, _create_user, _protection, _create_time, _last_modified_time, _last_modified_user, id, resource_type, graceful_restart_mode, remote_as, filter_out_ipprefixlist_id, hold_down_timer, source_addresses, maximum_hop_limit, enabled, remote_as_num, address_families, bfd_config, logical_router_id, filter_in_ipprefixlist_id, filter_out_routemap_id, filter_in_routemap_id, keep_alive_timer, password, source_address, allow_as_in, enable_bfd, neighbor_address].hash
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
        temp_model = NSXT.const_get(type).new
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