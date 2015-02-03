# encoding: utf-8

require 'cinch'
require 'open-uri'

module Cinch
  module Plugins
    class Medals
      include Cinch::Plugin

      set plugin_name: "Medals"

      match /ol\s?(.+)?/
      def execute(m, c)
        if c.nil?
          c = "Norway"
        end

        url = "http://olympics.api.tmn.io/medals/" + c
        data = JSON.parse(open(url).read)[0]

        # debug data.to_s

        if (data["t"] == 0)
          m.reply "Medaljer i Sotsji: #{data["c"]} har ingen medaler"
        else
          m.reply "Medaljer i Sotsji (#{data["c"]}): #{data["g"]} gull, #{data["s"]} sølv og #{data["b"]} bronse"
        end
      end
    end
  end
end