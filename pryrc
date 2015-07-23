if defined?(PryByebug)
  Pry.commands.alias_command 'con', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

begin
  require 'awesome_print'

  module AwesomePrint
    class Formatter

      private

      def awesome_self(object, type)
        if @options[:raw] && object.instance_variables.any?
          awesome_object(object)
        elsif object.respond_to?(:to_hash)
          awesome_hash(object.to_hash)
        else
          colorize(object.inspect.to_s, type)
        end
      end
    end
  end

  AwesomePrint.pry!
rescue
  puts 'There is no Awesome Print gem installed'
end

Pry.hooks.add_hook :after_read, :hack_utf8 do |str, _|
  str.force_encoding('utf-8')
end
