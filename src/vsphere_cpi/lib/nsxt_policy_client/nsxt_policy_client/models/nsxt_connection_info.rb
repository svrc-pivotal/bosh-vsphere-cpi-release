=begin
#NSX-T Data Center Policy API

#VMware NSX-T Data Center Policy REST API

OpenAPI spec version: 3.1.0.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.19

=end

require 'date'

module NSXTPolicy
  # Credential info to connect to an NSX-T type of enforcement point.
  class NSXTConnectionInfo
    # Value of this property could be Hostname or IP. For instance: - On an NSX-T MP running on default port, the value could be \"10.192.1.1\" - On an NSX-T MP running on custom port, the value could be \"192.168.1.1:32789\" - On an NSX-T MP in VMC deployments, the value could be \"192.168.1.1:5480/nsxapi\" 
    attr_accessor :enforcement_point_address

    # Resource Type of Enforcement Point Connection Info.
    attr_accessor :resource_type

    # Username.
    attr_accessor :username

    # Transport Zone UUIDs on enforcement point. Transport zone information is required for creating logical L2, L3 constructs on enforcement point. Max 1 transport zone ID. This is a deprecated property. The transport zone id is now auto populated from enforcement point and its value can be read using APIs GET /infra/sites/site-id/enforcement-points/enforcementpoint-id/transport-zones and GET /infra/sites/site-id/enforcement-points/enforcementpoint-id/transport-zones/transport-zone-id. The value passed through this property will be ignored. 
    attr_accessor :transport_zone_ids

    # Password.
    attr_accessor :password

    # Edge Cluster UUIDs on enforcement point. Edge cluster information is required for creating logical L2, L3 constructs on enforcement point. Max 1 edge cluster ID. This is a deprecated property. The edge cluster id is now auto populated from enforcement point and its value can be read using APIs GET /infra/sites/site-id/enforcement-points/enforcementpoint-id/edge-clusters and GET /infra/sites/site-id/enforcement-points/enforcementpoint-1/edge-clusters/edge-cluster-id. The value passed through this property will be ignored. 
    attr_accessor :edge_cluster_ids

    # Thumbprint of EnforcementPoint in the form of a SHA-256 hash represented in lower case HEX. 
    attr_accessor :thumbprint

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
        :'enforcement_point_address' => :'enforcement_point_address',
        :'resource_type' => :'resource_type',
        :'username' => :'username',
        :'transport_zone_ids' => :'transport_zone_ids',
        :'password' => :'password',
        :'edge_cluster_ids' => :'edge_cluster_ids',
        :'thumbprint' => :'thumbprint'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'enforcement_point_address' => :'String',
        :'resource_type' => :'String',
        :'username' => :'String',
        :'transport_zone_ids' => :'Array<String>',
        :'password' => :'String',
        :'edge_cluster_ids' => :'Array<String>',
        :'thumbprint' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'enforcement_point_address')
        self.enforcement_point_address = attributes[:'enforcement_point_address']
      end

      if attributes.has_key?(:'resource_type')
        self.resource_type = attributes[:'resource_type']
      end

      if attributes.has_key?(:'username')
        self.username = attributes[:'username']
      end

      if attributes.has_key?(:'transport_zone_ids')
        if (value = attributes[:'transport_zone_ids']).is_a?(Array)
          self.transport_zone_ids = value
        end
      end

      if attributes.has_key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.has_key?(:'edge_cluster_ids')
        if (value = attributes[:'edge_cluster_ids']).is_a?(Array)
          self.edge_cluster_ids = value
        end
      end

      if attributes.has_key?(:'thumbprint')
        self.thumbprint = attributes[:'thumbprint']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @enforcement_point_address.nil?
        invalid_properties.push('invalid value for "enforcement_point_address", enforcement_point_address cannot be nil.')
      end

      if @resource_type.nil?
        invalid_properties.push('invalid value for "resource_type", resource_type cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @enforcement_point_address.nil?
      return false if @resource_type.nil?
      resource_type_validator = EnumAttributeValidator.new('String', ['NSXTConnectionInfo', 'NSXVConnectionInfo', 'CvxConnectionInfo'])
      return false unless resource_type_validator.valid?(@resource_type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_type Object to be assigned
    def resource_type=(resource_type)
      validator = EnumAttributeValidator.new('String', ['NSXTConnectionInfo', 'NSXVConnectionInfo', 'CvxConnectionInfo'])
      unless validator.valid?(resource_type)
        fail ArgumentError, 'invalid value for "resource_type", must be one of #{validator.allowable_values}.'
      end
      @resource_type = resource_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          enforcement_point_address == o.enforcement_point_address &&
          resource_type == o.resource_type &&
          username == o.username &&
          transport_zone_ids == o.transport_zone_ids &&
          password == o.password &&
          edge_cluster_ids == o.edge_cluster_ids &&
          thumbprint == o.thumbprint
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [enforcement_point_address, resource_type, username, transport_zone_ids, password, edge_cluster_ids, thumbprint].hash
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