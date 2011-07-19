# -*- coding: utf-8 -*-

=begin
ツイートのURLをコピーするためのmikutterコマンドを追加
=end

Module.new do
  Plugin.create(:copy_tweet_url).add_event_filter(:command){ |menu|
    menu[:copy_tweet_url] = {
      :slug => :copy_tweet_url,
      :name => 'ツイートのURLをコピー',
      :condition => lambda{ |m| m.message.repliable? },
      :exec => lambda{ |m| Gtk::Clipboard.copy("http://twitter.com/#!/#{m.message.user.idname}/status/#{m.message[:id]}") },
      :visible => true,
      :role => :message }
    [menu]
  }
end
