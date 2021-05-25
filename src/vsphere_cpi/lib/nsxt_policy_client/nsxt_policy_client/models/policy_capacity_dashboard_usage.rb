=begin
#NSX-T Data Center Policy API

#VMware NSX-T Data Center Policy REST API

OpenAPI spec version: 3.1.0.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.19

=end

require 'date'

module NSXTPolicy
  class PolicyCapacityDashboardUsage
    # Indicate the current usage count of object type. 
    attr_accessor :current_usage_count

    # Indicate the object type for which usage is calculated. 
    attr_accessor :usage_type

    # Display name for NSX object type. 
    attr_accessor :display_name

    # Current usage percentage for object type 
    attr_accessor :current_usage_percentage

    # This is the maximum supported count for object type in consideration. 
    attr_accessor :max_supported_count

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
        :'current_usage_count' => :'current_usage_count',
        :'usage_type' => :'usage_type',
        :'display_name' => :'display_name',
        :'current_usage_percentage' => :'current_usage_percentage',
        :'max_supported_count' => :'max_supported_count'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'current_usage_count' => :'Integer',
        :'usage_type' => :'String',
        :'display_name' => :'String',
        :'current_usage_percentage' => :'Float',
        :'max_supported_count' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'current_usage_count')
        self.current_usage_count = attributes[:'current_usage_count']
      end

      if attributes.has_key?(:'usage_type')
        self.usage_type = attributes[:'usage_type']
      end

      if attributes.has_key?(:'display_name')
        self.display_name = attributes[:'display_name']
      end

      if attributes.has_key?(:'current_usage_percentage')
        self.current_usage_percentage = attributes[:'current_usage_percentage']
      end

      if attributes.has_key?(:'max_supported_count')
        self.max_supported_count = attributes[:'max_supported_count']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @current_usage_count.nil?
        invalid_properties.push('invalid value for "current_usage_count", current_usage_count cannot be nil.')
      end

      if @usage_type.nil?
        invalid_properties.push('invalid value for "usage_type", usage_type cannot be nil.')
      end

      if @display_name.nil?
        invalid_properties.push('invalid value for "display_name", display_name cannot be nil.')
      end

      if @current_usage_percentage.nil?
        invalid_properties.push('invalid value for "current_usage_percentage", current_usage_percentage cannot be nil.')
      end

      if @max_supported_count.nil?
        invalid_properties.push('invalid value for "max_supported_count", max_supported_count cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @current_usage_count.nil?
      return false if @usage_type.nil?
      usage_type_validator = EnumAttributeValidator.new('String', ['NUMBER_OF_VSPHERE_CLUSTERS', 'NUMBER_OF_PREPARED_HOSTS', 'NUMBER_OF_GROUPS', 'NUMBER_OF_SEGMENT', 'NUMBER_OF_SEGMENT_PORT', 'NUMBER_OF_FIREWALL_RULES', 'NUMBER_OF_FIREWALL_SECTIONS', 'NUMBER_OF_SECURITY_POLICY_RULES', 'NUMBER_OF_SECURITY_POLICY', 'NUMBER_OF_PROTECTION_ENABLED_HOST', 'NUMBER_OF_PROTECTION_ENABLED_VIRTUAL_MACHINES', 'NUMBER_OF_EDGE_CLUSTERS', 'NUMBER_OF_EDGE_NODES', 'NUMBER_OF_TIER0_ROUTERS', 'NUMBER_OF_TIER1_ROUTERS', 'NUMBER_OF_PREFIX_LIST', 'NUMBER_OF_NAT_RULES', 'NUMBER_OF_DHCP_IP_POOLS', 'NUMBER_OF_TIER1_WITH_NAT_RULE'])
      return false unless usage_type_validator.valid?(@usage_type)
      return false if @display_name.nil?
      return false if @current_usage_percentage.nil?
      return false if @max_supported_count.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] usage_type Object to be assigned
    def usage_type=(usage_type)
      validator = EnumAttributeValidator.new('String', ['NUMBER_OF_VSPHERE_CLUSTERS', 'NUMBER_OF_PREPARED_HOSTS', 'NUMBER_OF_GROUPS', 'NUMBER_OF_SEGMENT', 'NUMBER_OF_SEGMENT_PORT', 'NUMBER_OF_FIREWALL_RULES', 'NUMBER_OF_FIREWALL_SECTIONS', 'NUMBER_OF_SECURITY_POLICY_RULES', 'NUMBER_OF_SECURITY_POLICY', 'NUMBER_OF_PROTECTION_ENABLED_HOST', 'NUMBER_OF_PROTECTION_ENABLED_VIRTUAL_MACHINES', 'NUMBER_OF_EDGE_CLUSTERS', 'NUMBER_OF_EDGE_NODES', 'NUMBER_OF_TIER0_ROUTERS', 'NUMBER_OF_TIER1_ROUTERS', 'NUMBER_OF_PREFIX_LIST', 'NUMBER_OF_NAT_RULES', 'NUMBER_OF_DHCP_IP_POOLS', 'NUMBER_OF_TIER1_WITH_NAT_RULE'])
      unless validator.valid?(usage_type)
        fail ArgumentError, 'invalid value for "usage_type", must be one of #{validator.allowable_values}.'
      end
      @usage_type = usage_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          current_usage_count == o.current_usage_count &&
          usage_type == o.usage_type &&
          display_name == o.display_name &&
          current_usage_percentage == o.current_usage_percentage &&
          max_supported_count == o.max_supported_count
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [current_usage_count, usage_type, display_name, current_usage_percentage, max_supported_count].hash
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