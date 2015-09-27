# -*- coding: utf-8 -*-

=begin
ツイートのURLをコピーするためのmikutterコマンドを追加
=end

Module.new do
  Plugin.create(:copy_tweet_url).add_event_filter(:command){ |menu|
    menu[:copy_tweet_url] = {
      :slug => :copy_tweet_url,
      :name => 'ツイートのURLをコピー',
      :condition => Plugin::Command[:HasOneMessage],
      :exec => lambda{ |e| msg = e.messages[0] ; Gtk::Clipboard.copy("https://twitter.com/#{msg[:user].idname}/status/#{msg[:id_str]}") },
      :visible => true,
      :role => :timeline }
    [menu]
  }
end
