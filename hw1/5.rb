class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(attr_name)
        @attr_name = attr_name
        
        if !@#{attr_name}_history
          @#{attr_name}_history = Array.new
          @#{attr_name}_history << nil
          @#{attr_name}_history << attr_name
        else
          @#{attr_name}_history << attr_name
        end
      end
    }    #"your code here, use %Q for multiline strings"
  end
end

class Foo
  attr_accessor_with_history :bar
end

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      return self * @@currencies[singular_currency]
    else
        super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    self / @@currencies[singular_currency]
  end
end

def palindrome_s?(string)
  string = string.downcase
  string = string.gsub(/[^a-z]/,'')
  return string == string.reverse
end

class String
  def method_missing(method_id)
      if method_id.to_s == "palindrome?"
        return palindrome_s?(self)
      else
        super
      end
  end
end

module Enumerable
  def palindrome?
    return self.to_a == self.to_a.reverse
  end
end


#puts "Palindrome?"
#puts [1,2,3,2,1].palindrome?
#puts [1,2,3,1,1].palindrome?
#puts [].palindrome?
#puts [123,2,33,2,1].palindrome?
#
#puts "Palindrome?2"
#puts "111 => "+ "111".palindrome?.to_s
#puts "A man, a plan, a canal -- Panama => "+ "A man, a plan, a canal -- Panama".palindrome?.to_s
#puts "Doo bee doo bee doo => "+ "Doo bee doo bee doo".palindrome?.to_s
#puts " =>" + "".palindrome?.to_s
#puts "foo => " + "foo".palindrome?.to_s
#
#puts "Converter"
#puts 5.dollars.in(:euros)
#puts 10.euros.in(:rupees)
#puts 1.dollar.in(:rupees)
#puts 10.rupees.in(:euro) 
#
#puts 10.dollars.in(:rupee) 
#puts 10.dollars.in(:yen) 
#puts 10.dollars.in(:euro) 
#puts 10.dollars.in(:rupees) 
#puts 10.dollars.in(:yens) 
#puts 10.dollars.in(:euros) 
#puts 10.rupees.in(:yen)
#puts 10.euros.in(:rupees)
#puts 10.yen.in(:euros)
#
#puts "attr_accessor"
#f = Foo.new
#f.bar = 1
#f.bar = 2
#puts f.bar_history.to_s # => if your code works, should be [nil,1,2]